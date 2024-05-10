import 'package:cipherx_expense_tracker/Constants/Colors.dart';
import 'package:cipherx_expense_tracker/Constants/cc.dart';
import 'package:cipherx_expense_tracker/animations/FadeDown.dart';
import 'package:cipherx_expense_tracker/animations/FadeImag.dart';
import 'package:cipherx_expense_tracker/animations/Fadeanim.dart';
import 'package:cipherx_expense_tracker/screens/authentication/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
                  angle: -100, child: FadeDown(1.5, ConcentricSemiCircles()))),
          Positioned(
            top: Sizes.height * 0.06,
            left: -Sizes.height * .03,
            child: FadeImg(
              1,
              Transform.rotate(
                angle: -80,
                child: Image.asset(
                  "assets/logoC.png",
                  height: 0.1.sh,
                  width: 0.4.sw,
                ),
              ),
            ),
          ),
          Positioned(
              left: -Sizes.height * 0.068,
              //-50,-90
              bottom: -Sizes.height * 0.11,
              child:
                  Transform.rotate(angle: 60, child: ConcentricSemiCircles())),
          Fadeanim(
            2,
            Stack(
              children: [
                Positioned(
                  bottom: Sizes.height * 0.12,
                  left: Sizes.height * .03,
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Welcome to",
                        style: TextStyle(
                            fontSize: 0.05.sh,
                            color: Colors.white,
                            fontFamily: 'ABeeZee'),
                      ),
                      SizedBox(
                        height: Sizes.height * 0.001,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        " CipherX.",
                        style: TextStyle(
                            fontSize: 0.05.sh,
                            color: Colors.white,
                            fontFamily: 'BrunoSC'),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: Sizes.height * .145,
                    right: Sizes.height * 0.03,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Container(
                        height: 0.1.sh,
                        width: 0.1.sh,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 0.06.sh,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: Sizes.height * .08,
            left: Sizes.height * .035,
            child: Text(
              textAlign: TextAlign.center,
              "The best way to track your expenses.",
              style: TextStyle(
                  fontSize: 0.023.sh,
                  color: Colors.white,
                  fontFamily: 'ABeeZee'),
            ),
          )
        ],
      ),
    );
  }
}
