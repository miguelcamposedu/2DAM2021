import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasolinerapp/models/luz_response.dart';
import 'package:http/http.dart' as http;

class LuzScreen extends StatefulWidget {
  const LuzScreen({Key? key}) : super(key: key);

  @override
  State<LuzScreen> createState() => _LuzScreenState();
}

class _LuzScreenState extends State<LuzScreen> {
  late Future<List<PrecioLuz>> futurePreciosLuz;

  @override
  void initState() {
    super.initState();
    futurePreciosLuz = fetchPreciosLuz();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PrecioLuz>>(
      future: futurePreciosLuz,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var precioActual = snapshot.data!.elementAt(index);
            return ListTile(
              title: Text('${precioActual.value.toString()} - ${precioActual.geoName}'),
            );
          },
        );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

Future<List<PrecioLuz>> fetchPreciosLuz() async {
  final response =
      await http.get(Uri.parse('https://www.minitwitter.com/precioluz.json'));

  if (response.statusCode == 200) {
    return LuzResponse.fromJson(jsonDecode(response.body)).indicator.values;
  } else {
    throw Exception('Failed to load album');
  }
}
