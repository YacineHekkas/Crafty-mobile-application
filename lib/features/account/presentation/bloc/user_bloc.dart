import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/features/account/domain/use_cases/become_provider_usecase.dart';
import 'package:cp_project/features/account/domain/use_cases/get_user_data_usecase.dart';
import 'package:cp_project/features/home/presentation/bloc/get_data_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/change_avatar-photo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserDataUsecase getUserDataUsecase;
  final ChangeAvatarUsecase changeAvatarUsecase;
  final BecomeProviderUsecase becomeProviderUsecase;
  UserBloc({
    required this.becomeProviderUsecase,
    required this.changeAvatarUsecase,
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
      else if(event is ChangeAvatarPhoto){
        await changeAvatarUsecase.call(event.id,event.imgPath);
      }
      else if(event is BecomeProviderEvent){
        final result = await becomeProviderUsecase.call();
        result.fold(
                (l) => emit(ErrorState(message: l)),
                (r) => emit(SuccessState(message: r))
        );
        add(GetUserInfoEvent());
        // await Future.delayed(const Duration(seconds: 3), () {
        //   emit(OperationDoneState());
        // });

      }

    });
  }
}
