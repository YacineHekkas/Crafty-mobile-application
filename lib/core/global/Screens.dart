import 'package:flutter/material.dart';
import 'global.dart';

class LoadingWidget extends StatelessWidget {

  const LoadingWidget({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
              child:SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: AppConst.orong ,
                ),
              ),

    );
  }
}

class EitherSuccessOrError extends StatelessWidget {
  final bool etate ;
  final dynamic message;
  const EitherSuccessOrError({Key? key, required this.etate, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppConst.bgColor,

          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              // TODO : adding some images of success state
                child:Text(
                  message.toString(),
                  textAlign: TextAlign.center,
                  style: textStyle ,
                )

            ),

          ),
        ),
    );
  }
}


TextStyle textStyle = const TextStyle(
    fontFamily: AppConst.font, fontSize: 25, fontWeight: FontWeight.w600);