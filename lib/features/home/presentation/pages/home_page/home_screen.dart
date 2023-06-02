
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/presentation/bloc/get_data_bloc.dart';
import 'package:cp_project/features/home/presentation/pages/services_pages/category_screen.dart';
import 'package:cp_project/features/home/presentation/widgets/app_bar.dart';
import 'package:cp_project/features/home/presentation/widgets/card_widget.dart';
import 'package:cp_project/features/home/presentation/widgets/feed_card.dart';
import 'package:cp_project/features/home/presentation/widgets/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../widgets/dote.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppConst.bgColor,
            body: CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    delegate: MySliverAppBar(expandedHeight: 70),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
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
                          space,
                          Container(
                            height: MediaQuery.of(context).size.height/4,
                            child:
                            ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: AppConst.categories.length,
                              itemBuilder: (context, index) =>GestureDetector(
                                  onTap: () {

                                   // callData(AppConst.categories[index].name,context);

                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: CategoryScreen(categoryName: AppConst.categories[index].name,),
                                      withNavBar: false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );

                                  },
                                  child: CardWidget(categoryName: AppConst.categories[index].name, imgPath:AppConst.categories[index].imgPath ,),
                                ),
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(10),
                            ),
                          ),
                          space,
                          // Align(
                          //   alignment: const Alignment(0,0.35),
                          //   child: addSpace(),
                          // ), /// -----> addSpace
                          space,
                          const Align(
                            alignment: Alignment(-1,0.9),
                            child: feedCard(),
                          ),
                          const SizedBox(height: 90,),
                        ],
                      ),
                    ),
                  )
                ]
            )
        )
    );
  }

  void callData(String category, cntx) {
    BlocProvider.of<DataBloc>(cntx).add(
        CallServerEvent(subCategory: '', category: category, searchingValue: '', isSearching: false)
    );
  }
}

SizedBox space = const SizedBox(height: 20);


class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        customAppBar(),
        Positioned(
            top: expandedHeight / 2 - shrinkOffset /10,
            left: 20,
            child:  const Padding(
              padding: EdgeInsets.only(left: 0, right: 230),
              child: searchBar() ,
            )),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
