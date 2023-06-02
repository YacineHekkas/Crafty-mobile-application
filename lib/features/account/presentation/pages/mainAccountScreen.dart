import 'package:cp_project/core/global/Screens.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/features/account/presentation/bloc/user_bloc.dart';
import 'package:cp_project/features/account/presentation/pages/report_problem.dart';
import 'package:cp_project/features/account/presentation/pages/settings_screen.dart';
import 'package:cp_project/features/account/presentation/widgets/title.dart';
import 'package:cp_project/features/home/presentation/pages/add_service_pages/add_service_page.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../widgets/row_chip.dart';
import 'account_info.dart';

class MainAccountScreen extends StatefulWidget {
  const MainAccountScreen({Key? key}) : super(key: key);

  @override
  State<MainAccountScreen> createState() => _MainAccountScreenState();
}

class _MainAccountScreenState extends State<MainAccountScreen> {
  UserEntity? userData;
  XFile imageFile = XFile('assets/images/placeholder.webp');

  @override
  void initState() {
    super.initState();

    BlocProvider.of<UserBloc>(context).add(GetUserInfoEvent()); //
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From :',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await selectImageFromGallery();
                            if (imageFile.path.isNotEmpty) {
                              BlocProvider.of<UserBloc>(context).add(
                                  ChangeAvatarPhoto(
                                      id: userData!.id,
                                      imgPath: imageFile.path));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('No Image Selected !'),
                              ));
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            child: SvgPicture.asset(
                              'assets/images/gallery.svg',
                              width: 90,
                              height: 90,
                              colorFilter: ColorFilter.mode(
                                  AppConst.darkBlue, BlendMode.srcIn),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var selectedImage = await selectImageFromCamera();
                            if (selectedImage.path != '') {
                              BlocProvider.of<UserBloc>(context).add(
                                  ChangeAvatarPhoto(
                                      id: userData!.id,
                                      imgPath: imageFile.path));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('No Image Captured !'),
                              ));
                            }
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            child: SvgPicture.asset(
                              'assets/images/camera.svg',
                              width: 80,
                              height: 80,
                              colorFilter: ColorFilter.mode(
                                  AppConst.darkBlue, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future chooseToBeProvider() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Upgrade to provider :',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () async {
                              BlocProvider.of<UserBloc>(context)
                                  .add(BecomeProviderEvent());
                              Navigator.pop(context);
                            },
                            child: textChoice('Yes')),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: textChoice('Later'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    try {
      final List<XFile> pickedImages = await ImagePicker().pickMultiImage();
      if (pickedImages.isNotEmpty) {
        imageFile = pickedImages[0];
        setState(() {});
      }
    } on Exception catch (_) {}
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (file != null) {
      return file;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.bgColor,
        body: SafeArea(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is DataIsHereState) {
                userData = state.userInfo;
                return TheUi();
              }
              if (state is LoadingState) {
                return const LoadingWidget();
              } else if (state is SuccessState) {
                return EitherSuccessOrError(
                  etate: true,
                  message: state.message,
                );
              } else if (state is ErrorState) {
                return EitherSuccessOrError(
                  etate: false,
                  message: state.message,
                );
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ));
  }

  TheUi() {
    return CustomScrollView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppConst.darkBlue,
          elevation: 0.0,
          stretch: true,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / 9),
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(children: [
                    userData!.avatar == null
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage(imageFile.path) as ImageProvider,
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                "https://crafty-server.azurewebsites.net/api/download/${userData!.avatar!}",
                                headers: {
                                  'Authorization':
                                      'bb ${locator<App>().getUserToken()}'
                                }),
                          ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: InkWell(
                          onTap: () => selectImage(),
                          child: Container(
                            width: 24,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[500],
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )),
                  ]),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              '${userData?.name}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: AppConst.font,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: const Text(
                              'View and edit your profile',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                title('Settings'),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsScreen()));
                        },
                        child: rowChip('assets/icons/setting_Icon.svg',
                            'Preferences', true),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AccountInfo(userInfo: userData)));
                        },
                        child: rowChip(
                            'assets/icons/profile.svg', 'Account', true),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                title('Resource'),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportProblem(
                                        email: '',
                                        pageName: 'Report',
                                      )));
                        },
                        child: rowChip('assets/icons/', 'Support', true),
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
                        onTap: () {},
                        child: rowChip(
                            'assets/icons/', 'Community and legal', true),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportProblem(
                                        email: '',
                                        pageName: 'Feedback',
                                      )));
                        },
                        child: rowChip('assets/icons/', 'Feedback', true),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                userData!.provider
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                            color: AppConst.orong,
                            borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: CreateServiceScreen(),
                              withNavBar: false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );

                          },
                          child: rowChip('assets/icons/add_square.svg',
                              'Add service', false),
                        ),
                        //const SizedBox(height: 8),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                            color: AppConst.orong,
                            borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          onTap: () {
                            chooseToBeProvider();
                          },
                          child: rowChip('', 'Provide service', false),
                        ),
                        //const SizedBox(height: 8),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //textChoice
  Text textChoice(String val) {
    return Text(
      val,
      style: const TextStyle(
        color: AppConst.textColor,
        fontWeight: FontWeight.bold,
        fontFamily: AppConst.font,
        fontSize: 20,
      ),
    );
  }
}
