import 'dart:io';

import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:cp_project/core/global/Screens.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/presentation/bloc/get_data_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({Key? key}) : super(key: key);

  @override
  State<CreateServiceScreen> createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  int categoryTag = 0;
  int subCategoryTag = 0;
  String category = '';
  String subCategory = '';
  String description = '';
  bool showMessg = false;
  List<XFile> images = [];


  // this is tempo shiiti
  List<String> categoryList = [
    'mechanic',
    'plumber',
    'electrician',
    'painter',
    'you know',
    'you also know',
    'it is what is it',
    'koko'
  ];
  List<String> subCategoryList = [
    'car painter',
    'general',
    'motors',
    'liquid',
    'body'
  ];

  final _focusNode = FocusNode();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.bgColor,
      body: SafeArea(
          top: false,
          child: BlocBuilder<DataBloc, GetDataState>(
              builder: (context, state) {
                if(state is LoadingState){
                  return const LoadingWidget();
                }
                else if (state is SuccessState ){
                  return EitherSuccessOrError( etate:true, message: state.message,);

                }else if (state is ErrorState ){
                  return EitherSuccessOrError( etate: false, message: state.message,);
                }else if (state is OperationDoneState){
                  categoryTag = 0;
                  subCategoryTag = 0;
                   category = '';
                   subCategory = '';
                   description = '';
                  images = [];
                  return theUI();
                }
                else {
                  return theUI();
                }
              }
          )
      ),
    );
  }

  Widget theUI(){
    return Stack(
      children: [
        CustomScrollView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {

                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                ),
              ),
              expandedHeight: 105.0,
              backgroundColor: AppConst.bgColor,
              elevation: 0.0,
              pinned: true,
              stretch: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupertinoColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Category', style: headerStyle),
                              InkWell(
                                onTap: () {
                                  selectCategory(true);
                                },
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          category == ''
                              ? const SizedBox(
                            height: 50,
                          )
                              : RawChip(
                            showCheckmark: false,
                            label: Text(
                              category,
                              style: shipTextStyle,
                            ),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                              color: AppConst.darkBlue,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 1,
                            shadowColor:
                            Colors.black.withOpacity(0.2),
                            backgroundColor: AppConst.darkBlue,
                            selectedColor: AppConst.skyBlue,
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20),
                              side: const BorderSide(
                                width: 0.2,
                              ),
                            ),
                          ),
                          showMessg
                              ? const Text(
                            'choose a category first',
                            style: TextStyle(color: Colors.red),
                          )
                              : const SizedBox(height: 10.0),
                          Center(
                            /// this is divider
                            child: Container(
                              color:
                              !showMessg ? Colors.black : Colors.red,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(height: 15.0),

                          //////////////////////////////////////////////////////////////////////////////-=-=-=
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subcategory', style: headerStyle),
                              InkWell(
                                onTap: () {
                                  if (category == '') {
                                    showMessg = !showMessg;
                                    setState(() {});
                                  } else {
                                    selectCategory(false);
                                  }
                                },
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          subCategory == ''
                              ? const SizedBox(
                            height: 50,
                          )
                              : RawChip(
                            showCheckmark: false,
                            label: Text(
                              subCategory,
                              style: shipTextStyle,
                            ),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                              color: AppConst.darkBlue,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 1,
                            shadowColor:
                            Colors.black.withOpacity(0.2),
                            backgroundColor: AppConst.darkBlue,
                            selectedColor: AppConst.skyBlue,
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20),
                              side: const BorderSide(
                                width: 0.2,
                              ),
                            ),
                          ),
                          lineDivider,
                          /////////////////////////////////////////////////////////////////////////-=--=-=-
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Photos', style: headerStyle),
                              InkWell(
                                onTap: () {
                                  selectImage();
                                },
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                            itemCount: images.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                    BorderRadius.circular(15),
                                  ),
                                  child: Image.file(
                                      File(images[index].path)),
                                ),
                              );
                            },
                          ),
                          lineDivider,
                          //////////////////////////////////////////////////////////////////////////-+_+_+_
                          Text(
                            'Description',
                            style: headerStyle,
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            onFieldSubmitted: (val){
                              description = val;
                            },
                            textInputAction: TextInputAction.done,
                            focusNode: _focusNode,
                            minLines: 3,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Write your description',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: Align(
            alignment: Alignment.bottomCenter,
            child:InkWell(
                onTap: (){
                  _createService(category, subCategory, description);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: !_isKeyboardVisible?50:0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: AppConst.orong),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontFamily: AppConst.font,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                )
            ) ,
          ),
        ),
      ],
    );
  }

  void _createService(String category, String subcategory, String description) {
    BlocProvider.of<DataBloc>(context).add(
        CreateServiceEvent(
          category: category,
          subCategory: subcategory,
          description: description,
          imagesList: images,
        )
    );
  }


  selectCategory(bool itsCategory) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: ChipsChoice.single(
              placeholderStyle: const TextStyle(color: Colors.black),
              value: itsCategory ? categoryTag : subCategoryTag,
              onChanged: (value) {
                setState(() {
                  if (itsCategory) {
                    categoryTag = value;
                    category = categoryList[categoryTag].toString();
                    if (category != '') {
                      showMessg = false;
                    }
                  } else {
                    subCategoryTag = value;
                    subCategory = subCategoryList[subCategoryTag].toString();
                  }
                  Navigator.pop(context);
                });
              },
              choiceItems: C2Choice.listFrom(
                source: itsCategory ? categoryList : subCategoryList,
                value: (i, v) => i,
                label: (i, v) => v,
              ),
              choiceActiveStyle: const C2ChoiceStyle(
                  color: AppConst.darkBlue,
                  borderColor: AppConst.darkBlue,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              choiceStyle: const C2ChoiceStyle(
                  color: AppConst.darkBlue,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              wrapped: true,
            ),
          );
        });
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Fluttertoast.showToast(
                                msg: 'you can chose 12 photo as a maximum',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                fontSize: 16.0
                            );
                            await selectImageFromGallery();
                            if (images.isNotEmpty) {
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('No Image Selected !'),
                              ));
                            }
                          },
                          child:Container(
                            height: 90,
                            width: 90,
                            color: Colors.red,
                            child: const Text(
                                'gallery'
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if(images.length < 12) {
                              var selectedImage = await selectImageFromCamera();
                              if (selectedImage.path != '') {
                                images.add(selectedImage);
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('No Image Captured !'),
                                    ));
                              }
                            }
                          },
                          child:Container(
                            height: 100,
                            width: 100,
                            color: Colors.yellowAccent,
                            child: const Text(
                                'photo'
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

  selectImageFromGallery() async {
    try {
      final List<XFile> pickedImages  = await ImagePicker().pickMultiImage();
      if (pickedImages.isNotEmpty) {
        images.addAll(pickedImages);
        images = images.take(12).toList();
        setState(() {});
      }
    } on Exception catch (e) {
    }
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

  Column lineDivider = Column(
    children: const [
      SizedBox(height: 10.0),
      Center(
        /// this is divider
        child: Divider(
          color: Colors.black,
          height: 1.0,
        ),
      ),
      SizedBox(height: 15.0),
    ],
  );
  TextStyle headerStyle = const TextStyle(
      fontFamily: AppConst.font, fontSize: 22, fontWeight: FontWeight.w500);
  TextStyle shipTextStyle = const TextStyle(
      color: Colors.white,
      fontFamily: AppConst.font,
      fontWeight: FontWeight.bold);
}
