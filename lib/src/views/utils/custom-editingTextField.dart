
import 'package:flutter/material.dart';
import 'package:user_ms_ui/src/views/utils/style.dart';

class CustomtextEditing extends StatelessWidget {
  const CustomtextEditing({Key? key,
  required this.controller,
  required this.validateText,
  required this.labelText,
  required this.hintText,
  required this.icon}) : super(key: key);
  final TextEditingController controller;
  final String validateText;
  final String labelText;
  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        if (value == null || value.isEmpty)
          return validateText;
        else
          return null;
      },
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          icon: icon,
          iconColor: appbar,
          labelStyle: TextStyle(
            color: appbar,
            fontSize: 20
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: faintBlue)
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: appbar,width: 2)
          ),
          suffixIcon:Icon(Icons.star,color: appbar,) ),
    );
  }
}
