import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage3 extends StatelessWidget {
  const introPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(208, 231, 239, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/thirdpage.json',
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
                child: Text(
              'SAVE YOUR TIME !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                ' our app helps you find the right craft worker for your specific needs,From minor repairs to major installations, with reliable and transparent pricing',
                style: TextStyle(
                  fontSize: 20, //
                ),
              ),
            )),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    ));
  }
}
