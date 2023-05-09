part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserInfoEvent extends UserEvent{}
class ChangePasswordEvent extends UserEvent{}
class BecomeProviderEvent extends UserEvent{}
