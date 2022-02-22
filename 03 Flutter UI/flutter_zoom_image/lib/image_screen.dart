import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({ Key? key }) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: InteractiveViewer(
        constrained: true,
        onInteractionEnd: _onInteractionEnd,
      child: Image.asset("assets/images/justin.jpeg"),
    ));
  }

  void _onInteractionEnd(ScaleEndDetails details) {
    _animateResetInitialize();
  }
}