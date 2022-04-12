import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign align;

  CustomText({Key? key, required this.text,  this.size,  this.color,  this.weight,this.align = TextAlign.start}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16, 
        color: color ?? Colors.black, 
        fontWeight: weight ?? FontWeight.normal,
        
      ),
      textAlign: align,
    );
  }
}
