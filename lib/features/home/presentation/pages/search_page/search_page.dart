import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/presentation/pages/services_pages/service_details.dart';
import 'package:cp_project/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/get_data_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    textController.dispose();
    super.dispose();

  }
  TextEditingController textController = TextEditingController();
  bool isSelected = false;
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
            SliverAppBar(
          title: TextField(
            controller: textController ,
            onChanged: (String value){
              BlocProvider.of<DataBloc>(context).add(
                  CallServerEvent(subCategory: '', category: '', searchingValue: value, isSearching: true)
              );
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter text here',
              hintStyle: txtStyle,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          expandedHeight: 120.0,
          backgroundColor: AppConst.bgColor,
          elevation: 0.0,
          floating: true,
          pinned: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Column(
              children: [
                Container(
                  height: 45.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(isSelected){
                              isSelected = !isSelected;
                            }
                          });
                        },
                        child:Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Providers',
                                style:TextStyle(
                                    color: isSelected ? AppConst.textColor : AppConst.orong,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: AppConst.font
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width*0.45,
                                decoration: BoxDecoration(
                                    color: isSelected ? Colors.transparent : AppConst.orong,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              )
                            ],
                          ),
                        ) ,
                      ),
                      InkWell(
                        onTap: (){

                          setState(() {
                            if(!isSelected) {
                              isSelected = !isSelected;
                            }
                          });
                        },
                        child:Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Service',
                                style:TextStyle(
                                    color: !isSelected ? AppConst.textColor : AppConst.orong,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: AppConst.font
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width*0.45,
                                decoration: BoxDecoration(
                                    color: !isSelected ? Colors.transparent : AppConst.orong,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              )
                            ],
                          ),
                        ) ,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),

        ),
            SliverPadding(
              padding: const EdgeInsets.all(6),
              sliver:
              BlocBuilder<DataBloc, GetDataState>(builder: (context, state) {//TODO manage state error and chow some UI
                if (state is LoadingState) {
                  return  SliverToBoxAdapter(child: Text('Searching for ${textController.text} ...',style: txtStyle,),);
                }
                else if (state is DataIsHereState)
                {
                  return _dataList(state.servicedata);
                }
                else {
                  return const SliverToBoxAdapter(
                    child: Placeholder(),
                  );
                }
              }),
            )
      ]
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
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceDetails(
                        serviceInfo: dataValue[index],
                      )));
            },
            addToFavorite: (bool selected) {

          },
          );
        },
      ),
    );
  }
  final txtStyle = TextStyle(
  color: Colors.grey[500],
  fontSize: 16,
  fontWeight: FontWeight.bold,
  fontFamily: AppConst.font,
  letterSpacing: 1.2,
  );


}
