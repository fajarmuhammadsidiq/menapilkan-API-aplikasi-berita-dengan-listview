import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:slicing_iseng/homepage.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: SKOnboardingScreen(
          pages: pages,
          bgColor: Colors.white,
          themeColor: Colors.blueAccent,
          skipClicked: (value) {
            _globalKey.currentState?.setState(() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Homepage();
                },
              ));
            });
          },
          getStartedClicked: (value) {
            _globalKey.currentState?.setState(() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Homepage();
                },
              ));
            });
          }),
    );
  }

  final pages = [
    SkOnboardingModel(
        title: "IDEAS of Content Making ",
        description: "some poeple could run of idea",
        imagePath: 'assets/images/image_2.png',
        titleColor: Colors.black,
        descripColor: Colors.grey),
    SkOnboardingModel(
        title: "Production Support ",
        description: "Time is money",
        imagePath: 'assets/images/image_3.png',
        titleColor: Colors.black,
        descripColor: Colors.grey),
  ];
}
