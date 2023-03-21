import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/presentation/pages/category_screen.dart';
import 'package:cp_project/features/home/presentation/widgets/add_space.dart';
import 'package:cp_project/features/home/presentation/widgets/app_bar.dart';
import 'package:cp_project/features/home/presentation/widgets/card_widget.dart';
import 'package:cp_project/features/home/presentation/widgets/feed_card.dart';
import 'package:cp_project/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/dote.dart';

class HomeScreen extends StatelessWidget {
  final textEditingController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppConst.bgColor,
          body:Stack(
            children: [
              Container(
                height: 70,
                alignment: Alignment.topCenter,
                child: CustomAppBar(),
              ),
              const Align(
                alignment: Alignment(0,-0.9),
                child: searchBar(),
              ),//search bar
              Positioned(
                top: 110,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              DoteContainer(), //dote
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Popular Services',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    fontFamily: 'Kumbh_Sans'
                                ),
                              ),// text
                            ],
                          ),
                          SizedBox(
                            height: 210,
                            child:
                            ListView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              children: [
                                GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(categoryName: 'Mechanique',)));
                                },
                                  child: CardWidget(categoryName: 'Mechanique', imgPath: 'assets/images/img1.png',),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(categoryName: 'Mechanique',)));
                                    },
                                  child:CardWidget(categoryName: 'Plombier', imgPath: 'assets/images/img1.png',),
                                ),

                                CardWidget(categoryName: 'Electrician', imgPath: 'assets/images/img1.png',),
                                CardWidget(categoryName: 'carpenter', imgPath: 'assets/images/img1.png',),

                              ],
                            ),
                          ),
                          space(),
                          Align(
                            alignment: const Alignment(0,0.35),
                            child: addSpace(),
                          ), /// -----> addSpace
                          space(),
                          const Align(
                            alignment: Alignment(-1,0.9),
                            child: feedCard(),
                          )

                        ],
                      ),
                    ),
                  )
              ), //Page component
            ],
          ),

          )

    );
  }
}
SizedBox space(){
  return const SizedBox(
    height: 20,
  );
}