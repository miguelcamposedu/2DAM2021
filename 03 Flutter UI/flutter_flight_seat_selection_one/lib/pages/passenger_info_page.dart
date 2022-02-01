import 'package:flutter/material.dart';
import 'package:flutter_flight_seat_selection/models/seat_model.dart';

class PassengerInfoArguments {
  final SeatModel seat;
  PassengerInfoArguments(this.seat);
}

class PassengerInfoPage extends StatefulWidget {
  const PassengerInfoPage({ Key? key }) : super(key: key);

  @override
  _PassengerInfoPageState createState() => _PassengerInfoPageState();
}

class _PassengerInfoPageState extends State<PassengerInfoPage> {
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PassengerInfoArguments;

    return Scaffold(
      appBar: AppBar(title: const Text('Passenger Information')),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(children: [
          Center(child: Text('${args.seat.row}${args.seat.letter}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
        ],),
      ),
    );
  }
}