import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/view_business_badge_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewBusinessBadges extends Cubit<ViewBusinessBadgeState> {
  ViewBusinessBadges() : super(ViewBusinessBadgeInitial());

  getBadgeData({String? badgeId}) async {
    BadgesRepo.viewBusinessBadge(badgeId: badgeId).then((value) {
      if (value['Success']) {
        emit(ViewBusinessBadgeLoaded());
      } else {
        emit(ViewBusinessBadgeError(error: value['error']['msg']));
      }
    }).catchError((e) {
      emit(ViewBusinessBadgeError(error: e.toString()));
      throw e;
    });
  }
}
