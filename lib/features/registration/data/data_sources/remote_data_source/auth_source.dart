import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';

abstract class AuthSource {
  Server get server;

  Future<String> accountLogin(String indentifier, String password);
  Future<String> accountRegister(Registration data);
  Future<void> sendVerificationCode();
  Future<bool> verifyCode(String code);
  Future<bool> getAccountVerificationStatus();

}
