import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;



  CustomTextField(
      {required this.hint,
        required this.textEditingController,
        required this.keyboardType,
        required this.obscureText,
      });

  @override
  Widget build(BuildContext context) {

    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation:0.9,
      child: TextFormField(
        maxLength: 12,
       // maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
        onChanged: (String value) {
          if (value.length > 10) {
            //textEditingController.text = value.substring(0, 10);
            //textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: 10));
          }
        },
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: AppConst.orong,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}