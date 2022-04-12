
import 'package:flutter/material.dart';


class CustomDropdownItem extends StatefulWidget {
  CustomDropdownItem(
      {Key? key,
      this.isLoading = false,
      this.isError = false,
      required this.label,
      this.menuItems,required this.validateString,required this.onChanged, this.selectedValue})
      : super(key: key);
  final bool isLoading;
  final bool isError;
  final String label;
  final String validateString;
  var onChanged;
  String? selectedValue;
  List<String>? menuItems;
  @override
  State<CustomDropdownItem> createState() => _CustomDropdownItemState();
}

class _CustomDropdownItemState extends State<CustomDropdownItem> {
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = widget.menuItems ?? [];
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Form(
          key: _dropdownFormKey,
          child: Row(
            children: [
              Text(widget.label),
              SizedBox(
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.7,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    DropdownButtonFormField(
                      isExpanded: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue[50]!, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue[50]!, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.blue[50],
                      ),
                      validator: (value) =>
                          value == null ? widget.validateString : null,
                      dropdownColor: Colors.blue[50],
                      value: widget.selectedValue,
                      onChanged:widget.onChanged,
                      
                      items:menuItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(

                          value: value,
                          child: Row(
                            children: [
                              Flexible(child: Text(value)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 10,
              ),
              widget.isLoading
                  ? const SizedBox(
                      child: CircularProgressIndicator(),
                      width: 30,
                      height: 30,
                    )
                  : widget.isError
                      ? const Icon(Icons.error,color: Colors.red,)
                      : Container()
            ],
          ));
    });
  }
}
