import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:cp_project/features/registration/presentation/pages/Introduction-Screens/SpliteTakeAction.dart';
import 'package:cp_project/features/registration/presentation/widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/global/global.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/User.dart';
import '../../bloc/loginBloc/bloc/Auth_bloc.dart';
import '../../widgets/Textfieled.dart';
import '../../widgets/buttonGlobo.dart';
import '../../widgets/textype.dart';
import '../signup/st_step.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: locator<AuthBloc>(),
      listener: (_, s) {
        print(s);
        if (s is Successedlogin) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NavScreen()));
        }
      },
      builder: (c, s) => s is LoadingState ? LoadingWidget() : Scaffold(
        backgroundColor: AppConst.bgColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 5.0),
          child: SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 155.0),
              child: Container(
                  margin: EdgeInsets.fromLTRB(12, 70.0, 0, 0),
                  width: 175,
                  height: 148,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(
                      ConstStrings.wel,
                      style: TextStyle(
                          fontFamily: AppConst.font,
                          color: AppConst.darkBlue,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      child: textype(
                          text1: ConstStrings.login_mes,
                          Color: AppConst.textColor)),
                ],
              ),
            ),

            SizedBox(height: 40.0),

            if (s is FailedSign)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Failed login, try again'),
              ),

            Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Textfieled(
                    controller: username,
                    hintText1: ConstStrings.email,
                    textInputType: TextInputType.name)),
            // for the user_name
            SizedBox(
              height: 25.0,
            ),

            Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Textfieled(
                    controller: password,
                    hintText1: ConstStrings.pass,
                    absc: true,
                    textInputType: TextInputType.text)),

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
            SizedBox(
              height: 40.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _sumbitinfo();
                    },
                    child: ButtonGlobo(
                      text: ConstStrings.login,
                    ),
                  ),
                  SizedBox(
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
                                    builder: (context) => chooseS_P()));
                          },
                          child: textype(
                              text1: ConstStrings.sign, Color: AppConst.orong))
                    ],
                  )
                ],
              ),
            ),
          ])),
        ),
      ),
    );
  }

  void _sumbitinfo() {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      locator<AuthBloc>().add(LoginEvent(
          usera: User(
        password: password.value.text,
        indentifier: username.value.text,
      )));
    }
  }
}
