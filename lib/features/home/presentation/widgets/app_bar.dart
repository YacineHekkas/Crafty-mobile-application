

import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar(){
  return AppBar(
    backgroundColor: Colors.transparent,

    flexibleSpace: Container(
      height: 65,
      decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)
          ),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppConst.darkBlue.withOpacity(0.85),
                AppConst.darkBlue.withOpacity(0.95)
              ],
              stops: const [
                0.1,
                0.5,
              ]

          )
      ),
    ),
  );
}
