import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';
import 'package:cp_project/features/registration/presentation/pages/introduction/intro_final_page.dart';
import 'package:cp_project/features/registration/presentation/pages/signup/signup_verification_page.dart';
import 'package:cp_project/features/registration/presentation/widgets/custom_textformfield.dart';
import 'package:cp_project/features/registration/presentation/widgets/functions.dart';
import 'package:cp_project/features/registration/presentation/widgets/loading_overlay.dart';
import 'package:cp_project/features/registration/presentation/widgets/page_title.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:cp_project/features/registration/presentation/widgets/textype.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  final bool hasBackArrow;

  const LoginScreen({super.key, this.hasBackArrow = true});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final bloc = locator<AuthBloc>();
  late final hight = MediaQuery.of(context).size.height;
  late final width = MediaQuery.of(context).size.width;

  final indentifierController = TextEditingController();
  final passwordController = TextEditingController();

  final indentifierValid = ValueNotifier<bool>(false);
  final passWordValid = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listenWhen: (p, c) =>
          c.status == AuthStatus.login && p.result != c.result,
      listener: (ctx, s) {
        if (s.status == AuthStatus.login &&
            s.result == AuthResult.authenticated) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => s.isVerified
                  ? const NavScreen()
                  : const SignupVerificationPage(),
            ),
          );

          return;
        }
        if (s.result == AuthResult.failure) {
          Fluttertoast.showToast(
            msg: s.lastException ?? 'Please check your connection',
            fontSize: 16.0,
          );
        }
      },
      buildWhen: (_, c) => c.status == AuthStatus.login,
      builder: (c, s) => LoadingOverlay(
        isLoading: s.result == AuthResult.pending,
        child: Scaffold(
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
                      children: [
                        pageSubTitle("Please log in to your account ")
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      width: 100,
                      height: 100,
                      color: AppConst.gray,
                    ),
                    const SizedBox(height: 40.0),
                    CustomTextField(
                      hint: 'Username, Email address or phone number',
                      textEditingController: indentifierController,
                      keyboardType: TextInputType.name,
                      validator: (value) => value.isNotEmpty,
                      valid: indentifierValid,
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextField(
                      hint: 'Password',
                      textEditingController: passwordController,
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      validator: (value) => value.isNotEmpty,
                      valid: passWordValid,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 0.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: textype(
                            text1: 'Forget your password?',
                            Color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: width / 2,
                      child: GestureDetector(
                        onTap: () {
                          if (!passWordValid.value || !indentifierValid.value) return;

                          bloc.add(
                            AccountLoginEvent(
                              indentifier: indentifierController.value.text,
                              password: passwordController.value.text,
                            ),
                          );
                        },
                        child: const ButtonGlobo(
                          text: 'Login',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: hight / 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textype(text1: 'Don\'t have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IntroFinalPage(),
                              ),
                            );
                          },
                          child: textype(
                              text1: 'Signup now!', Color: AppConst.orong),
                        )
                      ],
                    )
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