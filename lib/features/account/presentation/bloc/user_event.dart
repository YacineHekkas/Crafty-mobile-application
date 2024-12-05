part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserInfoEvent extends UserEvent{}
class ChangePasswordEvent extends UserEvent{}
class ChangeAvatarPhoto extends UserEvent{
  final String id;
  final String imgPath;

  ChangeAvatarPhoto({required this.id,required this.imgPath});
}
class BecomeProviderEvent extends UserEvent{}
