// ignore_for_file: camel_case_types, recursive_getters, annotate_overrides, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, avoid_init_to_null

import 'dart:io';


import 'package:flutter/material.dart';

class imageProfile extends StatefulWidget {
  final ImageProvider imgProvider;
   const imageProfile({super.key, required this.imgProvider});

  @override
  State<imageProfile> createState() => _imageProfileState();
}

class _imageProfileState extends State<imageProfile> {
  BuildContext get context => context;
  File? imageFile = null;

  Future<void> _showOptions(BuildContext context) async {
    if (!mounted) return; // Check if the widget is still mounted

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Choose from: "),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Gallery"),
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Camera"),
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: widget.imgProvider
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          child: InkWell(
            onTap: () => _showOptions(context),
            child: Container(
              width: 24,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[500],
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ),

      ],
    );
  }
}
