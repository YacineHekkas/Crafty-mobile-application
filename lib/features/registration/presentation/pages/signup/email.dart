import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../core/global/global.dart';
import '../../widgets/textype.dart';

class emailverify1 extends StatefulWidget {
  const emailverify1({super.key});

  @override
  State<emailverify1> createState() => _emailverify1State();
}

class _emailverify1State extends State<emailverify1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.bgColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 110.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 150.0, left: 15.0),
                  child: Text(
                    ConstStrings.last,
                    style: TextStyle(
                        fontFamily: AppConst.font,
                        color: AppConst.darkBlue,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150.0, left: 30.0),
                  child: Container(
                    child: textype(
                      text1: ConstStrings.number,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 20.0),
              child: Container(
                  width: 300,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                  )),
            ),
          ]))
        ])));
  }
}
