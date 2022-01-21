import 'package:flutter/material.dart';

class FilmsDetailPage extends StatelessWidget {
  const FilmsDetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Film Detail')),
      body: const Center(
        child: Text('Film information'),
      ),
    );
  }
}