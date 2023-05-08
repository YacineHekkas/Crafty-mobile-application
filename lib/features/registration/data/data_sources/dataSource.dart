import 'dart:ffi';

import 'package:cp_project/features/registration/domain/entities/UserS.dart';

abstract class Datasource {
  Future<void> login(String pass, String ind);
  Future<bool> IsLogIn();
  Future<void> signUP(UserS users);
  Future<void> Sendverification();
  Future<bool> Isverified(String code1);
}
