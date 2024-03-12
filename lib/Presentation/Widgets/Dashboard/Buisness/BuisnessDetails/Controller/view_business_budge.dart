import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/view_business_badge_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewBusinessBadges extends Cubit<ViewBusinessBadgeState> {
  ViewBusinessBadges() : super(ViewBusinessBadgeInitial());

  getBadgeData({String? badgeId}) async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(ViewBusinessBadgeLoading());
    BadgesRepo.viewBusinessBadge(badgeId: badgeId).then((value) {
      print(value.toString());
      if (value['Success']) {
        var data = value["badgeDetails"];

        emit(ViewBusinessBadgeLoaded(
            isPaid: data['paid'],
            note: data['message'],
            attachemt: data["attachment"]));
      } else {
        emit(ViewBusinessBadgeError(error: value['error']));
      }
    }).catchError((e) {
      emit(ViewBusinessBadgeError(error: e.toString()));
      throw e;
    });
  }
}
