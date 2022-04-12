// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  final TextEditingController controller;
  final String validateText;
  final Function? validator;
  final bool? isObscured;
  InputField(
      {required this.label,
      required this.content,
      required this.controller,
      required this.validateText,
      this.validator,
      this.isObscured});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                label,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              color: Colors.blue[50],
              child: TextFormField(
                controller: controller,
                obscureText: isObscured==null?false:true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return validateText;
                  } else {
                    if (validator != null) {
                      return validator!(value);
                    }
                    return null;
                  }
                },
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[50]!,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue[50]!,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: content,
                  fillColor: Colors.blue[50],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
