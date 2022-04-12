// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:user_ms_ui/src/views/signup/signupController.dart';
import 'package:user_ms_ui/src/views/utils/custom-inputField.dart';
import 'package:user_ms_ui/src/views/utils/style.dart';

class SignUp2 extends StatelessWidget {
  SignUp2({Key? key}) : super(key: key);
  
  SignUpController controller  = SignUpController.getInstance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: prefer_const_constructors
        Text(
          'Password Details',
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 40.0),

        const SizedBox(height: 20.0),
        InputField(
          label: "Password",
          content: "",
          controller: controller.passwordController,
          validateText: 'Please Enter passowrd',
          isObscured: true,
        ),

        const SizedBox(height: 20.0),
        InputField(
          label: "Confirm Password",
          content: "",
          controller: controller.confirmPasswordController,
          validateText: 'Please Enter passowrd',
          isObscured: true,
          validator: (String value){
            if(controller.passwordController.text==controller.confirmPasswordController.text){
              return null;
            }
            else {
              return 'Passwords Doesnt match';
            }
          },
        ),

        const SizedBox(height: 50.0),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: button,
                  elevation: 30,
                ),
                onPressed: () {
                  controller.currentStateToSignup1(SignupState.signup1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "Back",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: button, elevation: 20),
                onPressed: () {
                  controller.currentStateToSignup3(SignupState.signup3);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
