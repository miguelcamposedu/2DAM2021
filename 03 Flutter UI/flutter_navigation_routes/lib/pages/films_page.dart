import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Films')),
      body: Center(
        child: ElevatedButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/film-detail'),
        child: const Text('Go to Film Detail')),
      ),
    );
  }
}