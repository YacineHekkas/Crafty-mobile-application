import 'package:bloc/bloc.dart';
import 'package:cp_project/features/registration/domain/entities/User.dart';
import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:cp_project/features/registration/domain/use_cases/Sendverification.dart';
import 'package:cp_project/features/registration/domain/use_cases/is_login_case.dart';
import 'package:cp_project/features/registration/domain/use_cases/is_verified_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failurs.dart';
import '../../../../../../core/global/global.dart';
import '../../../../domain/use_cases/SignUp_Usecase.dart';
import '../../../../domain/use_cases/login_Usecase.dart';

part 'Auth_event.dart';
part 'Auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final IsLogInusecase isLogInusecase;
  final SignupUseCase _signupUseCase;
  final SendverificationUseCase _sendverificationUseCase;
  final Isverifiednusecase _isverifiednusecase;

  AuthBloc(this.loginUseCase, this.isLogInusecase, this._signupUseCase,
      this._sendverificationUseCase, this._isverifiednusecase)
      : super(LoginInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoadingState());
        final login = await loginUseCase.call(event.usera);
        print(event.usera.indentifier);
        print(event.usera.password);
        emit(_eitherDoneOrErrorState(
            login, LoginMessages.error_messg, LoginMessages.login_successe));
      } else if (event is SignupEvent) {
        emit(LoadingState());
        final singup = await _signupUseCase.call(event.users);
        emit(_eitherDoneOrErrorState(
            singup, LoginMessages.error_messg, LoginMessages.sing_up_successe));
      } else if (event is SendverficationEvent) {
        emit(LoadingState());
        final verify = await _sendverificationUseCase.call();
        emit(_eitherDoneOrErrorState(
            verify, LoginMessages.error_messg, LoginMessages.code_s));
      } else if (event is IsverifiedEvent) {
        emit(LoadingState());
        final isverified =
            await _isverifiednusecase.call(event.code1 as String);
        emit(_eitherDoneOrErrorState(isverified as Either<Failure, Unit>,
            LoginMessages.error_messg, LoginMessages.code_v));
      }
    });
  }
}

AuthState _eitherDoneOrErrorState(
    Either<Failure, Unit> either, String errorMssg, String successeMessg) {
  return either.fold(
    (l) => Failedlogin(message: errorMssg),
    (r) => Successedlogin(message: successeMessg),
  );
}
