import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';
import 'package:cp_project/features/registration/presentation/pages/login/login_screen.dart';
import 'package:cp_project/features/registration/presentation/widgets/buttonGlobo.dart';
import 'package:cp_project/features/registration/presentation/widgets/custom_textformfield.dart';
import 'package:cp_project/features/registration/presentation/widgets/functions.dart';
import 'package:cp_project/features/registration/presentation/widgets/page_title.dart';
import 'package:cp_project/features/registration/presentation/widgets/textype.dart';
import 'package:cp_project/injection_container.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:cp_project/features/registration/presentation/pages/signup/signup_next_page.dart';

class SignupScreen extends StatefulWidget {
  final bool hasBackArrow;

  const SignupScreen({super.key, this.hasBackArrow = true});

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final bloc = locator<AuthBloc>();
  late final _width = MediaQuery.of(context).size.width;
  late final _height = MediaQuery.of(context).size.height;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();

  final firstNameValid = ValueNotifier<bool>(false);
  final lastNameValid = ValueNotifier<bool>(false);
  final userValid = ValueNotifier<bool>(false);
  var stateValid = false;
  var districtValid = false;

  late var gender = bloc.state.data.gender?.replaceRange(
          0, 1, bloc.state.data.gender!.characters.first.toUpperCase()) ??
      "Male";
  late var state = bloc.state.data.location?.state ?? "State";
  late var district = bloc.state.data.location?.district ?? "District";

  final List<String> items = [
    'Male',
    'Female',
  ];
  List<String> districts = [];

  @override
  void initState() {
    super.initState();

    if (bloc.state.data.firstName != null) {
      firstNameController.text = bloc.state.data.firstName!;
    }
    if (bloc.state.data.lastName != null) {
      lastNameController.text = bloc.state.data.lastName!;
    }
    if (bloc.state.data.username != null) {
      userNameController.text = bloc.state.data.username!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        validator: isNameValid,
                        valid: firstNameValid,
                      ),
                    ),
                    SizedBox(
                      width: _width / 2.4,
                      child: CustomTextField(
                        hint: 'Last name',
                        textEditingController: lastNameController,
                        keyboardType: TextInputType.name,
                        validator: isNameValid,
                        valid: lastNameValid,
                      ),
                    ),
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
                    validator: isNameValid,
                    valid: userValid,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Gender : ",
                      style: TextStyle(
                        color: AppConst.darkBlue,
                        fontSize: 24,
                        fontFamily: AppConst.font,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.9,
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          gender,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: AppConst.font,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
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
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
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
                          districts = List.from(
                            District.where((e) =>
                                e['id'] == States.indexOf(value!) + 1).map(
                              (e) => e['name'],
                            ),
                          );

                          setState(() {
                            state = value!;
                            stateValid = state != "State";
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: _width / 2.4,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            border: !stateValid
                                ? Border.all(
                                    color: Colors.red,
                                    width: 1.0,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          elevation: 1,
                        ),
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: !stateValid ? Colors.red : Colors.black87,
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
                            districtValid = district != "District";
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: _width / 2.4,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            border: !districtValid
                                ? Border.all(
                                    color: Colors.red,
                                    width: 1.0,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          elevation: 1,
                        ),
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: !districtValid ? Colors.red : Colors.black87,
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
                    if (firstNameValid.value &&
                        lastNameValid.value &&
                        userValid.value &&
                        districtValid &&
                        stateValid) {
                      final districtJson = District.firstWhere(
                        (e) => e['name'] == district,
                      );

                      bloc.add(
                        UpdateRegistrationDataEvent(
                          step: 1,
                          firstName: firstNameController.value.text,
                          lastName: lastNameController.value.text,
                          username: userNameController.value.text,
                          gender: gender,
                          location: Location(
                            state: state,
                            district: district,
                            coordinates: [
                              districtJson['latitude'],
                              districtJson['longitude']
                            ],
                          ),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupNextPage(),
                        ),
                      );
                    }
                  },
                  child: const ButtonGlobo(
                    text: "Next",
                  ),
                ),
                SizedBox(
                  height: _height / 17,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  textype(
                      text1: 'Already have an account? ',
                      Color: AppConst.darkBlue),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: textype(
                      text1: 'Login',
                      Color: AppConst.orong,
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
