import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/view_business_badge_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewBusinessBadges extends Cubit<ViewBusinessBadgeState> {
  ViewBusinessBadges() : super(ViewBusinessBadgeInitial());

  getBadgeData({String? badgeId}) async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(ViewBusinessBadgeLoading());
    await BadgesRepo.viewBusinessBadge(badgeId: badgeId).then((value) {
      if (value['Success']) {
        // log("hshasidaoisdaaspkdadkjaaskpdma${value.toString()}");

        emit(ViewBusinessBadgeLoaded(
            isPaid: value['paid'],
            note: value['message'],
            attachemt: value["attachment"]));
      } else {
        emit(ViewBusinessBadgeError(error: value['error']));
      }
    }).catchError((e) {
      emit(ViewBusinessBadgeError(error: e.toString()));
      throw e;
    });
  }
}
