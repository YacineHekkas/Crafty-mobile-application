
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/presentation/pages/chat_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _index = 0 ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: getScreenBody(_index),
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius:  const BorderRadius.all(Radius.circular(25)),
              child: GNav(
                  duration: const Duration(milliseconds: 200), // tab animation duration
                  padding: const EdgeInsets.all(10),

                  tabBackgroundColor: AppConst.darkBlue ,
                  backgroundColor: AppConst.skyBlue,
                  iconSize: 25,
                  gap: 2,
                  color: AppConst.darkBlue,
                  activeColor: Colors.white,

                  onTabChange: (index){// here go some logic of the bloc
                    setState(() {
                      _index = index;
                    });
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.message_sharp,
                      text: 'Messaging',
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.account_circle_sharp,
                      text: 'Profile',
                    )
                  ]
              ),
            ),
          ),
        )
    );
  }

  Widget getScreenBody(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return const ChatScreen();
      default:
        return const SizedBox();
    }
  }
}
