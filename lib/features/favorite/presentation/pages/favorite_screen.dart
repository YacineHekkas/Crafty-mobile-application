import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/presentation/pages/services_pages/service_details.dart';
import 'package:cp_project/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final ValueNotifier<List<ServiceEntity>> dataValue = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.darkBlue,
        automaticallyImplyLeading: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: dataValue,
        builder: (c ,l , w) => l.isNotEmpty
            ? CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                slivers: [
                    SliverPadding(
                        padding: const EdgeInsets.all(6),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: l.length,
                            (BuildContext context, int index) {
                              return CategoryCard(
                                serviceInfo: l[index],
                                onSelected: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: ServiceDetails(
                                      serviceInfo: l[index],
                                    ),
                                    withNavBar:
                                        false, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                              );
                            },
                          ),
                        ))
                  ])
            : const Center(child: Text("No Data")),
      ),
    ));
  }
}
