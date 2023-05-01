import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import '../../widgets/buttonGlobo.dart';
import '../../widgets/socail_widget.dart';
import '../../widgets/splittext.dart';
import '../../widgets/text_form.dart';

import 'login_Screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: TheUi(),
        ),
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
                height: 10,
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
                'Create your account',
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
                height: 15,
              ),
              // confirm password input
              TextForm(
                controller: passwordConfirmController,
                texthint: 'Confirm password',
                textInputType: TextInputType.text,
                obscure: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 50,
              ),
              // button
              InkWell(
                onTap: () {
                  submitSingUp();
                },
                child: ButtonGlobo(text: 'Sing Up'),
              ),
              const SizedBox(
                height: 50,
              ),
              SplitText(text: 'Or sing up with'),
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
                height: 40,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'already you have account? ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppConst.textColor,
                        ),
                      ),
                      TextSpan(
                          text: 'Sing in',
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

  void submitSingUp() {}
}
