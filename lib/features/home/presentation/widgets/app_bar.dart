import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
      height: 65,
      decoration:  BoxDecoration(
          boxShadow: [

          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3)
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

