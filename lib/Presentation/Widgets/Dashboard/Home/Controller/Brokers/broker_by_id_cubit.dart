import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Brokers/brokers.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:meta/meta.dart';

part 'broker_by_id_state.dart';

class BrokerByIdCubit extends Cubit<BrokerByIdState> {
  BrokerByIdCubit() : super(BrokerByIdInitial());

  getBrokersById({String? brokerId}) async {
    await Future.delayed(Duration.zero);

    emit(BrokerByIdLoading());

    print('cubit call');

    try {
      await BrokersData.brokerData(brokerId: brokerId).then((value) {
        if (value['Success']) {
          print(value.toString());

          BrokersListModel model = BrokersListModel.fromJson(value['body']);

          emit(BrokerByIdLoaded(model: model));
        } else {
          emit(BrokerByIdError(error: value['error']));
        }
      }).catchError((e) {
        emit(BrokerByIdError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(BrokerByIdError(error: e.toString()));
      rethrow;
    }
  }
}
