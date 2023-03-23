import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cp_project/core/global/Category.dart';
import 'package:cp_project/core/global/Screens.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/presentation/bloc/get_data_bloc.dart';
import 'package:cp_project/features/home/presentation/widgets/category_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/row_ship.dart';
import 'service_details.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;


  CategoryScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<ServiceEntity>? allDataList;
  late List<ServiceEntity>? searchlist;

  final textSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textSearchController.dispose();
    super.dispose();
  }

  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
              context.read<DataBloc>().emit(DataIsHereState(servicedata: searchlist!));
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              floating: false,
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 70),
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
            backgroundColor: AppConst.bgColor,
            floating: true,
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 0),
              child: Container(
                height: 50,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  scrollDirection: Axis.horizontal,
                  itemCount: checkCategory().length,
                  itemBuilder: (context, index) => RawChipWidget(
                      label: checkCategory()[index] == ''
                          ? 'all'
                          : checkCategory()[index],
                      isSelected: isSelected == index,
                      onSelected: (value, label) {
                        setState(() {
                          context.read<DataBloc>().add(CallServerEvent(
                              subCategory: checkCategory()[index]!,
                              category: widget.categoryName
                          ));
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
            sliver: BlocBuilder<DataBloc, GetDataState>(
                builder: (context, state) {
              if (state is LoadingState) {
                return const SliverToBoxAdapter(
                  child: LoadingWidget()
                );
              } else if (state is DataIsHereState) {
                getdata();
                return _dataList(state.servicedata);
              } else {
                return SliverToBoxAdapter(
                  child: LoadingWidget(),
                );
              }
            }),
          )
        ],
      ),
    ));
  }

  SliverList _dataList(List<dynamic> dataValue) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: dataValue.length,
        (BuildContext context, int index) {
          return CategoryCard(
            serviceInfo: dataValue[index],
            onSelected: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ServiceDetails( serviceInfo: dataValue[index],)));
            },
          );
        },
      ),
    );
  }

  Map<int, String> checkCategory() {
    Map<int, String> myMap = {};
    if (widget.categoryName == 'mecanicien') {
      myMap = Mechanique().MechaniqueSubCategory;
    } else if (widget.categoryName == 'plombier') {
      myMap = Plombier().PlombierSubCategory;
    }
    return myMap;
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {

    setState(() {
      searchlist = allDataList!
          .where((character) =>
          character.user.name.toLowerCase().startsWith(searchedCharacter))
          .toList();
    });
    print(searchlist);
  }

  void getdata() async{
    dynamic tempo = await BlocProvider.of<DataBloc>(context).getServicesUseCase(widget.categoryName,'');
    tempo.fold(
            (l) => print('-----------------ggbloc--->$l'),
            (r) => allDataList = r
    );
  }
}