import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/domain/use_cases/get_account_usecase.dart';
import 'package:cp_project/features/home/domain/use_cases/get_services_uasecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  final GetServicesUseCase getServicesUseCase;
  final GetAccountUseCase getAccountUseCase;

  GetDataBloc({
    required this.getAccountUseCase,
    required this.getServicesUseCase
  }) : super(GetDataInitial()) {
    on<GetDataEvent>((event, emit)
          async {
              if(event is CallServerEvent) {
                emit(LoadingState());
                  final dataList = await getServicesUseCase.call(event.subCategory);
                  dataList.fold(
                          (l) => print('-----------------ggbloc--->$l'),
                          (r) => emit(DataIsHereState(servicedata: r ))
                  );
              }
          }
    );
  }

  GetDataState _eitherDoneOrErrorState(Either<Failure,List<ServiceEntity>> either,String errorMssg,String successeMessg){
    return either.fold(
          (l) => ErrorState(message: errorMssg),
          (r) => SuccessState(mesg:successeMessg),
    );
  }
}
