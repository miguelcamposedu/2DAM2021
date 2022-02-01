import 'package:flutter/material.dart';
import 'package:flutter_flight_seat_selection/pages/passenger_info_page.dart';
import 'package:flutter_flight_seat_selection/pages/seat_selection_page.dart';

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
        '/': (context) => const SeatSelectionPage(),
        '/passenger-info': (context) => const PassengerInfoPage(),
      },
    );
  }
}
