import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/domain/use_cases/create_service_usecase.dart';
import 'package:cp_project/features/home/domain/use_cases/get_services_uasecase.dart';
import 'package:cp_project/injection_container.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';

class DataBloc extends Bloc<DataEvent, GetDataState> {
  final GetServicesUsecase getServicesUseCase;
  final CreatServiceUsecase createServiceUsecase;

  DataBloc(
      {required this.createServiceUsecase, required this.getServicesUseCase})
      : super(GetDataInitial()) {
        on<GetConvEvent>(_getConversation);
    on<DataEvent>((event, emit) async {

      if (event is CallServerEvent) {
        emit(LoadingState());
        final dataList = await getServicesUseCase.call(event.category,event.subCategory,event.searchingValue,event.isSearching);
        dataList.fold((l) => print('-----------------ggbloc--->$l'),
            (r) => emit(DataIsHereState(servicedata: r)));
      }
      else if (event is CreateServiceEvent) {
        emit(LoadingState());
        final result = await createServiceUsecase.call(event.category, event.subCategory, event.description, event.imagesList,event.imageDisplayList);
        emit(_eitherDoneOrErrorState(result,left(result),right(result)));
        await Future.delayed(const Duration(seconds: 5), () {
          emit(OperationDoneState());
        });
      }
    });
  }

  Future<void> _getConversation(GetConvEvent event, Emitter<GetDataState> emit) async {
    try {
      final id = await locator<ChatSource>().createConversation(event.id);

      emit(IDisHere(id));

    } catch (e, s) {
    print(e);
    print(s);
    }
  }

  GetDataState _eitherDoneOrErrorState(
      Either<Failure, dynamic> either,
      dynamic errorMssg,
      dynamic successeMessg) {
    return either.fold(
      (l) => ErrorState(message: l),
      (r) => SuccessState(message: r),
    );
  }
}
