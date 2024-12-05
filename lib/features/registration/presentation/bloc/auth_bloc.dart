import 'package:cp_project/features/registration/data/data_sources/remote_data_source/auth_source.dart';
import 'package:cp_project/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final data = locator<AuthSource>();

  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>((event, emit) {
      if (event is UpdateRegistrationDataEvent || event is AuthEventAddable) {
        return;
      }

      emit(
        state.copyWith(
          status: _getEventStatus(event),
          result: AuthResult.pending,
        ),
      );
    });
    on<AccountLoginEvent>(_onAccountLogin);
    on<AccountRegisterEvent>(_onAccountRegister);
    on<AccountVerificationEvent>(_onAccountVerification);

    on<UpdateRegistrationDataEvent>(
      (event, emit) => emit(
        state.copyWith(
          status: AuthStatus.register,
          currentStep: event.step,
          data: state.data.copyWith(
            firstName: event.firstName,
            lastName: event.lastName,
            username: event.username,
            email: event.email,
            gender: event.gender,
            location: event.location,
            phone: event.phone,
            password: event.password,
            provider: event.provider,
          ),
        ),
      ),
    );
    on<AuthEventAddable>(
      (event, emit) => emit(
        state.copyWith(
          status: event.status,
          result: event.result,
        ),
      ),
    );
  }

  AuthStatus _getEventStatus(AuthEvent event) => event is AccountLoginEvent
      ? AuthStatus.login
      : event is AccountRegisterEvent
          ? AuthStatus.register
          : AuthStatus.verification;

  Future<void> _onAccountLogin(
      AccountLoginEvent event, Emitter<AuthState> emit) async {
    try {
      final res = await data.accountLogin(event.indentifier, event.password);
      final verified = await data.getAccountVerificationStatus();

      emit(state.copyWith(
        status: AuthStatus.login,
        result: AuthResult.authenticated,
        isVerified: verified,
        currentStep: -1,
      ));
    } catch (e, s) {
      print(e);
      print(s);

      emit(
        state.copyWith(
          status: AuthStatus.login,
          result: AuthResult.failure,
          lastException: e is GraphQLError ? e.message : e.toString(),
        ),
      );
    }
  }

  Future<void> _onAccountRegister(
      AccountRegisterEvent event, Emitter<AuthState> emit) async {
    try {
      assert(state.data.firstName != null);
      assert(state.data.lastName != null);
      assert(state.data.email != null);
      assert(state.data.phone != null);
      assert(state.data.username != null);
      assert(state.data.password != null);
      assert(state.data.provider != null);
      assert(state.data.location != null);

      await data.accountRegister(state.data);

      emit(
        state.copyWith(
          status: AuthStatus.verification,
          result: AuthResult.success,
          isVerified: false,
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);

      emit(
        state.copyWith(
          status: AuthStatus.register,
          result: AuthResult.failure,
          lastException: e is GraphQLError ? e.message : e.toString(),
        ),
      );
    }
  }

  Future<void> _onAccountVerification(
      AccountVerificationEvent event, Emitter<AuthState> emit) async {
    try {
      await data.verifyCode(event.code);

      emit(
        state.copyWith(
          status: AuthStatus.verification,
          result: AuthResult.authenticated,
          isVerified: true,
        ),
      );
    } catch (e, s) {
      print(e);
      print(s);

      emit(
        state.copyWith(
          status: AuthStatus.verification,
          result: AuthResult.failure,
          lastException: e is GraphQLError ? e.message : e.toString(),
        ),
      );
    }
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);

    print(
        '${transition.currentState} >> ${transition.event} >> ${transition.nextState}');
  }

  @override
  void onEvent(AuthEvent event) {
    super.onEvent(event);

    print('$event');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();
}
