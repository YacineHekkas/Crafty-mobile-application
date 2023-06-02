import 'package:cp_project/core/global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String categoryName;
  final String imgPath;

  const CardWidget(
      {Key? key, required this.categoryName, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          decoration: BoxDecoration(
            color:Color(0xfff1f1f1f1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(4, 0), // Shadow offset from left side
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 4), // Shadow offset from right side
                  blurRadius: 2,
                ),
              ],
            borderRadius: BorderRadius.circular(10)
          ),
        width: MediaQuery.of(context).size.width/2.2,
        height: MediaQuery.of(context).size.width/4.8,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(
                  imgPath,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: Text(
                  categoryName,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: AppConst.font,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )//text
          ],
        ),
      ),
    );
  }
}