import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'recently_added_state.dart';

class RecentlyAddedCubit extends Cubit<RecentlyAddedState> {
  RecentlyAddedCubit() : super(RecentlyAddedInitial());

  getRecentBusiness() async {
    await Future.delayed(Duration.zero);

    emit(RecentlyAddedLoading());

    print('cubit call');

    try {
      await AllBusiness.recentlyAdded().then((value) {
        if (value['Success']) {
          List<BusinessModel> business =
              List.from(value["body"].map((e) => BusinessModel.fromJson(e)));
          emit(RecentlyAddedLoaded(data: business));
        } else {
          emit(RecentlyAddedError(error: value['error']));
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>$value');
        }
      }).catchError((e) {
        emit(RecentlyAddedError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      emit(RecentlyAddedError(error: e.toString()));
      rethrow;
    }
  }
}
