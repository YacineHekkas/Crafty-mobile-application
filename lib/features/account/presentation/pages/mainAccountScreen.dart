import 'package:cp_project/core/global/Screens.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/features/account/presentation/bloc/user_bloc.dart';
import 'package:cp_project/features/account/presentation/pages/report_problem.dart';
import 'package:cp_project/features/account/presentation/pages/settings_screen.dart';
import 'package:cp_project/features/account/presentation/widgets/profile_image_picker.dart';
import 'package:cp_project/features/account/presentation/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/data_sources/remot_data_source/user_data_source_impl.dart';
import '../widgets/row_chip.dart';
import 'account_info.dart';

class MainAccountScreen extends StatelessWidget {
   UserEntity? userData;
   MainAccountScreen({Key? key,userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if(state is DataIsHereState){
          userData = state.userInfo;
          return SafeArea(
              child: Scaffold(
                backgroundColor: AppConst.bgColor,
                body: CustomScrollView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: AppConst.darkBlue,
                      elevation: 0.0,
                      stretch: true,
                      bottom: PreferredSize(
                        preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/9),
                        child:
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          alignment: Alignment.center,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              userData?.avatar != null ?
                              imageProfile(  imgProvider: NetworkImage(userData!.avatar!.url,),):
                              const imageProfile(  imgProvider: const AssetImage("assets/images/placeholder.webp") as ImageProvider,),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width/1.7,
                                  height: MediaQuery.of(context).size.height/8,
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width:MediaQuery.of(context).size.width/1.8 ,
                                        child:Text(
                                          '${userData?.name}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: AppConst.font,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ) ,
                                      ),
                                      SizedBox(
                                        width:MediaQuery.of(context).size.width/1.8 ,
                                        child:const Text(
                                          'View and edit your profile',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ) ,
                                      )
                                    ],
                                  )

                              )

                            ],
                          ) ,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:MediaQuery.of(context).size.height/40 ,),
                            title('Settings'),
                            SizedBox(height:MediaQuery.of(context).size.height/50 ,),
                            Container(
                              width:MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) =>  SettingsScreen())
                                      );
                                    },
                                    child: rowChip('assets/icons/setting_Icon.svg','Preferences',true),
                                  ),
                                  const SizedBox(height: 4),
                                  Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                    endIndent: 25,
                                    indent: 25,
                                  ),
                                  const SizedBox(height: 4),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => AccountInfo(userInfo: userData))
                                      );
                                    },
                                    child: rowChip('assets/icons/profile.svg','Account',true),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height/40 ,),
                            title('Resource'),
                            SizedBox(height:MediaQuery.of(context).size.height/50 ,),
                            Container(
                              width:MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) =>  ReportProblem(email: '', pageName: 'Report',))
                                      );
                                    },
                                    child: rowChip('assets/icons/','Support',true),
                                  ),
                                  const SizedBox(height: 4),
                                  Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                    endIndent: 25,
                                    indent: 25,
                                  ),
                                  const SizedBox(height: 4),
                                  InkWell(
                                    onTap: (){

                                    },
                                    child: rowChip('assets/icons/','Community and legal',true),
                                  ),
                                  const SizedBox(height: 4),
                                  Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                    endIndent: 25,
                                    indent: 25,
                                  ),
                                  const SizedBox(height: 4),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) =>  ReportProblem(email: '', pageName: 'Feedback',))
                                      );
                                    },
                                    child: rowChip('assets/icons/','Feedback',true),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height/50 ,),
                            userData!.provider? const SizedBox(height: 20,):
                            Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: AppConst.orong,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child:Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: rowChip('', 'Provide service',false),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );
        }else {
          return LoadingWidget();
        }
      },
    );
  }
}

