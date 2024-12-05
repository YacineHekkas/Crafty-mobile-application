import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/presentation/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class searchBar extends StatelessWidget {

  const searchBar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen:SearchScreen() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );

      },
      child:Container(
        width: MediaQuery.of(context).size.width/1.1,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2.0,
              spreadRadius: 0.7,
              offset: const Offset(0,5),
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-5,0),
            )

          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child:
            Row(
              children: [
                const SizedBox(width: 5,),
                Icon(
                  color: Colors.black87.withOpacity(0.5),
                  Icons.search,
                  size: 30.0,
                ),
                const SizedBox(width: 5,),
                Text(
                  'Search',
                  style: TextStyle(
                      fontFamily: AppConst.font,
                      fontSize: 18,
                      color: AppConst.textColor.withOpacity(0.7)
                  ),
                ),
              ],
        ),
      ),
    );
  }
}

