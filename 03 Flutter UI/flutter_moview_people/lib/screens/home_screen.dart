import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_moview_people/models/people_popular.dart';
import 'package:flutter_moview_people/screens/people_detail_screen.dart';
import 'package:flutter_moview_people/utils/contants.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

//

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Actor>?> futureActors;

  @override
  void initState() {
    super.initState();
    futureActors = fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 20.0),
          child: Text('Popular Actors and Actresses',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w900, fontSize: 30)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10),
          child: Text(
            DateFormat.yMMM().format(DateTime.now()),
            style: GoogleFonts.lato(fontSize: 10),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: FutureBuilder<List<Actor>?>(
            future: futureActors,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildActorList(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ]),
    );
  }

  Future<List<Actor>?> fetchPeople() async {
    final response =
        await http.get(Uri.parse('$apiBaseUrl/person/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PeoplePopularResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildActorList(List<Actor> list) {
    return SizedBox(
      height: 450,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          Actor currentActor = list[index];
          var name = currentActor.name?.split(' ');
          String firstName = name != null ? name[0] : '';
          String lastName = '';
          if (name != null && name.length > 1) {
            lastName = name[1];
          }
          return Container(
            height: 650,
            margin: EdgeInsets.only(right: 20.0, left: index == 0 ? 20 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PeopleDetailScreen(actor: currentActor)),
                        );
                      },
                      child: Image.network(
                        '$apiImageUrl${currentActor.profilePath}',
                        fit: BoxFit.cover,
                        height: 380,
                        width: 200,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(firstName,
                      style: GoogleFonts.raleway(
                          fontStyle: FontStyle.normal, fontSize: 30)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(lastName,
                      style: GoogleFonts.raleway(
                          fontStyle: FontStyle.normal, fontSize: 15)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
