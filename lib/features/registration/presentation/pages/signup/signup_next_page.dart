import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';
import 'package:cp_project/features/registration/presentation/pages/signup/signup_verification_page.dart';
import 'package:cp_project/features/registration/presentation/widgets/functions.dart';
import 'package:cp_project/features/registration/presentation/widgets/loading_overlay.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:cp_project/features/registration/presentation/widgets/custom_textformfield.dart';
import 'package:cp_project/features/registration/presentation/widgets/page_title.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupNextPage extends StatefulWidget {
  final bool hasBackArrow;

  const SignupNextPage({super.key, this.hasBackArrow = true});

  @override
  State<SignupNextPage> createState() => _SignupNextPage();
}

class _SignupNextPage extends State<SignupNextPage> {
  final bloc = locator<AuthBloc>();
  late final width = MediaQuery.of(context).size.width;
  late final height = MediaQuery.of(context).size.height;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatedPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final emailValid = ValueNotifier<bool>(true);
  final passWordValid = ValueNotifier<bool>(true);
  final repeatedPassWordValid = ValueNotifier<bool>(true);
  final phoneValid = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listenWhen: (p, c) =>
          c.status == AuthStatus.register && p.result != c.result ||
          c.status == AuthStatus.verification,
      listener: (ctx, s) {
        if (s.status == AuthStatus.verification &&
            s.result == AuthResult.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupVerificationPage(
                hasBackArrow: false,
              ),
            ),
          );

          return;
        }
        if (s.status == AuthStatus.register && s.result == AuthResult.failure) {
          Fluttertoast.showToast(
            msg: s.lastException ?? 'Please check your connection',
            fontSize: 16.0,
          );
        }
      },
      buildWhen: (_, c) =>
          c.status == AuthStatus.register ||
          c.status == AuthStatus.verification && c.result != AuthResult.pending,
      builder: (c, s) => LoadingOverlay(
        isLoading: s.result == AuthResult.pending,
        child: Scaffold(
          backgroundColor: AppConst.bgColor,
          appBar: AppBar(
            backgroundColor: AppConst.bgColor,
            elevation: 0,
            leading: widget.hasBackArrow
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null,
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
                      validator: isEmailValid,
                      valid: emailValid,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      hint: 'Password',
                      textEditingController: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: isPasswordValid,
                      valid: passWordValid,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      hint: 'Repeat password',
                      textEditingController: repeatedPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) =>
                          value.isNotEmpty &&
                          passwordController.value.text == value,
                      valid: repeatedPassWordValid,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      hint: 'Phone number',
                      maxLength: 10,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4, left: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              '\u{1F1E9}\u{1F1FF}',
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('+213'),
                          ],
                        ),
                      ),
                      textEditingController: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: isPhoneValid,
                      valid: phoneValid,
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (emailValid.value &&
                            passWordValid.value &&
                            phoneValid.value &&
                            repeatedPassWordValid.value) {
                          bloc.add(
                            UpdateRegistrationDataEvent(
                              step: 2,
                              email: emailController.value.text,
                              password: passwordController.value.text,
                              phone: phoneController.value.text,
                            ),
                          );

                          bloc.add(const AccountRegisterEvent());
                        }
                      },
                      child: const ButtonGlobo(
                        text: 'Sign up',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
