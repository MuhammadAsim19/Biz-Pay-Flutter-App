import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:meta/meta.dart';

part 'add_delivery_state.dart';

class AddDeliveryCubit extends Cubit<AddDeliveryState> {
  AddDeliveryCubit() : super(AddDeliveryInitial());

  addDelivery({Map<String, dynamic>? data, String? path}) async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(AddDeliveryLoading());
    await BadgesRepo.addBadgeDelivery(data: data, path: path).then((value) {
      if (value['Success']) {
        log("here is value ${value.toString()}");

        emit(AddDeliveryLoaded());
      } else {
        emit(AddDeliveryError(error: value['error']));
      }
    }).catchError((e) {
      emit(AddDeliveryError(error: e.toString()));
      throw e;
    });
  }
}
