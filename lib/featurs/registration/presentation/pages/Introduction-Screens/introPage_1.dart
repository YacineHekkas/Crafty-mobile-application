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
        backgroundColor: Color.fromRGBO(208, 231, 239, 1),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset('assets/animation/firstpage.json'),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            child: Center(
                child: SizedBox(
              width: 300.0,
              child: TextLiquidFill(
                loadDuration: Duration(
                  seconds: 2,
                ),
                waveDuration: Duration(
                  seconds: 44,
                ),
                text: 'WELCOME TO CRAFTY ',
                waveColor: Colors.black87,
                boxBackgroundColor: Color.fromRGBO(208, 231, 239, 1),
                textStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 50.0,
              ),
            )),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Center(
              child: Text(' FIND SKILLED PROFESSIONEL CRAFTMAN   ',
                  style: GoogleFonts.fredoka(
                    fontSize: 15.0,
                    color: Colors.black87,
                  )),
            ),
          ),
          SizedBox(
            height: 25.0,
          )
        ])));
  }
}
