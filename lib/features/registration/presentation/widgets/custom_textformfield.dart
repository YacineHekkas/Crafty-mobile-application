import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;

  final Widget? prefix;
  final Widget? prefixIcon;

  final int maxLength;

  final bool Function(String value)? validator;
  final ValueNotifier<bool>? valid;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    this.obscureText = false,
    this.maxLength = 30,
    this.prefixIcon,
    this.prefix,
    this.validator,
    this.valid,
  }) : assert(validator != null && valid != null);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late var obscure = widget.obscureText;

  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 0.9,
      child: TextFormField(
        onChanged: (value) {
          if (widget.validator != null && widget.valid != null) {
            widget.valid!.value = widget.validator!(value);

            setState(() {
              error = !widget.valid!.value;
            });
          }
        },
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: AppConst.orong,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength),
        ],
        decoration: InputDecoration(
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon,
          suffixIcon: error || widget.obscureText ? Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (error)
                  Padding(
                    padding: EdgeInsets.only(right: !widget.obscureText ? 12 : 0),
                    child: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                if (widget.obscureText)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      child: Icon(
                        obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ) : null,
          enabledBorder: error
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
