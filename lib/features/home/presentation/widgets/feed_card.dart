import 'package:cp_project/core/global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class feedCard extends StatelessWidget {

  const feedCard({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child:Stack(
          children: [
            ClipRRect(// this to change the shape of the childe inside in our case thw img
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                'assets/images/feed_home_page.png',
                width:MediaQuery.of(context).size.width/1,
                height:MediaQuery.of(context).size.height/3,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.9)
                      ],
                      stops: const [
                        0.3,1
                      ]
                  )
              ),
              width:MediaQuery.of(context).size.width/1,
              height:MediaQuery.of(context).size.height/3,

              alignment: Alignment(0,0.5),

              child: const Text(
                AppConst.feedCardText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppConst.font,
                  color: AppConst.bgColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
