import 'package:cp_project/features/registration/presentation/pages/signup/location/location_page.dart';
import 'package:cp_project/features/registration/presentation/pages/signup/phone_step.dart';
import 'package:cp_project/features/registration/presentation/pages/signup/st_step.dart';
import 'package:cp_project/features/registration/presentation/widgets/text_form.dart';
import 'package:cp_project/features/registration/presentation/widgets/textype.dart';
import 'package:flutter/material.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/UserS.dart';
import '../../bloc/loginBloc/bloc/Auth_bloc.dart';
import '../../widgets/Textfieled.dart';
import '../../widgets/buttonGlobo.dart';
import 'email.dart';

class Secondpage extends StatefulWidget {
  final String fullName;
  final String username;
  final String? gender;
  Secondpage(
      {super.key, required this.fullName, required this.username, this.gender});

  @override
  State<Secondpage> createState() =>
      _SecondpageState(fullName, username, gender);
}

class _SecondpageState extends State<Secondpage> {
  @override
  final String fullName;
  final String username;
  final String? gender;
  _SecondpageState(this.fullName, this.username, this.gender);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.bgColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 150.0, left: 15.0),
                  child: Text(
                    ConstStrings.nd_step,
                    style: TextStyle(
                        fontFamily: AppConst.font,
                        color: AppConst.darkBlue,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Container(
                    child: textype(
                      text1: ConstStrings.ns_mes,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 40.0),
                  child: Container(
                      width: 300,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(0xffd9d9d9),
                      )),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Textfieled(
                    controller: email,
                    textInputType: TextInputType.emailAddress,
                    absc: false,
                    hintText1: 'adress email ',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Textfieled(
                      controller: password,
                      hintText1: 'password',
                      textInputType: TextInputType.text,
                      absc: true,
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Textfieled(
                      controller: repeat,
                      hintText1: 'Repeat password ',
                      textInputType: TextInputType.text,
                      absc: true,
                    )),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    _sumbitinfo();
                    if (email.text.isNotEmpty &&
                        password.text.isNotEmpty &&
                        password.value.text == repeat.value.text) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Location_page(
                                    username: username,
                                    fullName: fullName,
                                    gender: gender,
                                    email: email.value.text,
                                    paaword: password.value.text,
                                  )));
                    }
                  },
                  child: ButtonGlobo(
                    text: ConstStrings.next,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  // ignore: dead_code
  void _sumbitinfo() {
    if (email.text.isEmpty || password.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Filed can\'t be empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: AppConst.darkBlue,
          textColor: Colors.white,
          fontSize: 20.0);
    } else if (password.value.text != repeat.value.text) {
      Fluttertoast.showToast(
          msg: 'unmatching password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: AppConst.darkBlue,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }
}
