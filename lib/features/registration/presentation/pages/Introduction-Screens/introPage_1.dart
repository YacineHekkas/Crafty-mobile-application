import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
              // child: TextLiquidFill(
              //   loadDuration: const Duration(
              //     seconds: 2,
              //   ),
              //   waveDuration: const Duration(
              //     seconds: 44,
              //   ),
              //   text: 'WELCOME TO CRAFTY ',
              //   waveColor: Colors.black87,
              //   boxBackgroundColor: const Color.fromRGBO(208, 231, 239, 1),
              //   textStyle: const TextStyle(
              //     fontSize: 28.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   boxHeight: 45.0,
              // ),
                  child: Center (
                    child:Text(
                      'Find what your need ',
                      style: TextStyle(
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
            child: Center(
              child: Text(' FIND SKILLED PROFESSIONEL CRAFTMAN   ',
                  style: GoogleFonts.fredoka(
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
