import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_ms_ui/src/views/utils/style.dart';

/// My app class to display the date range picker
class CustomDatePicker extends StatefulWidget {
 final DateRangePickerController controller;

  const CustomDatePicker({Key? key,required this.controller}) : super(key: key);
  @override
  CustomDatePickerState createState() => CustomDatePickerState();

}

/// State for MyApp
class CustomDatePickerState extends State<CustomDatePicker> {
  
  @override
  Widget build(BuildContext context) {
      return Container(
        color: white,
        width: 400,
        height: 400,
        child: SfDateRangePicker(
          showActionButtons: true,
          controller: widget.controller,
          onCancel: (){
            Navigator.of(context).pop();
          },
          onSubmit:(Object? value){
            if(value is DateTime) {
              
              Navigator.of(context).pop();
            }
          },
        ),
      );
    
  }
}