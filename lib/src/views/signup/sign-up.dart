// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:user_ms_ui/src/views/signup/sign-up-complete.dart';
import 'package:user_ms_ui/src/views/signup/sign-up1.dart';
import 'package:user_ms_ui/src/views/signup/sign-up2.dart';
import 'package:user_ms_ui/src/views/signup/sign-up3.dart';
import 'package:user_ms_ui/src/views/signup/signupController.dart';
import 'package:user_ms_ui/src/views/utils/responsivenes.dart';
import 'package:user_ms_ui/src/views/utils/style.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SignUpController controller = SignUpController.getInstance;
    controller.reload = reload;
    return ResponsiveWidget(
      largeScreen: SignupPageMedium(),
      mediumScreen: SignupPageMedium(),
      smallScreen: SignupPageSmall(),
    );
  }
}

class SignupPageMedium extends StatelessWidget {
  SignupPageMedium({Key? key}) : super(key: key);
  SignUpController controller = SignUpController.getInstance;
  double ticketNumber = 1;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Padding(
          padding:
              EdgeInsets.only(top: 20.0, bottom: 20.0, left: 60.0, right: 60.0),
          child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              child: Builder(builder: (BuildContext context) {
                if (controller.currentState == SignupState.finished) {
                  return SignupComplete();
                } else {
                  return Row(
                    children: [
                      Expanded(
                        child: leftSide(context),
                        flex: 3,
                      ),
                      Expanded(
                        child: SingleChildScrollView(child: rightSide(context)),
                        flex: 7,
                      )
                    ],
                  );
                }
              })),
        ),
        bottomNavigationBar: Material(
            elevation: 8.0,
            color: appbar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    "If any technical problems faced please mail to eduvedha@gmail.com:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.red,
                  child: Text(
                    'eduvedha@gmail.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () async => launchMailto(),
                )
              ],
            )),
      ),
    );
  }
}

class SignupPageSmall extends StatelessWidget {
  SignupPageSmall({Key? key}) : super(key: key);
  SignUpController controller = SignUpController.getInstance;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      child: Scaffold(
        bottomNavigationBar: Material(
            elevation: 8.0,
            color: appbar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "If any technical problems faced \nPlease mail to :eduvedha@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Material(
                  elevation: 20,
                  color: button,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      
                      child: Text(
                        'Open Mail',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            ),
                      ),
                      onTap: () async => launchMailto(),
                    ),
                  ),
                )
              ],
            )),
        backgroundColor: Colors.blue[50],
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              child: Builder(builder: (BuildContext context) {
                if (controller.currentState == SignupState.finished) {
                  return SignupComplete();
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: leftSideSmall(context),
                        flex: 5,
                      ),
                      Expanded(
                        child: SingleChildScrollView(child: rightSide(context)),
                        flex: 7,
                      )
                    ],
                  );
                }
              })),
        ),
      ),
    );
  }
}

Widget leftSide(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 3.3,
    height: MediaQuery.of(context).size.height,
    color: appbar,
    child: Padding(
      padding: EdgeInsets.only(top: 40.0, right: 30.0, left: 30.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          children: <Widget>[
            ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(70), // Image radius
                child: Image.asset(
                  'images/signup.png',
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text(
                "Let's get you set up....",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text(
                "It should only take a couple of minutes to set up",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.arrow_back,
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget leftSideSmall(BuildContext context) {
  return Container(
    color: appbar,
    width: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(60), // Image radius
              child: Image.asset(
                'images/signup.png',
              ),
            ),
          ),
        ),
        Container(
          child: Text(
            "Let's get you set up",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: Text(
            "It should only take a couple of minutes to set up",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

Widget rightSide(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignUpController controller = SignUpController.getInstance;
  controller.currentFormKey = _formKey;
  return Container(
    padding: const EdgeInsets.only(left: 30, top: 0, bottom: 20),
    child: Form(
      key: _formKey,
      child: Builder(builder: (context) {
        if (controller.currentState == SignupState.signup1) {
          return SignUp1();
        } else if (controller.currentState == SignupState.signup2) {
          return SignUp2();
        } else if (controller.currentState == SignupState.signup3) {
          return Signup3();
        }
        return SignUp1();
      }),
    ),
  );
}

double ticketNumber = 1;

launchMailto() async {
  final mailtoLink = Mailto(
    to: ['examvedha@gmail.com'],
    cc: ['snshagri@gmail.com', '470nag@gmail.com'],
    subject: 'Technical issue ticket #' + ticketNumber.toString(),
    body: '',
  );
  ticketNumber++;

  // Convert the Mailto instance into a string.
  // Use either Dart's string interpolation
  // or the toString() method.
  await launch('$mailtoLink');
}
