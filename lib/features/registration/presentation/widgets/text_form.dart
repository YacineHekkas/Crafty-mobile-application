import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  TextForm({
    Key? key,
    required this.controller,
    required this.texthint,
    required this.textInputType,
    required this.obscure,
  }) : super(key: key);
  final TextEditingController controller;
  final String texthint;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              blurRadius: 7,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: TextFormField(
          keyboardType: textInputType,
          obscureText: obscure,
          controller: controller,
          decoration: InputDecoration(
              hintText: texthint,
              border: InputBorder.none,
              hintStyle: const TextStyle(
                height: 1,
              )),
        ),
      ),
    );
  }
}
