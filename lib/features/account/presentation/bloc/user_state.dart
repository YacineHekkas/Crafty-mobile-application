part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class GetDataInitial extends UserState {}

class LoadingState extends UserState {}

class OperationDoneState extends UserState {}

class DataIsHereState extends UserState {
  final UserEntity userInfo;

  DataIsHereState({required this.userInfo});
}

class ErrorState extends UserState {
  final dynamic message;
  ErrorState({required this.message});
}

class SuccessState extends UserState {
  final dynamic message;

  SuccessState({required this.message});
}
