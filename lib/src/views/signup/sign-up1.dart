import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:user_ms_ui/src/views/signup/signupController.dart';
import 'package:user_ms_ui/src/views/utils/custom-datepicker.dart';
import 'package:user_ms_ui/src/views/utils/custom-inputField.dart';
import 'package:user_ms_ui/src/views/utils/custom-text.dart';
import 'package:user_ms_ui/src/views/utils/style.dart';

class SignUp1 extends StatefulWidget {
  SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  SignUpController controller = SignUpController.getInstance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Personal Details',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 40.0),
        InputField(
          label: "Name",
          content: "",
          controller: controller.nameController,
          validateText: 'Please fill Name',
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            Text('DOB:'),
            SizedBox(
              width: 90,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: button, elevation: 20),
              onPressed: () async {
                await addBatchDialogue(context);
                if (controller.dobDateController.selectedDate != null) {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formatted = formatter
                      .format(controller.dobDateController.selectedDate!);
                  controller.selectedDob = formatted;
                  setState(() {});
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Select Date",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            CustomText(text: controller.selectedDob)
          ],
        ),
        const SizedBox(height: 20.0),
        InputField(
          label: "Email",
          content: "",
          controller: controller.emailController,
          validateText: 'Please fill email',
          validator: (String value) {
            bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value);
            if (emailValid)
              return null;
            else {
              return 'Enter a Valid Email';
            }
          },
        ),
        const SizedBox(height: 20.0),
        InputField(
          label: "Mobile",
          content: "Dont include +91 please",
          controller: controller.phoneController,
          validator: (String value) {
            if (value.isNotEmpty && value.length == 10 && _isNumeric(value))
              return null;
            else {
              return 'Enter a Valid Phone Number';
            }
          },
          validateText: 'Please Enter the phone',
        ),
        const SizedBox(height: 20.0),
        InputField(
          label: "USN",
          content: "",
          controller: controller.uidController,
          validateText: 'Please Enter USN',
        ),
        const SizedBox(height: 20.0),
        InputField(
          label: "Address",
          content: "",
          controller: controller.addressController,
          validateText: 'Please Enter Address',
        ),
        const SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: button, elevation: 20),
              onPressed: () {
                controller.currentStateToSignup2(SignupState.signup2);
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
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

  Future<void> addBatchDialogue(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content:
                    CustomDatePicker(controller: controller.dobDateController),
              );
            },
          );
        });
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
