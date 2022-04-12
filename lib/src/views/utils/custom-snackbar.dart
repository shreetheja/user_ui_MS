
import 'package:flutter/material.dart';
import 'package:user_ms_ui/src/views/utils/custom-text.dart';

class CustomSnackBars{
  static void showSnackbar(String Message, Color color,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: CustomText(
        text: Message,
        size: 16,
        color: Colors.white,
      ),
      duration: Duration(seconds: 1),
      width: 300,
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ),
    ));
  }
}