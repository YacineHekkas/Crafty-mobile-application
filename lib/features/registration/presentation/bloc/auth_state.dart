part of 'auth_bloc.dart';

enum AuthStatus { intro, register, login, verification }

enum AuthResult { authenticated, pending, failure, success, none }

class Registration extends Equatable {
  const Registration({
    this.firstName,
    this.lastName,
    this.gender,
    this.location,
    this.email,
    this.password,
    this.phone,
    this.provider,
    this.username,
  });
  final String? firstName;
  final String? lastName;
  final String? username;

  final String? email;
  final String? gender;
  final Location? location;
  final String? phone;
  final String? password;
  final bool? provider;

  Registration copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? gender,
    Location? location,
    String? phone,
    String? password,
    bool? provider,
  }) =>
      Registration(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        location: location ?? this.location,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        provider: provider ?? this.provider,
      );

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        firstName: json['name'] != null ? json['name'].split(' ')[0] : null,
        lastName: json['name'] != null ? json['name'].split(' ')[1] : null,
        email: json['email'],
        username: json['username'],
        gender: json['gender'],
        location: json['location'] != null
            ? Location.fromJson(json['location'])
            : null,
        phone: json['phone'],
        password: json['password'],
        provider: json['provider'],
      );

  Map<String, dynamic> toJson() => {
        'name': firstName != null && lastName != null
            ? '$firstName $lastName'
            : null,
        'email': email,
        'gender': gender?.toLowerCase(),
        'location': location?.toJson(),
        'phone': phone,
        'password': password,
        'provider': provider,
        'username': username,
      };

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
      ];
}

class Location extends Equatable {
  const Location({
    required this.state,
    required this.district,
    required this.coordinates,
  });
  final String state;
  final String district;
  final List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        state: json['state'],
        district: json['district'],
        coordinates: List.from(
          json['coordinates'],
        ),
      );

  Map<String, dynamic> toJson() => {
        'type': 'Point',
        'state': state,
        'district': district,
        'coordinates': coordinates,
      };

  @override
  List<Object?> get props => [
        state,
        district,
        coordinates,
      ];
}

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.intro,
    this.result = AuthResult.none,
    this.currentStep = 0,
    this.data = const Registration(),
    this.isConnected = true,
    this.isVerified = false,
    this.lastException,
  });

  final AuthStatus status;
  final AuthResult result;
  final int currentStep;

  final Registration data;
  final bool isVerified;
  final bool isConnected;

  final String? lastException;

  AuthState copyWith({
    AuthStatus? status,
    AuthResult? result,
    int? currentStep,
    Registration? data,
    String? lastException,
    bool? isVerified,
    bool? isConnected,
  }) =>
      AuthState(
        status: status ?? this.status,
        result: result ?? this.result,
        currentStep: currentStep != null ? currentStep > this.currentStep ? currentStep : this.currentStep : this.currentStep,
        data: data ?? this.data,
        lastException: lastException ?? this.lastException,
        isConnected: isConnected ?? this.isConnected,
        isVerified: isVerified ?? this.isVerified,
      );

  factory AuthState.fromJson(Map<String, dynamic> json) => AuthState(
        status: AuthStatus.values[json['status']],
        result: AuthResult.values[json['result']],
        currentStep: json['currentStep'],
        isVerified: json['verified'] ?? false,
        data: Registration.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status.index,
        'result': result.index,
        'currentStep': currentStep,
        'verified': isVerified,
        'data': data.toJson(),
      };

  @override
  List<Object?> get props => [status, result, data, currentStep, lastException, isVerified, isConnected];
}
