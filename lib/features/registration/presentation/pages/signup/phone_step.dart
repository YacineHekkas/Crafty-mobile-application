import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:cp_project/features/registration/presentation/widgets/LoadingWidget.dart';
import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:cp_project/features/registration/presentation/widgets/varification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/global/global.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/UserS.dart';
import '../../bloc/loginBloc/bloc/Auth_bloc.dart';
import '../../widgets/Textfieled.dart';
import '../../widgets/textype.dart';

class Phone_step extends StatefulWidget {
  final String fullName;
  final String username;
  final String? gender;
  final String paaword;
  final String email;
  final Location location;
  Phone_step(
      {super.key,
      required this.fullName,
      required this.username,
      this.gender,
      required this.paaword,
      required this.email,
      required this.location});

  @override
  State<Phone_step> createState() =>
      _Phone_stepState(fullName, username, gender, paaword, email, location);
}

class _Phone_stepState extends State<Phone_step> {
  final String fullName;
  final String username;
  final String? gender;
  final String paaword;
  final String email;
  final Location location;
  _Phone_stepState(
    this.fullName,
    this.username,
    this.gender,
    this.paaword,
    this.email,
    this.location,
  );
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: locator<AuthBloc>(),
      listener: (_, s) {
        print(s);
        if (s is SuccessedSign) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Verification()));
        }
      },
      builder: (ctx, s) => s is LoadingState ? LoadingWidget() :
         Scaffold(
          backgroundColor: AppConst.bgColor,
          body: Column(children: [
            Padding(
          padding: const EdgeInsets.only(
            top: 110.0,
          ),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 150.0, left: 15.0),
                child: Text(
                  ConstStrings.last,
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
              if (s is FailedSign)
               Text('Failed, try again'),
              Padding(
                padding: const EdgeInsets.only(right: 150.0, left: 30.0),
                child: Container(
                  child: textype(
                    text1: ConstStrings.number,
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
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 20.0),
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
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 60.0,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  margin:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: AppConst.gray,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(
                    '+213',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppConst.darkBlue),
                  )),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: AppConst.gray,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 59,
                        width: 224,
                        child: Form(
                          child: TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              fillColor: AppConst.darkBlue,
                              labelText: 'phone number',
                              labelStyle:
                                  TextStyle(color: AppConst.darkBlue),
                              helperStyle: TextStyle(
                                  color: AppConst.darkBlue,
                                  fontWeight: FontWeight.w500),
                              counterText: "",
                              border: InputBorder.none
                            ),
                            cursorWidth: 0.0,
                            style: TextStyle(
                                color: AppConst.darkBlue,
                                fontWeight: FontWeight.w500),
                            maxLength: 9,
                            showCursor: false,
                          ),
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 200.0,
          ),
          GestureDetector(
              onTap: () {
                _sumbitinfo();
              },
              child: ButtonGlobo(text: ConstStrings.code)),
            ]))
          ])),
    );
  }

  void _sumbitinfo() {
    if (phone.text.isNotEmpty) {
      locator<AuthBloc>().add(SignupEvent(
          users: UserS(
        email: email,
        password: paaword,
        username: username,
        name: fullName,
        gender: gender,
        location: location,
        phone: '0${phone.value.text}',
      )));
      

      
    } else if (phone.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Filed can\'t be empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: AppConst.darkBlue,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }
}
