part of 'get_data_bloc.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class LoadingState  extends GetDataState{}
class SubCategorychange extends GetDataState{}

class DataIsHereState extends GetDataState{
  final List<ServiceEntity> servicedata;

  DataIsHereState({
    required this.servicedata
  });
}

class ErrorState extends GetDataState{
  final String message;
  ErrorState({
    required this.message
  });
}
class SuccessState extends GetDataState{
  final String mesg;

  SuccessState({
    required this.mesg
  });
}
