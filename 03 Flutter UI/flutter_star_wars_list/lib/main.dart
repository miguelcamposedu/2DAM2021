import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/people_response.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Person>> items;

  @override
  void initState() {
    items = fetchPeople();
    super.initState();
  }

  bool lightMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Star Wars',
              style: TextStyle(
                fontFamily: 'Jedi',
              )),
          actions: [GestureDetector(child: Icon(Icons.wb_sunny), onTap: () {
            setState(() {
              lightMode = !lightMode;
            });
           })],
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 10),
            color: _getBackgroundColor(),
            child: Center(
                child: FutureBuilder<List<Person>>(
              future: items,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        child: const Text(
                          'People',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Jedi'),
                        ),
                      ),
                      _peopleList(snapshot.data!)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ))));
  }

  _getBackgroundColor() {
    return lightMode ? const Color(0xff000000) : const Color(0xfff1f1f1);
  }

  Future<List<Person>> fetchPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load people');
    }
  }

  Widget _peopleList(List<Person> peopleList) {
    return SizedBox(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: peopleList.length,
        itemBuilder: (context, index) {
          return _personItem(peopleList.elementAt(index), index);
        },
      ),
    );
  }

  Widget _personItem(Person person, int index) {
    String personId = person.url.split('/')[5];
    String personName = person.name;
    return Container(
        width: 200,
        height: 250,
        margin:
            EdgeInsets.only(left: index == 0 ? 20 : 5, right: 5, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.yellow.withOpacity(0.5), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                    'http://starwars-visualguide.com/assets/img/characters/$personId.jpg',
                    width: 200,
                    fit: BoxFit.cover)),
            Positioned(
                bottom: 0,
                left: 0,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: Container(
                        color: Colors.white.withOpacity(0.7),
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          personName,
                          style: TextStyle(fontFamily: 'Jedi'),
                        ))))
          ],
        ));
  }
}
