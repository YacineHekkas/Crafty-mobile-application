part of 'Auth_bloc.dart';

abstract class AuthEvent {
  get usera => null;

//
}

class LoginEvent extends AuthEvent {
  final User usera;
  LoginEvent({
    required this.usera,
  });
}

class SignupEvent extends AuthEvent {
  final UserS users;

  SignupEvent({required this.users});
}

class SendverficationEvent extends AuthEvent {}

class IsverifiedEvent extends AuthEvent {
  final String code1;

  IsverifiedEvent(this.code1);
}
