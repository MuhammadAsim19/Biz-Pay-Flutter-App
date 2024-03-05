import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Domain/Badges/badgeModel.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/AllBadges/State/all_badges_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBadgesCubit extends Cubit<AllBadgesState> {
  AllBadgesCubit() : super(AllBadgesInitialState());
  List<String> selectedBadgesId = [];
  List<BadgeModel> badges = [];

  void getBadges() async {
    await Future.delayed(Duration.zero);
    emit(AllBadgesLoadingState());
    BadgesRepo.getBadges().then(
      (value) {
        if (value['Success']) {
          badges = (value['body'] as List)
              .map((e) => BadgeModel.fromJson(e))
              .toList();
          emit(AllBadgesLoadedState(badges: badges));
        } else {
          emit(AllBadgesErrorState(error: value['error']));
        }
      },
    );
  }

  void toggleSelection(String? id) {
    if (id != null) {
      if (selectedBadgesId.contains(id)) {
        selectedBadgesId.remove(id);
      } else {
        selectedBadgesId.add(id);
      }
      emit(AllBadgesSelectionState());
    }
  }

  bool checkSelection(String? id) {
    return selectedBadgesId.contains(id);
  }
}
