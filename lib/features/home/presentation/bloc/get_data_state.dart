part of 'get_data_bloc.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class LoadingState extends GetDataState {}

class OperationDoneState extends GetDataState {}

class DataIsHereState extends GetDataState {
  final List<ServiceEntity> servicedata;

  DataIsHereState({required this.servicedata});
}

class ErrorState extends GetDataState {
  final dynamic message;
  ErrorState({required this.message});
}

class SuccessState extends GetDataState {
  final dynamic message;

  SuccessState({required this.message});
}
