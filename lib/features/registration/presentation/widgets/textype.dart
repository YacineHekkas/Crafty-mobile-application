import 'package:flutter/material.dart';
import 'package:cp_project/core/global/global.dart';

Widget textype({
  required String text1,
  Color,
}) {
  return Text(
    text1,
    style: TextStyle(
        fontFamily: AppConst.font,
        color: Color,
        fontSize: 16.0,
        fontWeight: FontWeight.w500),
  );
}
