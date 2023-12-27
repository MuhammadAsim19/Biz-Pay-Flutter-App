import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'recently_viewed_state.dart';

class RecentlyViewedCubit extends Cubit<RecentlyViewedState> {
  RecentlyViewedCubit() : super(RecentlyViewedInitial());

  getRecentBusiness() async {
    await Future.delayed(Duration.zero);

    emit(RecentlyViewedLoading());

    print('cubit call');

    try {
      await AllBusiness.recentlyView().then((value) {
        log("recent bussines${value.toString()}");

        if (value['Success'] == true) {
          List<BusinessModel> business =
              List.from(value['body'].map((e) => BusinessModel.fromJson(e)));
          emit(RecentlyViewedLoaded(business: business));
        } else {
          emit(RecentlyViewedError(error: value['error']));
        }
      }).catchError((e) {
        emit(RecentlyViewedError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(RecentlyViewedError(error: e.toString()));
      rethrow;
    }
  }
}
