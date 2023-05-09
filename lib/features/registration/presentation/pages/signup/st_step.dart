import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:cp_project/features/registration/presentation/pages/signup/nd_step.dart';
import 'package:cp_project/features/registration/presentation/widgets/textype.dart';
import 'package:flutter/material.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../injection_container.dart';
import '../../bloc/loginBloc/bloc/Auth_bloc.dart';
import '../../widgets/Textfieled.dart';
import '../../widgets/buttonGlobo.dart';
import 'package:flutter/src/material/dropdown.dart';

import '../login/loginn.dart';

class Stpage extends StatefulWidget {
  const Stpage({super.key});

  @override
  State<Stpage> createState() => _StpageState();
}

class _StpageState extends State<Stpage> {
  @override
  TextEditingController username1 = TextEditingController();
  TextEditingController stName = TextEditingController();
  TextEditingController ndName = TextEditingController();
  // List<String> listitem = ["Male", "Female", "other"];
  String? _value;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppConst.bgColor,
          body: SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0, left: 15.0),
                    child: Text(
                      ConstStrings.gs,
                      style: const TextStyle(
                          fontFamily: AppConst.font,
                          color: AppConst.darkBlue,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      child: textype(
                        text1: ConstStrings.gs_mes,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 20.0),
                  child: Container(
                      width: 300,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                      )),
                ),
                const SizedBox(
                  height: 45.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Textfieled(
                        controller: stName,
                        hintText1: 'First name ',
                        textInputType: TextInputType.name)),
                const SizedBox(
                  height: 35.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Textfieled(
                        controller: ndName,
                        hintText1: 'Last name ',
                        textInputType: TextInputType.name)),
                const SizedBox(
                  height: 35.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Textfieled(
                        controller: username1,
                        hintText1: ConstStrings.user_name,
                        textInputType: TextInputType.name)),
                const SizedBox(
                  height: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33.0, right: 20.0),
                  child: Row(
                    children: [
                      Text(
                        ConstStrings.gender,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0),
                      ),
                      DropdownButton<String>(
                        value: _value,
                        //selected
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        iconSize: 24,
                        elevation: 16,

                        style: const TextStyle(
                            color: AppConst.textColor, fontSize: 20.0),

                        onChanged: (newValue) {
                          setState(() {
                            _value = newValue!;
                          });
                        },
                        items: <String>[
                          ConstStrings.male,
                          ConstStrings.female,
                          ConstStrings.unspecified
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    _sumbitinfo();
                    if (stName.text.isNotEmpty && username1.text.isNotEmpty && ndName.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondpage(
                                    username: username1.value.text,
                                    fullName: "${stName.value.text} ${ndName.value.text}",
                                    gender: _value,
                                  )));
                    }
                  },
                  child: ButtonGlobo(
                    text: ConstStrings.next,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  textype(
                      text1: ConstStrings.have_acc,
                      Color: AppConst.darkBlue),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Loginscreen()));
                      },
                      child: textype(
                          text1: ConstStrings.login, Color: AppConst.orong))
                ])
              ],
            )),
          ]))),
    );
  }

  void _sumbitinfo() {
    if (stName.text.isEmpty || username1.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Filed can\'t be empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: AppConst.darkBlue,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }
}
