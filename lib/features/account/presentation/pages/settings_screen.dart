import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/account/presentation/pages/reset_password_screen.dart';
import 'package:cp_project/features/account/presentation/widgets/title.dart';
import 'package:flutter/material.dart';

import 'report_problem.dart';

class SettingsScreen extends StatefulWidget {
  late String? email;
  SettingsScreen({super.key, this.email = ''});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value2 = true;
  bool value1 = true;
  String _selectedTheme = 'system';
  late String valueChoose = ListItem.first;
  List ListItem = ["English", "Frensh", "عربي"];
  @override
  Widget build(BuildContext context) {
    final email = widget.email ?? 'No email provided';
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppConst.bgColor,
      appBar: AppBar(
        backgroundColor: AppConst.bgColor,
        shadowColor: Colors.transparent,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child:title('Notifications')
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffffffff),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                "Push notifications",
                                style: titleStyle,
                              ),
                              buildSwitch(),
                            ],
                          ),
                        ),
                        Divider(
                            color: Colors.grey[400],
                          endIndent: 25,
                          indent: 25,
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                "Message Sound",
                                style: titleStyle,
                              ),
                              buildSwitch2(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child:title('View')

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffffffff),
                    ),
                    child:
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  children: <Widget>[
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Dark mode'),
                                          if (_selectedTheme == 'dark')
                                            const Icon(
                                              Icons.check_circle_outline,
                                              color: Color(0xffff842b),
                                            ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedTheme = 'dark';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Light mode'),
                                          if (_selectedTheme == 'light')
                                            const Icon(
                                              Icons.check_circle_outline,
                                              color: Color(0xffff842b),
                                            ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedTheme = 'light';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('System mode'),
                                          if (_selectedTheme == 'system')
                                            const Icon(
                                              Icons.check_circle_outline,
                                              color: Color(0xffff842b),
                                            ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedTheme = 'system';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  "Appearance",
                                  style: titleStyle,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff000000),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),

                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: title('Language'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffffffff),
                    ),
                    child:
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                "Choose a Language",
                                style: titleStyle,
                              ),
                              DropdownButton(
                                dropdownColor: Colors.grey[300],
                                icon: const Icon(Icons.arrow_drop_down),
                                value: valueChoose,
                                onChanged: (newvalue) {
                                  setState(() {
                                    if (newvalue != null) {
                                      valueChoose = newvalue as String;
                                    }
                                  });
                                },
                                items: ListItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: title('Authors')
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffffffff),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPassword()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  "Change password",
                                  style: titleStyle,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff000000),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[400],
                          endIndent: 25,
                          indent: 25,
                        ),
                        InkWell(
                          onTap: () {
                            //TODO: navigate to edit info page
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  "Edite your information",
                                  style: titleStyle,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff000000),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffffffff),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13,
                      child:
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.logout_outlined,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Log Out",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff000000),
                                  size: 16,
                                ),
                              ],

                            )
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),

    ));
  }

  final titleStyle =  TextStyle(
  fontWeight: FontWeight.w300,
  fontFamily: AppConst.font,
  fontSize: 20,
  color:Colors.black87.withOpacity(0.7)
  );
  Widget buildSwitch() => Transform.scale(
        scale: 1,
        child: Switch.adaptive(
          activeColor: const Color(0xffff842b),
          value: value1,
          onChanged: (value) => setState(() => value1 = value),
        ),
      );
  Widget buildSwitch2() => Transform.scale(
        scale: 1,
        child: Switch.adaptive(
          activeColor: const Color(0xffff842b),
          value: value2,
          onChanged: (value) => setState(() => value2 = value),
        ),
      );
}
