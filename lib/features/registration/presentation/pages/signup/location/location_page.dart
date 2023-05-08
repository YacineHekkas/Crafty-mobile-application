import 'dart:ui';
import 'package:cp_project/features/registration/presentation/pages/signup/phone_step.dart';
import 'package:cp_project/features/registration/presentation/widgets/Textfieled.dart';
import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:cp_project/features/registration/presentation/widgets/text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../../../core/global/global.dart';

import '../../../../domain/entities/UserS.dart';
import '../../../widgets/textype.dart';
import 'get_coordinates.dart';
import 'location_parameters.dart';

class Location_page extends StatefulWidget {
  final String fullName;
  final String username;
  final String? gender;
  final String paaword;
  final String email;
  const Location_page(
      {super.key,
      required this.fullName,
      required this.username,
      this.gender,
      required this.paaword,
      required this.email});

  @override
  State<Location_page> createState() =>
      _Location_pageState(fullName, username, gender, paaword, email);
}

class _Location_pageState extends State<Location_page> {
  final String fullName;
  final String username;
  final String? gender;
  final String paaword;
  final String email;

  _Location_pageState(
      this.fullName, this.username, this.gender, this.paaword, this.email);

  int selectedWilaya = 0;
  int selectedBaladya = 0;
  Position? myPosition;
  String? value;
  String? baladya;
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
                padding: const EdgeInsets.only(right: 200.0, left: 0.0),
                child: Text(
                  ConstStrings.location,
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
                padding: const EdgeInsets.only(right: 100.0),
                child: Container(
                  child: textype(
                    text1: ConstStrings.giveL,
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
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 40.0),
            child: Container(
                width: 300,
                height: 90,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                )),
          ),
        ])),
        SizedBox(
          height: 50.0,
        ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////=> states
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 65.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButton<String>(
                hint: Text(ConstStrings.state),
                value: value,
                //selected
                icon: const Icon(
                  Icons.arrow_downward,
                  color: AppConst.darkBlue,
                ),
                iconSize: 24,
                elevation: 16,

                // style: TextStyle(
                //     color: AppConst.textColor, fontSize: 20.0),

                onChanged: (newValue) {
                  setState(() {
                    if (newValue == null) {
                    } else {
                      value = newValue;
                    }
                  });
                },
                items: [
                  for (int abc = 0; abc < States.length; abc++)
                    DropdownMenuItem<String>(
                        onTap: () => setState(() {
                              selectedWilaya = abc;

                              /// pointeur ta3 wilaya
                              baladya = District[abc][0];
                              //// lazem tkoun haka sinon bcz bladiya we dont know tema directly ki dir wilaya ttla3 baladiya lewla as initial value  it won't work FOR REAL !
                            }),
                        value: States[
                            abc], // we pass the real value of the state according to the index selected
                        child: Text(States[abc].toString())),
                ]),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////=> districts
        Container(
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButton<String>(
              hint: Text(ConstStrings.District),
              value: baladya,
              //selected
              icon: const Icon(Icons.arrow_downward, color: AppConst.darkBlue),
              iconSize: 24,
              elevation: 16,

              // style: TextStyle(
              //     color: AppConst.textColor, fontSize: 20.0),

              onChanged: (newValue) {
                setState(() {
                  if (newValue == null) {
                  } else {
                    baladya = newValue;
                  }
                });
              },
              items: [
                for (int efg = 0; efg < District[selectedWilaya].length; efg++)
                  DropdownMenuItem<String>(
                      onTap: () => setState(() {
                            selectedBaladya = efg;
                          }),
                      value: District[selectedWilaya][efg],
                      child: Text(District[selectedWilaya][efg].toString())),
              ]),
        ),
        SizedBox(
          height: 100.0,
        ),
        GestureDetector(
          onTap: () async {
            Position? x;
            //x = await getCurrentLocation();
            /*setState(() {
              myPosition = x;
            });*/
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Phone_step(
                          email: email,
                          username: username,
                          paaword: paaword,
                          gender: gender,
                          fullName: fullName,
                          location: Location(
                              coordinates: [
                               0,
                               0
                              ],
                              district: District[selectedWilaya]
                                  [selectedBaladya],
                              state: States[selectedWilaya]),
                        )));
          },
          child: ButtonGlobo(
            text: ConstStrings.next,
          ),
        ),
      ])),
    );
  }
}
