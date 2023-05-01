import 'package:cp_project/features/registration/presentation/widgets/textype.dart';
import 'package:flutter/material.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../widgets/Textfieled.dart';
import '../../widgets/buttonGlobo.dart';

class signUP extends StatefulWidget {
  const signUP({super.key});

  @override
  State<signUP> createState() => _signUPState();
}

class _signUPState extends State<signUP> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.bgColor,
        body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 155.0),
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                    width: 175,
                    height: 148,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120.0),
                child: Container(
                  child: Text(
                    ConstStrings.gett,
                    style: TextStyle(
                        fontFamily: AppConst.font,
                        color: AppConst.darkBlue,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 75.0),
                child: Container(child: textype(text1: ConstStrings.sign_mes)),
              ),
              Textfieled(
                  controller: fullname,
                  hintText1: 'Full name ',
                  textInputType: TextInputType.name),
              Textfieled(
                  controller: username,
                  hintText1: 'User name',
                  textInputType: TextInputType.name),
              SizedBox(
                height: 5.0,
              ),
              Textfieled(
                  controller: email,
                  hintText1: 'Address email ',
                  textInputType: TextInputType.emailAddress),
              Container(
                height: 60.0,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: AppConst.gray,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (value) {},
                ),
              ),
              Textfieled(
                controller: password,
                hintText1: 'password',
                textInputType: TextInputType.text,
                absc: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {},
                child: ButtonGlobo(
                  text: ConstStrings.sign,
                ),
              ),
            ]))));
  }
}
