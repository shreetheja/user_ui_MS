import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user_ms_ui/src/views/utils/custom-text.dart';

class TimerWidgetQuestion extends StatefulWidget {
  TimerWidgetQuestion(
      {Key? key,
      required this.totalMilliseconds,
      required this.onEnd,
      })
      : super(key: key);
  final double totalMilliseconds;
  final Function onEnd;

  @override
  _TimerWidgetQuestionState createState() => _TimerWidgetQuestionState();
}

class _TimerWidgetQuestionState extends State<TimerWidgetQuestion> {
  late double totalRemaining;
  double warningTimeMs = 100000;
  Color textColor = Colors.white;
  void count(Timer timer) {
    Color setColor = Colors.white;
    if(totalRemaining-1 < 0){
      timer.cancel();
      widget.onEnd;
    }
    if(totalRemaining<=warningTimeMs){
      setColor = Colors.red;
    }
    if(this.mounted) {
      setState(() {
      totalRemaining -= 1000;
      textColor=setColor;
    });
    }
  }

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  String msToTime(milliseconds) {
    Duration rem = Duration(milliseconds: milliseconds);
    return format(rem);
  }
  @override
  void initState() {
    super.initState();
    totalRemaining = widget.totalMilliseconds;
    const onSec = Duration(seconds: 1);
    Timer.periodic(onSec, (Timer timer) => count(timer));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: CustomText(
          text: msToTime(totalRemaining),
          size: 18,
          color: textColor,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
