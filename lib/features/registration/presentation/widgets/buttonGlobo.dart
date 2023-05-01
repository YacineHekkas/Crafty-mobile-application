import 'package:cp_project/core/global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGlobo extends StatelessWidget {
  const ButtonGlobo({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
            color: AppConst.darkBlue,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.3),
                blurRadius: 10,
              ),
            ]),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: CupertinoColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
