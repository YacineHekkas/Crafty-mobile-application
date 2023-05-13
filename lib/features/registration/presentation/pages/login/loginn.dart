import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:cp_project/features/registration/presentation/pages/Introduction-Screens/SpliteTakeAction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/global/global.dart';
import '../../../../../injection_container.dart';

import '../../widgets/buttonGlobo.dart';
import '../../widgets/textype.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 5.0),
        child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 155.0),
                child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 70.0, 0, 0),
                    width: 175,
                    height: 148,
                    decoration: const BoxDecoration(
                      color: Color(0xffd9d9d9),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Text(
                        ConstStrings.wel,
                        style: const TextStyle(
                            fontFamily: AppConst.font,
                            color: AppConst.darkBlue,
                            fontSize: 32,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        child: textype(
                            text1: ConstStrings.login_mes,
                            Color: AppConst.textColor)),
                  ],
                ),
              ),

              const SizedBox(height: 40.0),

              Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextField
                    (
                      controller: username,

                  )),
              // for the user_name
              const SizedBox(
                height: 25.0,
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextField(
                      controller: password,

                  )
              ),

              // for the password
              /*SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 0.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {},
                  child: textype(
                      text1: ConstStrings.forget, Color: AppConst.darkBlue)),*/
              //    ),
              //),
              const SizedBox(
                height: 40.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: ButtonGlobo(
                        text: ConstStrings.login,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textype(text1: ConstStrings.exception),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const chooseS_P()));
                            },
                            child: textype(
                                text1: ConstStrings.sign, Color: AppConst
                                .orong))
                      ],
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
