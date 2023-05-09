import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class introPage1 extends StatelessWidget {
  const introPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppConst.skyBlue,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset('assets/animation/firstpage.json'),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: const Center(
                child: SizedBox(
              width: 300.0,

                  child: Center (
                    child:Text(
                      'Find what your need ',
                      style: TextStyle(
                        fontFamily: AppConst.font,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),

                  ),)
            )),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Center(
              child: Text(' FIND SKILLED PROFESSIONAL CRAFTSMAN ',
                  style: TextStyle(
                    fontFamily: AppConst.font,
                    fontSize: 15.0,
                    color: Colors.black87,
                  )),
            ),
          ),
          const SizedBox(
            height: 25.0,
          )
        ])));
  }
}
