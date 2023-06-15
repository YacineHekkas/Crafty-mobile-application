import 'package:cp_project/features/account/data/models/user_model.dart';

class UserEntity {
  UserEntity({
    required this.avatar,
    required this.createdAt,
    required this.email,
    required this.id,
    required this.gender,
    required this.location,
    required this.name,
    required this.phone,
    required this.password,
    required this.provider,
    required this.tags,
    required this.username,
  });
  late final String? avatar;
  late final String createdAt;
  late final String email;
  late final String id;
  late final String gender;
  late final Location location;
  late final String name;
  late final String phone;
  late final String password;
  late final bool provider;
  late final List<dynamic> tags;
  late final String username;
}