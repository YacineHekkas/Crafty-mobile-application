part of 'get_data_bloc.dart';

@immutable
abstract class DataEvent {}

class CallServerEvent extends DataEvent {
  final String subCategory;
  final String category;
  final String searchingValue;
  final bool isSearching;

  CallServerEvent({ required this.searchingValue,required this.isSearching,  required this.subCategory,required this.category,});
}

class CreateServiceEvent extends DataEvent {
  final List<XFile> imagesList;
  final List<XFile> imageDisplayList;
  final String category;
  final String subCategory;
  final String description;

  CreateServiceEvent({
    required this.imageDisplayList,
      required this.imagesList,
      required this.category,
      required this.subCategory,
      required this.description});
}
