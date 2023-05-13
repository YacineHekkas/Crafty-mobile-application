import 'package:cp_project/core/global/global.dart';
import 'package:flutter/cupertino.dart';

Text pageTitle(title){
  return Text(
    title,
    style: const TextStyle(
        color: AppConst.darkBlue,
        fontSize: 34,
        fontFamily: AppConst.font,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.9
    ),
  );
}

Text pageSubTitle(title){
  return
    Text(
    title,
    style: const TextStyle(
        color: AppConst.textColor,
        fontSize: 20,
        fontFamily: AppConst.font,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.9
    ),
  );
}