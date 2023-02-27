import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage2 extends StatelessWidget {
  const introPage2({Key? key}) : super(key: key);

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
              'assets/animation/secondpage.json',
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Center(
                  child: Text(
                'NEED HOME REPAIRS OR RENOVLATIONS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 40.0,
            ),
            Center(
                child: Text(
              'couldnt find a trused craftworkwer!',
              style: TextStyle(fontSize: 18.0),
            )),
          ],
        ),
      ),
    ));
  }
}
