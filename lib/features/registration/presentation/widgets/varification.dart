import 'package:cp_project/core/global/Screens.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:cp_project/features/registration/data/data_sources/dataSource.dart';
import 'package:cp_project/features/registration/presentation/bloc/loginBloc/bloc/Auth_bloc.dart';
import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:cp_project/features/registration/presentation/widgets/textype.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final digit1 = TextEditingController();
  final digit2 = TextEditingController();
  final digit3 = TextEditingController();
  final digit4 = TextEditingController();
  final digit5 = TextEditingController();
  final digit6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppConst.bgColor,
      body: BlocBuilder(
        bloc: locator<AuthBloc>(),
        builder: (c, s) => s is LoadingState
            ? const LoadingWidget()
            : Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                     Align(
                       alignment: Alignment.topLeft,
                       child: Text('Verify your email',
                          style: TextStyle(color: AppConst.darkBlue, fontSize: 38, fontFamily: AppConst.font, fontWeight: FontWeight.w700 )),
                     ),
                    const SizedBox(
                      height: 100,
                    ),
                        const Text('Enter the 6-digits code',
                        style: TextStyle(fontSize: 26)),
                    if (s is FailedSign)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Invalid code, try again'),
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildDigitFiend(digit1),
                            _buildDigitFiend(digit2),
                            _buildDigitFiend(digit3),
                            _buildDigitFiend(digit4),
                            _buildDigitFiend(digit5),
                            _buildDigitFiend(digit6),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: GestureDetector(
                              onTap: () {
                               locator<Datasource>().Sendverification();
                              },
                              child: textype(
                                  text1: 'Resend code', Color: AppConst.orong)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    GestureDetector(
                        onTap: () async {
                          if (digit1.value.text.isEmpty ||
                              digit2.value.text.isEmpty ||
                              digit3.value.text.isEmpty) {
                            return;
                          }
                          locator<AuthBloc>().emit(LoadingState());

                          try {
                            final b = await locator<Datasource>().Isverified(
                                '${digit1.value.text}${digit2.value.text}${digit3.value.text}${digit4.value.text}${digit5.value.text}${digit6.value.text}');

                            if (b) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavScreen()));
                            }
                          } catch (e) {
                            locator<AuthBloc>().emit(FailedSign(message: 'bb'));
                            print(e);
                          }
                        },
                        child: const ButtonGlobo(text: 'Verify'))
                  ],
                ),
            ),
      ),
    ));
  }
}

Widget _buildDigitFiend(TextEditingController c) {
  return SizedBox(
    height: 60,
    width: 60,
    child: Padding(
      padding: const EdgeInsets.only(right: 4),
      child: TextFormField(
        controller: c,
        minLines: 1,
        maxLines: 1,
        maxLength: 1,
        onChanged: (v) {
          if (v.isNotEmpty) {}
        },
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(22),
        ),
      ),
    ),
  );
}
