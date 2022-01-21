import 'package:flutter/material.dart';
import 'package:flutter_navigation_routes/pages/films_detail_page.dart';
import 'package:flutter_navigation_routes/pages/films_page.dart';
import 'package:flutter_navigation_routes/pages/home_page.dart';
import 'package:flutter_navigation_routes/pages/people_page.dart';
import 'package:flutter_navigation_routes/pages/planets_page.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/planets': (context) => const PlanetsPage(),
        '/films': (context) => const FilmsPage(),
        '/people': (context) => const PeoplePage(),
        '/film-detail': (context) => const FilmsDetailPage(),
      },
    );
  }
}
