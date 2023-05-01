import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/registration/presentation/pages/zextra/sing_up_Screen.dart';
import 'package:flutter/material.dart';

import 'dart:core';

import '../../widgets/buttonGlobo.dart';
import '../../widgets/socail_widget.dart';
import '../../widgets/splittext.dart';
import '../../widgets/text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return bodyWidget();
  }

  bodyWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: TheUi(),
      ),
    );
  }

  SizedBox TheUi() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.all(25.0),
          // wrap this column inside of container and decorate it then add phone login
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  AppConst.appName,
                  style: TextStyle(
                    color: AppConst.darkBlue,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Login to your account',
                style: TextStyle(
                  color: AppConst.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              // Email input
              TextForm(
                controller: emailController,
                texthint: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                obscure: false,
              ),
              const SizedBox(
                height: 15,
              ),
              // password input
              TextForm(
                controller: passwordController,
                texthint: 'Enter your password',
                textInputType: TextInputType.text,
                obscure: true,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  '   Forgot your password ?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // button
              InkWell(
                onTap: () {
                  submitSingIn();
                },
                child: ButtonGlobo(text: 'Sing In'),
              ),
              const SizedBox(
                height: 50,
              ),
              SplitText(text: 'Or sing in with'),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: SocailContainer(
                          assetName: 'assets/images/icons8-google.svg',
                        )),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: SocailContainer(
                          assetName:
                              'assets/images/icons8-facebook-circled.svg'),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: SocailContainer(
                          assetName: 'assets/images/icons8-apple-logo.svg'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingUpScreen()));
                  },
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Don\'t have account? ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppConst.textColor,
                        ),
                      ),
                      TextSpan(
                          text: 'Sing up',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppConst.darkBlue,
                          )),
                    ]),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void submitSingIn() {}
}
