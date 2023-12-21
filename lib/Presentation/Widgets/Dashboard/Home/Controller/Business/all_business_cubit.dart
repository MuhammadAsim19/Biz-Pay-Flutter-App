import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'all_business_state.dart';

class AllBusinessCubit extends Cubit<AllBusinessState> {
  AllBusinessCubit() : super(AllBusinessInitial());

  getBusiness() async {
    await Future.delayed(Duration.zero);

    emit(AllBusinessLoading());

    print('cubit call');

    try {
      await AllBusiness.getBusiness().then((value) {
        if (value['Success']) {
          List<BusinessModel> business =
              List.from(value["body"].map((e) => BusinessModel.fromJson(e)));
          emit(AllBusinessLoaded(business: business));
        } else {
          emit(AllBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(AllBusinessError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(AllBusinessError(error: e.toString()));
      rethrow;
    }
  }
}
