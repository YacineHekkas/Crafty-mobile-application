import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:cp_project/core/global/global.dart';

class IntroSecondPage extends StatelessWidget {
  const IntroSecondPage({Key? key}) : super(key: key);

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
              'assets/animation/secondpage.json',
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: const Center(
                  child: Text(
                    textAlign:TextAlign.center,
                'NEED HOME REPAIRS OR RENOVATIONS',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  fontFamily: AppConst.font
                ),
              )),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Center(
                child: Text(
              'could\'t find a trusted crafts-workers!',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: AppConst.font
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
