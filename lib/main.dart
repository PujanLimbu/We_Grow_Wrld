import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:we_grow_wrld/course.dart';
import 'package:we_grow_wrld/coursed.dart';
import 'package:we_grow_wrld/dashboard.dart';
import 'package:we_grow_wrld/details.dart';
import 'package:we_grow_wrld/fertilizer.dart';
import 'package:we_grow_wrld/foryou.dart';
import 'package:we_grow_wrld/login.dart';
import 'package:we_grow_wrld/signup.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'We Grow Wrld',
      home: Login(),
    );
  }
}
