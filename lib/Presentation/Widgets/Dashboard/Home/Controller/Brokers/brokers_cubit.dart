import 'dart:developer';

import "package:bloc/bloc.dart";
import 'package:buysellbiz/Data/DataSource/Repository/Brokers/brokers.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:meta/meta.dart';

part 'brokers_state.dart';

class BrokersCubit extends Cubit<BrokersState> {
  BrokersCubit() : super(BrokersInitial());

  getBrokers() async {
    await Future.delayed(Duration.zero);

    emit(BrokersLaoding());

    print('cubit call');

    try {
      await BrokersData.brokerData().then((value) {
        if (value['Success']) {
          List<BrokersListModel> brokers =
              List.from(value["body"].map((e) => BrokersListModel.fromJson(e)));

          print(brokers.length);

          emit(BrokersLoaded(brokers: brokers));
        } else {
          emit(BrokersError(error: value['error']));
        }
      }).catchError((e) {
        emit(BrokersError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(BrokersError(error: e.toString()));
      rethrow;
    }
  }
}
