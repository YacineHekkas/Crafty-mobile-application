import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/features/account/domain/use_cases/get_user_data_usecase.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserDataUsecase getUserDataUsecase;
  UserBloc({
    required this.getUserDataUsecase
  }) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUserInfoEvent){
        final data= await getUserDataUsecase.call();
        data.fold(
                (l) => print('-----------------ggbloc--->$l'),
                (r) => emit(DataIsHereState( userInfo: r))
        );
      }

    });
  }
}
