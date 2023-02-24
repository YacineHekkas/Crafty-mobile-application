
import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: AppConst.bleu ,
        ),
      ),
    );
  }
}