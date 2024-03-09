import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'your_business_state.dart';

class YourBusinessCubit extends Cubit<YourBusinessState> {
  YourBusinessCubit() : super(YourBusinessInitial());

  getBusinessList() async {
    await Future.delayed(Duration.zero);

    emit(YourBusinessLoading());

    try {
      await AllBusiness.yourBusinessList().then((value) {
        if (value['Success']) {
          log("here is value ${value.toString()}");

          //
          List<BusinessModel> business =
              List.from(value["body"].map((e) => BusinessModel.fromJson(e)));

          print(value.toString());

          emit(YourBusinessLoaded(business: business));
        } else {
          emit(YourBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(YourBusinessError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(YourBusinessError(error: e.toString()));
      rethrow;
    }
  }
}
