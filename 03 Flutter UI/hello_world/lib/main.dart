import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Container(
                      margin: EdgeInsets.only(right: 40), child: Text('Elemento 1')),
                  Icon(
                    Icons.flight_land,
                    color: Colors.red[700],
                  ),
                ]),
                Text('Elemento 2'),
                Text('Elemento 3'),
              ],
            )));
  }
}
