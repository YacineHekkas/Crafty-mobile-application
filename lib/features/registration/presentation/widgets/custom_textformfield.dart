import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isThereError;

  final Widget? prefixIcon;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.isThereError,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late var obscure = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 0.9,
      child: TextFormField(
        maxLength: 30,
        obscureText: obscure,
        buildCounter: (BuildContext context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
            null,
        onChanged: (String value) {},
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: AppConst.orong,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.hint.contains('word')
              ? IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                )
              : widget.isThereError
                  ? const Icon(
                      Icons.error,
                      color: Colors.red,
                    )
                  : null,
          enabledBorder: widget.isThereError
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.red),
                )
              : null,
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
