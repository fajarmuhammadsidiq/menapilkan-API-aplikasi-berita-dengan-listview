// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slicing_iseng/main.dart';
import 'dart:async';

import 'package:slicing_iseng/view/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, (() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((_) {
        return OnBoarding();
      })));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/image_1.png",
              width: 200,
              height: 100,
            ),
          ),
          Text("GUIDE U TO HEAVEN"),
        ],
      ),
    ));
  }
}
