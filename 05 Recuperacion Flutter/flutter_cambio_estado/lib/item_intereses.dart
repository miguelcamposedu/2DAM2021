import 'package:flutter/material.dart';

class ItemIntereses extends StatefulWidget {
  const ItemIntereses({Key? key}) : super(key: key);

  @override
  State<ItemIntereses> createState() => _ItemInteresesState();
}

class _ItemInteresesState extends State<ItemIntereses> {
  late bool selected;

  @override
  void initState() {
    selected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                color: selected ? Colors.yellow : Colors.transparent,
                borderRadius: BorderRadius.circular(25)),
            child: const SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Text('Hola Mundo'),
                )),
          ),
        );
  }
}
