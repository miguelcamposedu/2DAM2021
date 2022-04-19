import 'package:flutter/material.dart';
import 'package:flutter_cambio_estado/item_intereses.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ItemIntereses(),
                ItemIntereses(),
                ItemIntereses()
              ]),
        ));
  }
}
