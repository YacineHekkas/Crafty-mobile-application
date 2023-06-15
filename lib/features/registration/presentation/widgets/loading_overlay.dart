import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading)
          const ModalBarrier(
            color: Colors.black54,
            dismissible: false,
          ),
        if (isLoading)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(14.0),
                child: CircularProgressIndicator(color: AppConst.orong),
              ),
              DefaultTextStyle(
                style: TextStyle(
                  fontFamily: AppConst.font,
                  color: Colors.black,
                  fontSize: 24.0,
                ),
                child: Text(
                  'Please wait..',
                ),
              ),
            ],
          )
      ],
    );
  }
}
