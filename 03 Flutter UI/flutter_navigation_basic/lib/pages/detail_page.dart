import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Volver atrás'),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
      ),
    );
  }
}