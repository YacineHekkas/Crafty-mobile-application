import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Phone_step extends StatefulWidget {
  const Phone_step(
      {super.key,
      required String fullName,
      required String username,
      required String paaword,
      required Location location,
      required String email});

  @override
  State<Phone_step> createState() => _Phone_stepState();
}

class _Phone_stepState extends State<Phone_step> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
