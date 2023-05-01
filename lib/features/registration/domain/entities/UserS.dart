import 'dart:ffi';

class UserS {
  final String? name;
  final String? username;
  final String? gender;
  final String? email;
  final String? password;
  final String phone;
  final Location location;

  UserS({
    required this.phone,
    required this.name,
    required this.username,
    required this.gender,
    required this.email,
    required this.password,
    required this.location,
  });
}

class Location {
  final List<double> coordinates;
  final String? state;
  final String? district;

  Location({required this.coordinates, this.district, this.state});
}
