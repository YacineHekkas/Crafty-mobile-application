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
  TextEditingController fullname1 = TextEditingController();
  // List<String> listitem = ["Male", "Female", "other"];
  String? _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.bgColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100.0, left: 15.0),
                  child: Text(
                    ConstStrings.gs,
                    style: TextStyle(
                        fontFamily: AppConst.font,
                        color: AppConst.darkBlue,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
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
          SizedBox(
            height: 50.0,
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 20.0),
                child: Container(
                    width: 300,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                    )),
              ),
              SizedBox(
                height: 55.0,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Textfieled(
                      controller: fullname1,
                      hintText1: ConstStrings.full_name,
                      textInputType: TextInputType.name)),
              SizedBox(
                height: 35.0,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Textfieled(
                      controller: username1,
                      hintText1: ConstStrings.user_name,
                      textInputType: TextInputType.name)),
              SizedBox(
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33.0, right: 20.0),
                child: Row(
                  children: [
                    Text(
                      ConstStrings.gender,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.0),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 53.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButton<String>(
                        value: _value,
                        //selected
                        icon: Icon(Icons.swipe_down),
                        iconSize: 24,
                        elevation: 16,

                        style: TextStyle(
                            color: AppConst.textColor, fontSize: 20.0),

                        onChanged: (newValue) {
                          setState(() {});
                          _value = newValue!;
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
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextButton(
                onPressed: () {
                  _sumbitinfo();
                  if (fullname1.text.isNotEmpty && username1.text.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Secondpage(
                                  username: username1.value.text,
                                  fullName: fullname1.value.text,
                                  gender: _value,
                                )));
                  }
                },
                child: ButtonGlobo(
                  text: ConstStrings.next,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                textype(text1: ConstStrings.have_acc, Color: AppConst.darkBlue),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Loginscreen()));
                    },
                    child: textype(
                        text1: ConstStrings.sign, Color: AppConst.orong))
              ])
            ],
          )),
        ])));
  }

  void _sumbitinfo() {
    if (fullname1.text.isEmpty || username1.text.isEmpty) {
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
