part of 'get_data_bloc.dart';

@immutable
abstract class GetDataEvent {}

class CallServerEvent extends GetDataEvent{
  final String subCategory ;

  CallServerEvent({
    required this.subCategory
  });

}
