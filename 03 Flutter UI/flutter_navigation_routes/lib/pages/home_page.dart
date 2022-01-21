import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navegación con rutas nombradas'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/films'),
              child: const Text('Ir a Films')
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/planets'),
              child: const Text('Ir a Planets')
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/people'),
              child: const Text('Ir a People')
            ),
          ],
        ),
      ),
    );
  }
}