import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/global/global.dart';

Row rowChip(String path,String title,bool isItBlack){
  return Row(
    children: [
      const SizedBox(width: 10,),
      SvgPicture.asset(
        path,
        width: 30,
        height: 28,
        colorFilter: ColorFilter.mode(isItBlack? Colors.black87.withOpacity(0.6):Colors.white, BlendMode.srcIn),
      ),
      const SizedBox(width: 10,),
       Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w300,
            fontFamily: AppConst.font,
            fontSize: 20,
            color: isItBlack? Colors.black87.withOpacity(0.7):
                Colors.white
        ),
      ),
       Expanded(
          flex: 1,
          child:Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_forward_ios,
              color: isItBlack? const Color(0xff000000):
              Colors.white,
              size: 18,
            ),
          )
      ),
      const SizedBox(width: 10,),

    ],
  );
}