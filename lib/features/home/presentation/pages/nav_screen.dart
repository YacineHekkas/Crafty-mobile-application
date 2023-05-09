import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/account/presentation/bloc/user_bloc.dart';
import 'package:cp_project/features/chat/presentation/pages/chat_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../account/presentation/pages/mainAccountScreen.dart';
import 'add_service_pages/add_service_page.dart';
import 'home_page/home_screen.dart';

class NavScreen extends StatefulWidget {

   NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    CreateServiceScreen(),
    const ChatScreen(),
    MainAccountScreen(),
  ];
  int index = 0;
  // UserEntity? userInfo =();;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:Stack(
            children: [
              _pages[index],
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 5,right: 5),
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child:Container(
                      alignment: Alignment.bottomCenter,
                      height:MediaQuery.of(context).size.height/12,
                      decoration: BoxDecoration(
                          color: AppConst.skyBlue,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: SizedBox(
                        height:MediaQuery.of(context).size.height/12,
                        width: 320,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          child:GNav(
                              duration: const Duration(milliseconds: 200), // tab animation duration
                              padding: const EdgeInsets.all(15),
                              tabBackgroundColor: AppConst.darkBlue,
                              backgroundColor: AppConst.skyBlue,
                              iconSize: 25,
                              gap: 2,

                              color: AppConst.darkBlue,
                              activeColor: Colors.white,
                              onTabChange: (val) {
                                // here go some logic of the bloc
                                if ( val == 1){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const CreateServiceScreen())
                                  );
                                }else if (val ==3){
                                  BlocProvider.of<UserBloc>(context).add(
                                    GetUserInfoEvent( )
                                  );

                                  setState(() {
                                    index = val;
                                  });
                                }
                                else{
                                  setState(() {
                                    index = val;
                                  });
                                }

                              },
                              selectedIndex: index,
                              tabs: const [
                                GButton(
                                  icon: Icons.home,
                                  text: 'Home',
                                ),
                                GButton(
                                  icon: Icons.add_circle_outline_outlined,
                                  text: 'create service',
                                ),
                                GButton(
                                  icon: Icons.message,
                                  text: 'messages',
                                ),
                                GButton(
                                  icon: Icons.account_circle_sharp,
                                  text: 'Profile',
                                ),

                              ]) ,
                        ),
                      )
                  ) ,
                )
                )
            ],
          )


    ));
  }


}
