import 'package:flutter/material.dart';
import 'package:flutter_flight_seat_selection/models/seat_model.dart';
import 'package:flutter_svg/svg.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({Key? key}) : super(key: key);

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  itemBuilder: (BuildContext context, int i) {
                    return SeatItemWidget(index: i);
                  }),
            ),
          ),
        ),
      ),
    ]));
  }
}

class SeatItemWidget extends StatefulWidget {
  const SeatItemWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _SeatItemWidgetState createState() => _SeatItemWidgetState();
}

class _SeatItemWidgetState extends State<SeatItemWidget> {
  late SeatModel _seat;

  @override
  void initState() {
    super.initState();
    _seat = seatList[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    if (_seat.state == SeatState.pass) {
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
    } else if (_seat.state == SeatState.free) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _seat.state = SeatState.selected;
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
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            _seat.state = SeatState.free;
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
    }
  }

  showModal(BuildContext context, SeatModel seat) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Divider(
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
                            style: TextStyle(fontSize: 40),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Boeing',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Container(height: 5),
                          Text(
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
                  color: Color(0xfff1f1f1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min, children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.restaurant_menu),
                      Text('Meals')
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.wifi),
                      Text('Wifi')
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.tv),
                      Text('TV')
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.bed),
                      Text('Restroom')
                    ]),
Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.local_bar),
                      Text('Drinks')
                    ]),
                  ]),
                )
              ],
            ),
          );
        });
  }
}
