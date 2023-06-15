import 'package:cp_project/core/global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkBlueButton extends StatelessWidget {
  const DarkBlueButton({super.key, required this.text, this.onPressed});
  final String text;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: AppConst.darkBlue,
          elevation: .7,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .3,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
