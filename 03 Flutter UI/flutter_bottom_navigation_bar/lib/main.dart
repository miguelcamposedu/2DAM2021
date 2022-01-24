import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/pages/films_detail_page.dart';
import 'package:flutter_bottom_navigation_bar/pages/home_page.dart';

import 'pages/people_detail_page.dart';

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
        '/': (context) => const MyHomePage(),
        '/people-detail': (context) => const PeopleDetailPage(),
        '/films-detail': (context) => const FilmsDetailPage(),
      },
    );
  }
}
