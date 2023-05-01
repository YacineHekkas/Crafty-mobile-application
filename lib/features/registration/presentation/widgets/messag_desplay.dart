import 'package:cp_project/core/global/global.dart';
import 'package:flutter/cupertino.dart';

class LoginMessagesDisplayWidget extends StatelessWidget {
  final String messg;
  const LoginMessagesDisplayWidget({Key? key, required this.messg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          messg,
          style: const TextStyle(
            color: AppConst.orong,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
