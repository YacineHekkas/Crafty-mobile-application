import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
   bool obscureText;
  final bool isThereError;




  CustomTextField(
      {required this.hint,
        required this.textEditingController,
        required this.keyboardType,
        required this.obscureText,
        required this.isThereError,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {

    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation:0.9,
      child: TextFormField(
        maxLength: 30,
        obscureText: widget.obscureText,
        //maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
        onChanged: (String value) {

        },
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: AppConst.orong,
        decoration: InputDecoration(
          suffixIcon: widget.hint.contains('word')? IconButton(
            icon: Icon(
              widget.obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
          ): widget.isThereError? const Icon(
              Icons.error,
            color: Colors.red,
          ):null,
           enabledBorder: widget.isThereError? OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
             borderSide: const BorderSide(color: Colors.red),
          ):null,

          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none

          ),
        ),
      ),
    );
  }
}