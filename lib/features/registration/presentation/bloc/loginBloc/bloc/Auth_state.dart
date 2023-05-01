part of 'Auth_bloc.dart';

abstract class AuthState {
  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class LoadingState extends AuthState {}

class Successedlogin extends AuthState {
  final String message;
  Successedlogin({required this.message});
}

class Failedlogin extends AuthState {
  final String message;
  Failedlogin({required this.message});
}

class SuccessedSign extends AuthState {
  final String message;
  SuccessedSign({required this.message});
}

class FailedSign extends AuthState {
  final String message;
  FailedSign({required this.message});
}

class VerifiedUser extends AuthState {
  final String message;

  VerifiedUser(this.message);
}

class UnVerifiedUser extends AuthState {
  final String message;

  UnVerifiedUser(this.message);
}
