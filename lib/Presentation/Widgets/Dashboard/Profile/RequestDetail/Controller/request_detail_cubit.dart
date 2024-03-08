import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/State/request_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestDetailCubit extends Cubit<RequestDetailState> {
  RequestDetailCubit() : super(RequestDetailInitial());

  addDelivery({Map<String, dynamic>? data, String? path}) async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(RequestDetailLoading());
    await BadgesRepo.addBadgeDelivery(data: data, path: path).then((value) {
      if (value['Success']) {
        log("here is value ${value.toString()}");

        emit(RequestDetailLoaded());
      } else {
        emit(RequestDetailError(error: value['error']));
      }
    }).catchError((e) {
      emit(RequestDetailError(error: e.toString()));
      throw e;
    });
  }
}
