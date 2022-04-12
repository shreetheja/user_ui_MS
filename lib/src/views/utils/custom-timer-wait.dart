import 'package:flutter/material.dart';
import 'package:user_ms_ui/src/views/utils/custom-text.dart';

class TimerWidgetWaitPage extends StatelessWidget {
  const TimerWidgetWaitPage({Key? key, required this.totalMilliseconds})
      : super(key: key);
  final double totalMilliseconds;

   String durationToString(Duration duration) => (duration.inMilliseconds / 1000)
    .toStringAsFixed(2)
    .replaceFirst('.', ':')
    .padLeft(5, '0');


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: CustomText(
          text: durationToString(new Duration(milliseconds: totalMilliseconds.toInt())) + ' mins',
          size: 18,
          color: Colors.white,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
