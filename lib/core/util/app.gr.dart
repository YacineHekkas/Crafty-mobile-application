// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:cp_project/features/chat/presentation/widgets/conversation_messages.dart'
    as _i6;
import 'package:cp_project/features/home/presentation/pages/nav_screen.dart'
    as _i7;
import 'package:cp_project/features/registration/presentation/pages/introduction/intro_screen.dart'
    as _i2;
import 'package:cp_project/features/registration/presentation/pages/login/login_screen.dart'
    as _i1;
import 'package:cp_project/features/registration/presentation/pages/signup/signup_next_page.dart'
    as _i3;
import 'package:cp_project/features/registration/presentation/pages/signup/signup_screen.dart'
    as _i4;
import 'package:cp_project/features/registration/presentation/pages/signup/signup_verification_page.dart'
    as _i5;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.LoginScreen(
          key: args.key,
          hasBackArrow: args.hasBackArrow,
        ),
      );
    },
    IntroRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.IntroScreen(),
      );
    },
    SignupNextRoute.name: (routeData) {
      final args = routeData.argsAs<SignupNextRouteArgs>(
          orElse: () => const SignupNextRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SignupNextPage(
          key: args.key,
          hasBackArrow: args.hasBackArrow,
        ),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SignupScreen(
          key: args.key,
          hasBackArrow: args.hasBackArrow,
        ),
      );
    },
    SignupVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<SignupVerificationRouteArgs>(
          orElse: () => const SignupVerificationRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SignupVerificationPage(
          key: args.key,
          hasBackArrow: args.hasBackArrow,
        ),
      );
    },
    ConversationMessages.name: (routeData) {
      final args = routeData.argsAs<ConversationMessagesArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ConversationMessages(
          key: args.key,
          id: args.id,
          receiver: args.receiver,
          name: args.name,
          avatar: args.avatar,
          isOnline: args.isOnline,
          lastOnline: args.lastOnline,
        ),
      );
    },
    NavRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NavScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    bool hasBackArrow = true,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            hasBackArrow: hasBackArrow,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<LoginRouteArgs> page =
      _i8.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.hasBackArrow = true,
  });

  final _i9.Key? key;

  final bool hasBackArrow;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, hasBackArrow: $hasBackArrow}';
  }
}

/// generated route for
/// [_i2.IntroScreen]
class IntroRoute extends _i8.PageRouteInfo<void> {
  const IntroRoute({List<_i8.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignupNextPage]
class SignupNextRoute extends _i8.PageRouteInfo<SignupNextRouteArgs> {
  SignupNextRoute({
    _i9.Key? key,
    bool hasBackArrow = true,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          SignupNextRoute.name,
          args: SignupNextRouteArgs(
            key: key,
            hasBackArrow: hasBackArrow,
          ),
          initialChildren: children,
        );

  static const String name = 'SignupNextRoute';

  static const _i8.PageInfo<SignupNextRouteArgs> page =
      _i8.PageInfo<SignupNextRouteArgs>(name);
}

class SignupNextRouteArgs {
  const SignupNextRouteArgs({
    this.key,
    this.hasBackArrow = true,
  });

  final _i9.Key? key;

  final bool hasBackArrow;

  @override
  String toString() {
    return 'SignupNextRouteArgs{key: $key, hasBackArrow: $hasBackArrow}';
  }
}

/// generated route for
/// [_i4.SignupScreen]
class SignupRoute extends _i8.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i9.Key? key,
    bool hasBackArrow = true,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(
            key: key,
            hasBackArrow: hasBackArrow,
          ),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i8.PageInfo<SignupRouteArgs> page =
      _i8.PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({
    this.key,
    this.hasBackArrow = true,
  });

  final _i9.Key? key;

  final bool hasBackArrow;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key, hasBackArrow: $hasBackArrow}';
  }
}

/// generated route for
/// [_i5.SignupVerificationPage]
class SignupVerificationRoute
    extends _i8.PageRouteInfo<SignupVerificationRouteArgs> {
  SignupVerificationRoute({
    _i9.Key? key,
    bool hasBackArrow = true,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          SignupVerificationRoute.name,
          args: SignupVerificationRouteArgs(
            key: key,
            hasBackArrow: hasBackArrow,
          ),
          initialChildren: children,
        );

  static const String name = 'SignupVerificationRoute';

  static const _i8.PageInfo<SignupVerificationRouteArgs> page =
      _i8.PageInfo<SignupVerificationRouteArgs>(name);
}

class SignupVerificationRouteArgs {
  const SignupVerificationRouteArgs({
    this.key,
    this.hasBackArrow = true,
  });

  final _i9.Key? key;

  final bool hasBackArrow;

  @override
  String toString() {
    return 'SignupVerificationRouteArgs{key: $key, hasBackArrow: $hasBackArrow}';
  }
}

/// generated route for
/// [_i6.ConversationMessages]
class ConversationMessages extends _i8.PageRouteInfo<ConversationMessagesArgs> {
  ConversationMessages({
    _i9.Key? key,
    required String id,
    required String receiver,
    required String name,
    required String avatar,
    required bool isOnline,
    DateTime? lastOnline,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ConversationMessages.name,
          args: ConversationMessagesArgs(
            key: key,
            id: id,
            receiver: receiver,
            name: name,
            avatar: avatar,
            isOnline: isOnline,
            lastOnline: lastOnline,
          ),
          initialChildren: children,
        );

  static const String name = 'ConversationMessages';

  static const _i8.PageInfo<ConversationMessagesArgs> page =
      _i8.PageInfo<ConversationMessagesArgs>(name);
}

class ConversationMessagesArgs {
  const ConversationMessagesArgs({
    this.key,
    required this.id,
    required this.receiver,
    required this.name,
    required this.avatar,
    required this.isOnline,
    this.lastOnline,
  });

  final _i9.Key? key;

  final String id;

  final String receiver;

  final String name;

  final String avatar;

  final bool isOnline;

  final DateTime? lastOnline;

  @override
  String toString() {
    return 'ConversationMessagesArgs{key: $key, id: $id, receiver: $receiver, name: $name, avatar: $avatar, isOnline: $isOnline, lastOnline: $lastOnline}';
  }
}

/// generated route for
/// [_i7.NavScreen]
class NavRoute extends _i8.PageRouteInfo<void> {
  const NavRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NavRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
