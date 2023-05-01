import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget Textfieled({
  required String hintText1,
  required TextEditingController controller,
  bool absc = false,
  required TextInputType? textInputType,
}) {
  return Container(
    height: 60.0,
    padding: const EdgeInsets.only(top: 5, left: 25),
    decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            blurRadius: 7,
          )
        ]),
    child: Container(
        height: 100.0,
        child: TextFormField(
          controller: controller,
          obscureText: absc,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText1,
          ),
        )),
  );
}
