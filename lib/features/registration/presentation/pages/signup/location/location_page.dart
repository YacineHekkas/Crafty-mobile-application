import 'package:cp_project/features/registration/presentation/pages/signup/phone_step.dart';
import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/global/global.dart';

import '../../../../domain/entities/UserS.dart';
import '../../../widgets/textype.dart';
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
  List<double> myPosition = const [];
  String? value;
  String? baladya;

  List<String> baladyat = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConst.bgColor,
        body: Column(
            children: [
          Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                ConstStrings.location,
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
                  text1: ConstStrings.giveL,
                ),
              ),
            ),
          ],
        ),
          ),
          const SizedBox(
        height: 50.0,
          ),
          Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 40.0),
          child: Container(
              width: 300,
              height: 90,
              decoration: const BoxDecoration(
                color: Color(0xffd9d9d9),
              )),
        ),
          ]),
          const SizedBox(
        height: 50.0,
          ),
          //////////////////////////////////////////////////////////////////////////////////////////////////////////=> states
           Container(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: DropdownButton<String>(
                hint: Text(ConstStrings.state),
                value: value,
                //selected
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
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
                  for (int i = 0; i < States.length; i++)
                    DropdownMenuItem<String>(
                        onTap: () => setState(() {
                              selectedWilaya = i;
                              baladyat = List.from(District.where((e) => e['id'] == i + 1).map((e) => e['name']));

                              /// pointeur ta3 wilaya
                              baladya = baladyat.first;
                              //// lazem tkoun haka sinon bcz bladiya we dont know tema directly ki dir wilaya ttla3 baladiya lewla as initial value  it won't work FOR REAL !
                            }),
                        value: States[i], // we pass the real value of the state according to the index selected
                        child: Text(States[i])),
                ]),
        ),
          const SizedBox(
        height: 30.0,
          ),
          ////////////////////////////////////////////////////////////////////////////////////////////////////////////=> districts
          Container(
        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: DropdownButton<String>(
            hint: Text(ConstStrings.District),
            value: baladya,
            //selected
            icon: const Icon(Icons.keyboard_arrow_down_sharp, color: AppConst.darkBlue),
            iconSize: 24,
            elevation: 16,
            onChanged: (newValue) {
              setState(() {
                if (newValue == null) {
                } else {
                  baladya = newValue;
                }
              });
            },
            items: [
              for (int efg = 0; efg < baladyat.length; efg++)
                DropdownMenuItem<String>(
                    onTap: () {
                      final dis = District.firstWhere((e) => e['name'] == baladyat[efg]);

                      print(dis);

                      setState(() {
                        selectedBaladya = efg;

                        myPosition = [dis['latitude'], dis['longitude']];
                      });
      },
                    value: baladyat[efg],
                    child: Text(baladyat[efg])),
            ]),
          ),
          const SizedBox(
        height: 100.0,
          ),
          GestureDetector(
        onTap: () async {
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
                            coordinates: myPosition,
                            district: baladyat
                                [selectedBaladya],
                            state: States[selectedWilaya]),
                      )));
        },
        child: ButtonGlobo(
          text: ConstStrings.next,
        ),
          ),
        ]),
      ),
    );
  }
}
