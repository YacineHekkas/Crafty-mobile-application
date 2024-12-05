import 'package:auto_route/annotations.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/chat/presentation/pages/chat_screen.dart';
import 'package:cp_project/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:cp_project/injection_container.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:flutter/material.dart';

import '../../../account/presentation/pages/mainAccountScreen.dart';
import 'home_page/home_screen.dart';

@RoutePage()
class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int index = 0;

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ChatScreen(),
      locator<FavoriteScreen>(),
      const MainAccountScreen(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        activeColorPrimary: AppConst.orong,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.message_rounded),
        activeColorPrimary: AppConst.orong,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        activeColorPrimary: AppConst.orong,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        activeColorPrimary: AppConst.orong,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        //avBarHeight: 80,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white70, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        //resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),

        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,

        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),

        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Scaffold(
//       body: Stack(
//         children: [
//           [
//             const HomeScreen(),
//             const ChatScreen(),
//             const MainAccountScreen(),
//           ]
//           [index],
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 alignment: Alignment.bottomCenter,
//                 height: MediaQuery.of(context).size.height / 12,
//                 decoration: BoxDecoration(
//                   color: AppConst.skyBlue,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height / 12,
//                   width: 320,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(25)),
//                     child: GNav(
//                       duration: const Duration(
//                         milliseconds: 200,
//                       ), // tab animation duration
//                       padding: const EdgeInsets.all(15),
//                       tabBackgroundColor: AppConst.darkBlue,
//                       backgroundColor: AppConst.skyBlue,
//                       iconSize: 26,
//                       gap: 2,
//                       color: AppConst.darkBlue,
//                       activeColor: Colors.white,
//                       onTabChange: (val) {
//                         // here go some logic of the bloc
//                         if (val == 2) {
//                           BlocProvider.of<UserBloc>(context)
//                               .add(GetUserInfoEvent());
//                         }
//                         setState(() {
//                           index = val;
//                         });
//                       },
//                       selectedIndex: index,
//                       tabs:  [
//                         GButton(
//                           icon: Icons.home_filled,
//                           text: 'Home',
//                         ),
//                         GButton(
//                           icon: Icons.message_rounded,
//                           text: 'Chat',
//                         ),
//                         GButton(
//                           icon: Icons.account_circle_sharp,
//                           text: 'Profile',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
