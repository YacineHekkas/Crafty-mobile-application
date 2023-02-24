import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplitText extends StatelessWidget {
  const SplitText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsetsDirectional.only( end: 10.0),
          width: MediaQuery.of(context).size.width/ 7,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:Colors.black,
          ),

        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),

        ),
        Container(
          margin: const EdgeInsetsDirectional.only( start: 10.0),
          width: MediaQuery.of(context).size.width/ 7,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:Colors.black,
          ),

        )
      ],
    );
  }
}
