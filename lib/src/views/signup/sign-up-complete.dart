// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SignupComplete extends StatefulWidget {
  const SignupComplete({Key? key}) : super(key: key);


  @override
  State<SignupComplete> createState() => _SignupCompleteState();
}

Color themeColor = const Color(0xFF43D19E);

class _SignupCompleteState extends State<SignupComplete> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "images/card.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 40,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Information saved successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 21,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Mail Sent Please verify account.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            
          ],
        ),
      ),
    );
  }
}