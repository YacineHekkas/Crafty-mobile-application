import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:cp_project/core/global/global.dart';

class IntroThirdPage extends StatelessWidget {
  const IntroThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppConst.skyBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/thirdpage.json',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Center(
                child: Text(
              'SAVE YOUR TIME !',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppConst.font,
                  fontWeight: FontWeight.bold),
            )),
            const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                textAlign:TextAlign.center,
                'Our app helps you find the right craft worker for your specific needs,From minor repairs to major installations, with reliable and transparent pricing',
                style: TextStyle(
                  fontFamily: AppConst.font,
                  fontSize: 20, //
                ),
              ),
            )),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    ));
  }
}
