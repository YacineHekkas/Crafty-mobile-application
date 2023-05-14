import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGallery extends StatefulWidget {
  final List<String> imgList;
  int initialPage;
  PhotoGallery({Key? key, required this.imgList, required this.initialPage})
      : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _currentIndex = widget.initialPage;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: PhotoViewGallery.builder(
        pageController: _pageController,
        itemCount: widget.imgList.length,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
                widget.imgList[index].contains('http') ?  widget.imgList[index]  :
                "https://crafty-server.azurewebsites.net/api/download/${widget.imgList[index]}",
                headers: {
                  'Authorization': 'bb ${locator<App>().getUserToken()}'
                }
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
