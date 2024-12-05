part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthEventAddable extends AuthEvent {
  final AuthStatus? status;
  final AuthResult? result;

  const AuthEventAddable({ this.status, this.result });

  @override
  List<Object?> get props => [status, result]; 
}

class UpdateRegistrationDataEvent extends AuthEvent {
  final String? firstName;
  final String? lastName;
  final String? username;

  final String? email;
  final String? gender;
  final Location? location;
  final String? phone;
  final String? password;
  final bool? provider;

  final int? step;

  const UpdateRegistrationDataEvent({
 this.step,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.gender,
    this.location,
    this.phone,
    this.password,
    this.provider,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        gender,
        location,
        email,
        password,
        phone,
        provider,
        username,
        step,
      ];
}

class AccountLoginEvent extends AuthEvent {
  final String indentifier;
  final String password;

  const AccountLoginEvent({required this.indentifier, required this.password});

  @override
  List<Object> get props => [indentifier, password];
}

class AccountRegisterEvent extends AuthEvent {
  const AccountRegisterEvent();
}

class AccountVerificationEvent extends AuthEvent {
  final String code;

  const AccountVerificationEvent({ required this.code });
}