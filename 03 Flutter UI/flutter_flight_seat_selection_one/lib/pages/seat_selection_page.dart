import 'package:flutter/material.dart';
import 'package:flutter_flight_seat_selection/models/seat_model.dart';
import 'package:flutter_flight_seat_selection/pages/passenger_info_page.dart';
import 'package:flutter_svg/svg.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({Key? key}) : super(key: key);

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  late SeatModel _selectedSeat;
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  void initState() {
    super.initState();
    _selectedSeat = SeatModel(state: SeatState.pass, row: 0, letter: '');
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(children: [
      Container(
        color: const Color(0xFF003377),
        width: screenWidth,
        height: screenHeight,
        child: SvgPicture.asset(
          'assets/images/plane_bg.svg',
          fit: BoxFit.fill,
        ),
      ),
      Center(
        child: Container(
          width: screenWidth / 2,
          margin: const EdgeInsets.only(right: 20, top: 100),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(300), topRight: Radius.circular(300)),
            child: Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 100),
              color: Colors.white,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                  ),
                  itemCount: seatList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _getSeatItem(index);
                  }),
            ),
          ),
        ),
      ),
    ]));
  }

  Widget _getSeatItem(int index) {
    SeatModel _seat = seatList[index];
    if (_selectedSeat == _seat) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedSeat = SeatModel(state: SeatState.pass, row: 0, letter: '');
          });
        },
        child: Stack(children: [
          SvgPicture.asset('assets/images/plane_seats_selected.svg'),
          Center(
              child: Text(
            '${_seat.row}${_seat.letter}',
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ))
        ]),
      );
    } else if (_seat.state == SeatState.pass) {
      return SvgPicture.asset('assets/images/plane_seats_pass.svg');
    } else if (_seat.state == SeatState.occupied) {
      return Stack(children: [
        SvgPicture.asset('assets/images/plane_seats_occupied.svg'),
        Center(
            child: Text(
          '${_seat.row}${_seat.letter}',
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ))
      ]);
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedSeat = _seat;
          });
          showModal(context, _seat);
        },
        child: Stack(children: [
          SvgPicture.asset('assets/images/plane_seats_free.svg'),
          Center(
              child: Text(
            '${_seat.row}${_seat.letter}',
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ))
        ]),
      );
    }
  }

  showModal(BuildContext context, SeatModel seat) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo_iberia.svg',
                      width: 100,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  height: 1,
                  color: Color(0x77BBBBBB),
                ),
              ),
              Container(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('First Class'),
                        Container(height: 5),
                        Text(
                          'Seat ${seat.row}${seat.letter}',
                          style: const TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Boeing',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Container(height: 5),
                        const Text(
                          '777 - 200ER',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfff1f1f1),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.restaurant_menu),
                            Text('Meals')
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Icon(Icons.wifi), Text('Wifi')]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Icon(Icons.tv), Text('TV')]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Icon(Icons.bed), Text('Restroom')]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.local_bar),
                            Text('Drinks')
                          ]),
                    ]),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: screenWidth,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/passenger-info',
                            arguments: PassengerInfoArguments(_selectedSeat));
                      },
                      child: const Text('Continuar')))
            ],
          );
        });
  }
}
