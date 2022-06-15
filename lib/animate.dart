import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Animate extends StatefulWidget {
  const Animate({Key? key}) : super(key: key);

  @override
  _AnimateState createState() => _AnimateState();
}

class _AnimateState extends State<Animate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("plant.json"),
      ),
    );
  }
}
