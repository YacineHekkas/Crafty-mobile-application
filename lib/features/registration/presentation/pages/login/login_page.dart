import 'package:cp_project/features/registration/presentation/pages/Introduction-Screens/SpliteTakeAction.dart';
import 'package:cp_project/features/registration/presentation/widgets/custom_textformfield.dart';
import 'package:cp_project/features/registration/presentation/widgets/functions.dart';
import 'package:cp_project/features/registration/presentation/widgets/page_title.dart';
import 'package:flutter/material.dart';
import '../../../../../core/global/global.dart';
import '../../widgets/buttonGlobo.dart';
import '../../widgets/textype.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool emailError =false;
  bool passWordError =false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppConst.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
              child: Column(
                  children: [
                    const SizedBox(
              height: 20,
            ),
                    Row(
              children: [pageTitle("Welcome back")],
            ),
                    const SizedBox(
              height: 10,
            ),
                    Row(
              children: [pageSubTitle("please log in to your account ")],
            ),
                    const SizedBox(height: 40.0),
                    Container(
              width: 100,
              height: 100,
              color: AppConst.gray,
            ),
                    const SizedBox(height: 40.0),
                    CustomTextField(
                      hint: 'Email address',
                      textEditingController: emailController,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      isThereError: emailError,
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextField(
                      hint:'Password',
                      textEditingController: passwordController,
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      isThereError: passWordError,
                    ),
                    const SizedBox(
              height: 10.0,
            ),
                    Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 0.0),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {


                      //TODO: add some bloc logic

                    },
                    child: textype(
                        text1: 'forget password ?', Color: Colors.grey)),
               ),
            ),
                    const SizedBox(
              height: 30.0,
            ),
                    SizedBox(
                      width: width/2,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emailError = !isEmailValid(emailController.value.text);
                            passWordError = !isPasswordValid(passwordController.value.text);
                          });
                        },
                        child: const ButtonGlobo(
                          text: 'Login',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: hight/6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textype(text1: 'Don\'t have an account ? '),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const chooseS_P()));
                            },
                            child:
                            textype(text1: 'sing in', Color: AppConst.orong))
                      ],
                    )

          ])
          ),
        ),
      ),
    );
  }

}
