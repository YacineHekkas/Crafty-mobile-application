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
        padding: EdgeInsets.only(top: 10,right: 20),
      child: Container(
        decoration: BoxDecoration(
            color:AppConst.gray,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 1.0,

              ),
              const BoxShadow(
                color: Colors.white,

              )
            ],
            borderRadius: BorderRadius.circular(10)),
        width: 170,
        height: 200,
        child: Stack(
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
                  height: MediaQuery.of(context).size.height / 6,
                  fit: BoxFit.cover,
                ),
              ),
            ),//photo
            Align(
              alignment: const Alignment(-0.5, 0.82),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontFamily: AppConst.font,
                    fontWeight: FontWeight.w600),
              ),
            )//text
          ],
        ),
      ),
    );
  }
}