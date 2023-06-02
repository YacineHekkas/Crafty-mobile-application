import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cp_project/core/global/Screens.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/presentation/bloc/get_data_bloc.dart';
import 'package:cp_project/features/home/presentation/widgets/category_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../widgets/row_ship.dart';
import 'service_details.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}



class _CategoryScreenState extends State<CategoryScreen> {
  late List<ServiceEntity>? allDataList;
  late List<ServiceEntity>? searchList;
  int isSelected = 0;
  final textSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('gg from inti');
    BlocProvider.of<DataBloc>(context).add(
        CallServerEvent(subCategory: '', category: widget.categoryName, searchingValue: '', isSearching: false)
    );
  }

  // @override
  // void dispose() {
  //   textSearchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.bgColor,
      appBar: AppBar(
        backgroundColor: AppConst.darkBlue,
        toolbarHeight: 65,
        actions: [
          AnimSearchBar(
            color: Colors.transparent, //AppConst.darkBlue ,
            searchIconColor: Colors.white,
            width: 250,
            textController: textSearchController,
            onSuffixTap: () {
              textSearchController.clear();
            },
            onSubmitted: (value) {
              addSearchedFOrItemsToSearchedList(value);
              context
                  .read<DataBloc>()
                  .emit(DataIsHereState(servicedata: searchList!));
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              floating: false,
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height/9
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          widget.categoryName,
                          style: const TextStyle(
                              fontFamily: AppConst.font,
                              color: AppConst.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ConstStrings.descCategory,
                        style: const TextStyle(
                            fontFamily: AppConst.font,
                            color: AppConst.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Sort by :',
                            style: TextStyle(
                                fontFamily: AppConst.font,
                                color: AppConst.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    ],
                  ),
                ),
              )),
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppConst.bgColor,
            floating: true,
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 0),
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConst.categories
                      .firstWhere(
                          (element) => element.name == widget.categoryName)
                      .subcategories
                      .length,
                  itemBuilder: (context, index) => RawChipWidget(
                      label: AppConst.categories
                          .firstWhere(
                              (element) => element.name == widget.categoryName)
                          .subcategories[index],
                      isSelected: isSelected == index,
                      onSelected: (value, label) {
                        setState(() {
                          context.read<DataBloc>().add(CallServerEvent(
                              subCategory: index == 0
                                  ? ''
                                  : AppConst.categories
                                      .firstWhere((element) =>
                                          element.name == widget.categoryName)
                                      .subcategories[index],
                              category: widget.categoryName,
                              searchingValue: '',
                              isSearching: false));
                          isSelected = index;
                        });
                      }),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(6),
            sliver:
                BlocBuilder<DataBloc, GetDataState>(builder: (context, state) {//TODO manage state error and chow some UI
              if (state is LoadingState) {
                return const SliverToBoxAdapter(child: LoadingWidget());
              } else if (state is DataIsHereState) {
                getdata();
                return _dataList(state.servicedata);
              } else {
                return const SliverToBoxAdapter(
                  child: LoadingWidget(),
                );
              }
            }
            ),
          )
        ],
      ),
    );
  }

  SliverList _dataList(List<dynamic> dataValue) {
    return SliverList(
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
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            addToFavorite: (bool selected) {

              setState(() {
                if (!selected ){
                  FavoriteScreen.dataValue.add(dataValue[index]);
                }else{
                  FavoriteScreen.dataValue.remove(dataValue[index]);
                }
                print(
                    FavoriteScreen.dataValue
                );
              });
              return !selected;
            },
          );
        },
      ),
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    setState(() {
      searchList = allDataList!
          .where((character) =>
              character.user.name.toLowerCase().startsWith(searchedCharacter))
          .toList();
    });
  }

  void getdata() async {
    dynamic tempo = await BlocProvider.of<DataBloc>(context)
        .getServicesUseCase(widget.categoryName, '','',false);
    tempo.fold(
        (l) => print('-----------------ggbloc--->$l'),
            (r) => allDataList = r);
  }
}
