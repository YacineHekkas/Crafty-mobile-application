
import 'package:flutter/material.dart';

import '../../../../core/global/global.dart';

Text title(String titleName){
  return Text(
    titleName,
      style: const TextStyle(

        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: AppConst.font,
        letterSpacing: 1.5,
      )
  );
}