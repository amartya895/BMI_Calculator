// ignore_for_file: camel_case_types, implementation_imports, prefer_const_constructors

import 'dart:async';

import 'package:bmi_cal/screens/home_screen.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.blue.shade500,
        child: Image.asset(
          "images/gifSplash.gif",
          repeat: ImageRepeat.repeat,
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
