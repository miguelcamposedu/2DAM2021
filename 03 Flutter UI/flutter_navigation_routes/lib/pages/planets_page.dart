import 'package:flutter/material.dart';

class PlanetsPage extends StatelessWidget {
  const PlanetsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planets')),
      body: const Center(
        child: Text('Planets information'),
      ),
    );
  }
}