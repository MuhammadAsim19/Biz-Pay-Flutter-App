import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Brokers/brokers.dart';
import 'package:meta/meta.dart';

part 'broker_profile_state.dart';

class BrokerProfileCubit extends Cubit<BrokerProfileState> {
  BrokerProfileCubit() : super(BrokerProfileInitial());

  createBroker(
      {required Map<String, dynamic> body, required String imagePath}) async {
    emit(BrokerProfileLoading());

    try {
      await BrokersData.switchToBroker(body: body, imagePath: imagePath)
          .then((value) {
        log(value.toString());

        if (value['Success']) {
          emit(BrokerProfileLoaded());
        } else {
          emit(BrokerProfileError(error: value['error']));
        }
      }).catchError((e) {
        emit(BrokerProfileError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      emit(BrokerProfileError(error: e.toString()));
      rethrow;
    }
  }
}
