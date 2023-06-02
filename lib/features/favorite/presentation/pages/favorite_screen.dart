import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/presentation/pages/services_pages/service_details.dart';
import 'package:cp_project/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FavoriteScreen extends StatelessWidget {
   const FavoriteScreen({Key? key}) : super(key: key);

  static List<ServiceEntity> dataValue = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppConst.darkBlue,
              automaticallyImplyLeading: false,
            ),
            body: dataValue.isNotEmpty? CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                      padding: const EdgeInsets.all(6),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: dataValue.length,
                          (BuildContext context, int index) {
                            return CategoryCard(
                              serviceInfo: dataValue[index],
                              onSelected: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: ServiceDetails(
                                    serviceInfo: dataValue[index],
                                  ),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              addToFavorite: (bool selected) {
                                print('ggg from 1');
                                return !selected;
                              },
                            );
                          },
                        ),
                      ))
                ]
            ):const Center(child: Text("No Data")),
        )
    );
  }
}
