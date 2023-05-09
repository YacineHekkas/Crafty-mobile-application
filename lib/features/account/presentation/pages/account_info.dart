import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  final UserEntity? userInfo;
  const AccountInfo({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:AppConst.bgColor ,
          appBar: AppBar(
            backgroundColor: AppConst.bgColor,
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize : MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  chowInfo(userInfo?.name, "Full name"),
                  chowInfo(userInfo?.email, "Email"),
                  chowInfo(userInfo?.phone, "Phone number"),
                  chowInfo("${userInfo?.location.district}, ${userInfo?.location.state}, Algeria", "Location"),
                  userInfo!.provider?chowInfo("You are currently a provider", "Role"):
                  chowInfo("You are currently a client", "Role"),
                  chowInfo(userInfo?.gender, "Gender"),
                  chowInfo(userInfo?.createdAt, "Date of creation"),
                ],
              ),
            ),
          ),
        )
    );
  }
  Padding chowInfo(String? info,String infoType){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            info!,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: AppConst.font,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          Text(
            infoType,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xffc9c9c9),
            ),
          ),
        ],
      ),
    );
  }
}
