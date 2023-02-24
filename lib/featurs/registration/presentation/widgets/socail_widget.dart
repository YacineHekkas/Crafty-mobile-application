import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocailContainer extends StatelessWidget {
  const SocailContainer({Key? key, required this.assetName}) : super(key: key);
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 65,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 7,
          )
        ]
      ),
      child: SvgPicture.asset(
          assetName,
        height: 30,
      ),
    );
  }
}
