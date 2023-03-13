
import 'package:cp_project/core/global/global.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _index = 0 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:navScreen(_index),
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
                      icon: Icons.heart_broken_sharp,
                      text: 'Likes',
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

  navScreen(int index) {
    if(_index == 0){
      return HomeScreen();
    }else{
      return Placeholder ();
    }
  }
  SizedBox space(){
    return const SizedBox(
      height: 20,
    );
  }
}
