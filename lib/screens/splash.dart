import 'dart:async';

import 'package:cipherx_expense_tracker/Constants/Colors.dart';
import 'package:cipherx_expense_tracker/Constants/cc.dart';
import 'package:cipherx_expense_tracker/animations/FadeImag.dart';
import 'package:cipherx_expense_tracker/animations/Fadeanim.dart';
import 'package:cipherx_expense_tracker/screens/Intro.dart';
import 'package:cipherx_expense_tracker/screens/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
      final profilePicUrl = prefs.getString('profilePicUrl') ?? '';

      if (prefs.getString('tokenId') == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                IntroScreen(), // Replace with your next screen
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Dashboard(), // Replace with your next screen
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          Positioned(
              right: -Sizes.height * 0.068,
              //-50,-70
              top: -Sizes.height * 0.09,
              child: Transform.rotate(
                  angle: -100, child: ConcentricSemiCircles())),
          Positioned(
            top: Sizes.height * 0.35,
            left: Sizes.width * .2,
            child: Column(
              children: [
                FadeImg(
                  1,
                  Transform.rotate(
                    angle: -80,
                    child: Image.asset(
                      "assets/logoC.png",
                      height: 0.2.sh,
                      width: 0.6.sw,
                    ),
                  ),
                ),
                Fadeanim(
                  1.5,
                  Text(
                    "CipherX",
                    style: TextStyle(
                        fontFamily: 'BrunoSC',
                        fontSize: 32.w,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left: -Sizes.height * 0.068,
              //-50,-90
              bottom: -Sizes.height * 0.11,
              child:
                  Transform.rotate(angle: 60, child: ConcentricSemiCircles())),
          Positioned(
              bottom: Sizes.height * 0.04,
              left: Sizes.height * 0.13,
              child: Column(
                children: [
                  Text(
                    "By",
                    style: TextStyle(
                        fontSize: Sizes.width * 0.04, color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Open Source",
                        style: TextStyle(
                            fontSize: Sizes.width * 0.04, color: Colors.white),
                      ),
                      SizedBox(
                        width: Sizes.width * 0.01,
                      ),
                      Text(
                        "Community",
                        style: TextStyle(
                            fontSize: Sizes.width * 0.04,
                            color: splashColorText),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
