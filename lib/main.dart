// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slicing_iseng/view/onboarding.dart';
import 'package:slicing_iseng/view/splashscreen.dart';

import 'homepage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen',
      home: SplashScreen(),
    );
  }
}
