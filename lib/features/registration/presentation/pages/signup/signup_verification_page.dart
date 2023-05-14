import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:cp_project/features/registration/data/data_sources/remote_data_source/auth_source.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';
import 'package:cp_project/features/registration/presentation/widgets/loading_overlay.dart';
import 'package:cp_project/features/registration/presentation/widgets/page_title.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupVerificationPage extends StatefulWidget {
  final bool hasBackArrow;

  const SignupVerificationPage({super.key, this.hasBackArrow = true});

  @override
  State<SignupVerificationPage> createState() => _SignupVerificationPage();
}

class _SignupVerificationPage extends State<SignupVerificationPage> {
  final bloc = locator<AuthBloc>();

  final otpController0 = TextEditingController();
  final otpController1 = TextEditingController();
  final otpController2 = TextEditingController();
  final otpController3 = TextEditingController();
  final otpController4 = TextEditingController();
  final otpController5 = TextEditingController();

  String otpValue = '';
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listenWhen: (p, c) =>
          c.status == AuthStatus.verification && p.result != c.result,
      listener: (ctx, s) {
        if (s.status == AuthStatus.verification &&
            s.result == AuthResult.authenticated) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NavScreen(),
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
      buildWhen: (_, c) => c.status == AuthStatus.verification,
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
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [pageTitle("Last step")],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [pageSubTitle("Verify your email")],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/illustration-3.png',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Enter your OTP code number",
                    style: TextStyle(
                      fontFamily: AppConst.font,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<AuthBloc, AuthState>(
                            bloc: bloc,
                            builder: (context, state) {
                              error = state.result == AuthResult.failure;

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 48,
                                    height: 68,
                                    child: _textFieldOTP(0, otpController0),
                                  ),
                                  SizedBox(
                                    width: 48,
                                    height: 68,
                                    child: _textFieldOTP(1, otpController1),
                                  ),
                                  SizedBox(
                                    width: 48,
                                    height: 68,
                                    child: _textFieldOTP(2, otpController2),
                                  ),
                                  SizedBox(
                                    width: 48,
                                    height: 68,
                                    child: _textFieldOTP(3, otpController3),
                                  ),
                                  SizedBox(
                                    width: 48,
                                    height: 68,
                                    child: _textFieldOTP(4, otpController4),
                                  ),
                                  SizedBox(
                                    width: 48,
                                    height: 68,
                                    child: _textFieldOTP(5, otpController5),
                                  ),
                                ],
                              );
                            }),
                        const SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                error = false;
                              });

                              if (otpController0.value.text.isEmpty ||
                                  otpController1.value.text.isEmpty ||
                                  otpController2.value.text.isEmpty ||
                                  otpController3.value.text.isEmpty ||
                                  otpController4.value.text.isEmpty ||
                                  otpController4.value.text.isEmpty) {
                                setState(() {
                                  error = true;
                                });

                                return;
                              }

                              bloc.add(
                                AccountVerificationEvent(
                                  code: otpController0.value.text +
                                      otpController1.value.text +
                                      otpController2.value.text +
                                      otpController3.value.text +
                                      otpController4.value.text +
                                      otpController5.value.text,
                                ),
                              );
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppConst.darkBlue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Verify',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Didn't you receive any code?",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: AppConst.font,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      locator<AuthSource>().sendVerificationCode().then(
                            (_) => Fluttertoast.showToast(
                              msg: 'New verification code has been sent!',
                              fontSize: 16.0,
                            ),
                          );
                    },
                    child: const Text(
                      "Resend New Code",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppConst.font,
                        fontWeight: FontWeight.bold,
                        color: AppConst.orong,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  Widget _textFieldOTP(int index, TextEditingController controller) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: TextField(
        controller: controller,
        autofocus: true,
        onChanged: (value) {
          setState(() {
            error = value.isEmpty;
          });
          if (value.length == 1 && index != 5) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index != 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: error ? Colors.red : Colors.black12,
              ),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: AppConst.orong),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
