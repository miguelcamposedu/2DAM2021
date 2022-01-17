import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/people_response.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  bool lightMode = true;
  final List<Person> items = PeopleResponse.fromJson(jsonDecode(
          '{ "count": 82, "next": "https://swapi.dev/api/people/?page=2", "previous": null, "results": [ { "name": "Luke Skywalker", "height": "172", "mass": "77", "hair_color": "blond", "skin_color": "fair", "eye_color": "blue", "birth_year": "19BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [ "https://swapi.dev/api/vehicles/14/", "https://swapi.dev/api/vehicles/30/" ], "starships": [ "https://swapi.dev/api/starships/12/", "https://swapi.dev/api/starships/22/" ], "created": "2014-12-09T13:50:51.644000Z", "edited": "2014-12-20T21:17:56.891000Z", "url": "https://swapi.dev/api/people/1/" }, { "name": "C-3PO", "height": "167", "mass": "75", "hair_color": "n/a", "skin_color": "gold", "eye_color": "yellow", "birth_year": "112BBY", "gender": "n/a", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/4/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [ "https://swapi.dev/api/species/2/" ], "vehicles": [], "starships": [], "created": "2014-12-10T15:10:51.357000Z", "edited": "2014-12-20T21:17:50.309000Z", "url": "https://swapi.dev/api/people/2/" }, { "name": "R2-D2", "height": "96", "mass": "32", "hair_color": "n/a", "skin_color": "white, blue", "eye_color": "red", "birth_year": "33BBY", "gender": "n/a", "homeworld": "https://swapi.dev/api/planets/8/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/4/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [ "https://swapi.dev/api/species/2/" ], "vehicles": [], "starships": [], "created": "2014-12-10T15:11:50.376000Z", "edited": "2014-12-20T21:17:50.311000Z", "url": "https://swapi.dev/api/people/3/" }, { "name": "Darth Vader", "height": "202", "mass": "136", "hair_color": "none", "skin_color": "white", "eye_color": "yellow", "birth_year": "41.9BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [], "starships": [ "https://swapi.dev/api/starships/13/" ], "created": "2014-12-10T15:18:20.704000Z", "edited": "2014-12-20T21:17:50.313000Z", "url": "https://swapi.dev/api/people/4/" }, { "name": "Leia Organa", "height": "150", "mass": "49", "hair_color": "brown", "skin_color": "light", "eye_color": "brown", "birth_year": "19BBY", "gender": "female", "homeworld": "https://swapi.dev/api/planets/2/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [ "https://swapi.dev/api/vehicles/30/" ], "starships": [], "created": "2014-12-10T15:20:09.791000Z", "edited": "2014-12-20T21:17:50.315000Z", "url": "https://swapi.dev/api/people/5/" }, { "name": "Owen Lars", "height": "178", "mass": "120", "hair_color": "brown, grey", "skin_color": "light", "eye_color": "blue", "birth_year": "52BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [], "starships": [], "created": "2014-12-10T15:52:14.024000Z", "edited": "2014-12-20T21:17:50.317000Z", "url": "https://swapi.dev/api/people/6/" }, { "name": "Beru Whitesun lars", "height": "165", "mass": "75", "hair_color": "brown", "skin_color": "light", "eye_color": "blue", "birth_year": "47BBY", "gender": "female", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [], "starships": [], "created": "2014-12-10T15:53:41.121000Z", "edited": "2014-12-20T21:17:50.319000Z", "url": "https://swapi.dev/api/people/7/" }, { "name": "R5-D4", "height": "97", "mass": "32", "hair_color": "n/a", "skin_color": "white, red", "eye_color": "red", "birth_year": "unknown", "gender": "n/a", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/" ], "species": [ "https://swapi.dev/api/species/2/" ], "vehicles": [], "starships": [], "created": "2014-12-10T15:57:50.959000Z", "edited": "2014-12-20T21:17:50.321000Z", "url": "https://swapi.dev/api/people/8/" }, { "name": "Biggs Darklighter", "height": "183", "mass": "84", "hair_color": "black", "skin_color": "light", "eye_color": "brown", "birth_year": "24BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/1/", "films": [ "https://swapi.dev/api/films/1/" ], "species": [], "vehicles": [], "starships": [ "https://swapi.dev/api/starships/12/" ], "created": "2014-12-10T15:59:50.509000Z", "edited": "2014-12-20T21:17:50.323000Z", "url": "https://swapi.dev/api/people/9/" }, { "name": "Obi-Wan Kenobi", "height": "182", "mass": "77", "hair_color": "auburn, white", "skin_color": "fair", "eye_color": "blue-gray", "birth_year": "57BBY", "gender": "male", "homeworld": "https://swapi.dev/api/planets/20/", "films": [ "https://swapi.dev/api/films/1/", "https://swapi.dev/api/films/2/", "https://swapi.dev/api/films/3/", "https://swapi.dev/api/films/4/", "https://swapi.dev/api/films/5/", "https://swapi.dev/api/films/6/" ], "species": [], "vehicles": [ "https://swapi.dev/api/vehicles/38/" ], "starships": [ "https://swapi.dev/api/starships/48/", "https://swapi.dev/api/starships/59/", "https://swapi.dev/api/starships/64/", "https://swapi.dev/api/starships/65/", "https://swapi.dev/api/starships/74/" ], "created": "2014-12-10T16:16:29.192000Z", "edited": "2014-12-20T21:17:50.325000Z", "url": "https://swapi.dev/api/people/10/" } ] }'))
      .results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Star Wars',
              style: TextStyle(
                fontFamily: 'Jedi',
              )),
          actions: [Icon(Icons.wb_sunny)],
        ),
        body: Container(
          color: _getBackgroundColor(),
          child: Container(
            padding: EdgeInsets.only(top:10),
            height: 200,
            child: Column(
              children: [
                Text('People'),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    String peopleId = items.elementAt(index).url.split('/').last;
                    return Container(
                      width: 246,
                      height: 100,
                      margin: EdgeInsets.only(
                          left: index == 0 ? 20 : 5, right: 5, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xfff1f1f1).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), 
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.network('https://starwars-visualguide.com/assets/img/characters/$peopleId.jpg')
                        ],
                      ),
                    
                      );
                  },
                ),
              ],
            ),
          )),
        );
  }

  _getBackgroundColor() {
    return lightMode ? const Color(0xff000000) : const Color(0xfff1f1f1);
  }
}
