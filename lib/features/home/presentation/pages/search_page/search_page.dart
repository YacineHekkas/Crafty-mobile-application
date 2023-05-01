import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter text here',
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
          backgroundColor: Colors.red,
          elevation: 0.0,
          pinned: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Container(
              height: 52.0,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.blue,
                    child: Text('gg'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.yellowAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('ererrer'),
                        Divider(
                          indent: 5,
                          thickness: 5,
                          color: Colors.black,
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ),
      ]),
    ));
  }
}
