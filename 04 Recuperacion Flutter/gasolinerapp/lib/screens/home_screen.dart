import 'package:flutter/material.dart';
import 'package:gasolinerapp/screens/gas_screen.dart';
import 'package:gasolinerapp/screens/gasolinera_screen.dart';
import 'package:gasolinerapp/screens/luz_screen.dart';
import 'package:gasolinerapp/screens/solar_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Color _selectedColor = Colors.red;
  String _selectedTitle = "Luz";
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Color> _screenColors = <Color>[
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.pink
  ];
    static const List<String> _screenTitles = <String>[
    "Luz",
    "Gas",
    "Gasolinera",
    "Solar"
  ];
  static const List<Widget> _widgetOptions = <Widget>[
    LuzScreen(),
    GasScreen(),
    GasolineraScreen(),
    SolarScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedColor = _screenColors[index];
      _selectedIndex = index;
      _selectedTitle = _screenTitles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedTitle),
        backgroundColor: _selectedColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.flash_on),
            label: 'Luz',
            backgroundColor: _selectedColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_fire_department),
            label: 'Gas',
            backgroundColor: _selectedColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_gas_station),
            label: 'Gasolinera',
            backgroundColor: _selectedColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.wb_sunny),
            label: 'Solar',
            backgroundColor: _selectedColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}