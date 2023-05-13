import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/registration/presentation/pages/signup_pages/third_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttonGlobo.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/page_title.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatedPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
            backgroundColor: AppConst.bgColor,
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
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                          children: [
                        Row(
                          children: [pageTitle("Second step")],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [pageSubTitle("Set an email and password")],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 2200,
                          height: 60,
                          color: AppConst.gray,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                         CustomTextField(
                            hint: 'Address email',
                            textEditingController: emailController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                         ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                            hint: 'Password',
                            textEditingController: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: false,),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextField(
                          hint: 'Repeat password',
                          textEditingController: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: false,),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 60.0,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Center(
                                  child: Text(
                                    '+213',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: AppConst.darkBlue),
                                  )),
                            ),
                            SizedBox(width: 15,),
                            Expanded(

                                child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    height: 60,
                                    child: Form(
                                      child: TextFormField(
                                        controller: phoneController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            fillColor: AppConst.darkBlue,
                                            labelText: 'Phone number',
                                            helperStyle: TextStyle(
                                                color: AppConst.darkBlue,
                                                fontWeight: FontWeight.w500),
                                            counterText: "",
                                            border: InputBorder.none
                                        ),
                                        cursorWidth: 0.0,
                                        style: const TextStyle(
                                            color: AppConst.darkBlue,
                                            fontWeight: FontWeight.w500),
                                        maxLength: 9,
                                        showCursor: false,
                                      ),
                                    ))),

                          ],
                        ),
                        SizedBox(
                          height: height / 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ThirdPage()));
                          },
                          child: ButtonGlobo(
                            text: ConstStrings.next,
                          ),
                        ),
                      ]
                      )
                  )
              ),
            )
        );
  }
}
