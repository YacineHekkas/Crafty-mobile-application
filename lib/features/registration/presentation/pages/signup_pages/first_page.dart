import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/registration/presentation/pages/login/login_page.dart';
import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:cp_project/features/registration/presentation/widgets/custom_textformfield.dart';
import 'package:cp_project/features/registration/presentation/widgets/functions.dart';
import 'package:cp_project/features/registration/presentation/widgets/page_title.dart';
import 'package:cp_project/features/registration/presentation/widgets/textype.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool firstNameError = false;
  bool lastNameError = false;
  bool userError = false;
  bool stateError = false;
  bool districtError = false;

  String selectedValue = "Male";

  String state = "State";

  //String num = 0;
  List<String> districts = [];

  String district = "District";

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    final List<String> items = [
      'Male',
      'Female',
    ];
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
                physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                    Row(
                      children: [pageTitle("Getting started")],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [pageSubTitle("Create your free account")],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: _width / 2.4,
                            child: CustomTextField(
                              hint: 'First name',
                              textEditingController: firstNameController,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              isThereError: firstNameError,

                            )
                        ),
                        SizedBox(
                            width: _width / 2.4,
                            child: CustomTextField(
                              hint: 'Last name',
                              textEditingController: lastNameController,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              isThereError: lastNameError,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: _width / 1.15,
                      child: CustomTextField(
                        hint: 'User name',
                        textEditingController: userNameController,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        isThereError: userError,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Gender : ",
                            style: TextStyle(
                                color: AppConst.darkBlue,
                                fontSize: 24,
                                fontFamily: AppConst.font,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.9)),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              selectedValue,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConst.font,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: _width / 2,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              elevation: 1,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                              iconSize: 24,
                              iconEnabledColor: Colors.black87,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              elevation: 8,
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              state,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConst.font,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: States.map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )).toList(),
                            onChanged: (value) {
                              //districts = List.from(District.where((e) => e['id'] == i + 1).map((e) => e['name']));
                              districts = List.from(District.where((e) =>
                                      e['id'] == States.indexOf(value!) + 1)
                                  .map((e) => e['name']));

                              setState(() {
                                state = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(

                              height: 50,
                              width: _width / 2.4,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                border: stateError? Border.all(
                                  color: Colors.red,
                                  width: 1.0,
                                ):null,
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              elevation: 1,
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: stateError?Colors.red:Colors.black87,
                              ),
                              iconSize: 24,
                              iconEnabledColor: Colors.black87,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              elevation: 8,
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              district,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConst.font,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: districts
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                district = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: _width / 2.4,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                border: districtError? Border.all(
                                  color: Colors.red,
                                  width: 1.0,
                                ):null,
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              elevation: 1,
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                  color: districtError?Colors.red:Colors.black87,
                              ),
                              iconSize: 24,
                              iconEnabledColor: Colors.black87,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              elevation: 8,
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height / 17,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          firstNameError = !isNameValid(firstNameController.value.text);
                          lastNameError = !isNameValid(lastNameController.value.text);
                          userError = !isNameValid(userNameController.value.text);
                          districtError = district == "District";
                          stateError = state == "State";
                        });
                        if(!firstNameError&&!lastNameError&&!userError&&!districtError&&!stateError){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondPage()));
                        }
                      },
                      child: const ButtonGlobo(
                        text: "next",
                      ),
                    ),
                    SizedBox(
                      height: _height / 17,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      textype(
                          text1: 'Already have an account! ', Color: AppConst.darkBlue),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Loginscreen())
                            );
                          },
                          child: textype(
                              text1: 'login', Color: AppConst.orong))
                    ])
                  ],
                ),
              )),
            )
    );
  }
}
