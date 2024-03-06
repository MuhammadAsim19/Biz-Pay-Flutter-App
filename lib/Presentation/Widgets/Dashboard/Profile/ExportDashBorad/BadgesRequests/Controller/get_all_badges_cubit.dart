import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:meta/meta.dart';

part 'get_all_badges_state.dart';

class GetAllBadgesCubit extends Cubit<GetAllBadgesState> {
  GetAllBadgesCubit() : super(GetAllBadgesInitial());

  getBadges() async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(GetAllBadgesLoading());
    try {
      await BadgesRepo.getAllBadgesRequests().then((value) {
        if (value['Success']) {
          List<BadgesRequest> badgesRequest =
              List.from(value['body'].map((e) => BadgesRequest.fromJson(e)));
          List<BadgesRequest> pending = badgesRequest
              .where((element) => element.status == "pending")
              .toList();
          List<BadgesRequest> ongoing = badgesRequest
              .where((element) => element.status == "ongoing")
              .toList();
          emit(GetAllBadgesLoaded(pending: pending, ongoing: ongoing));
        } else {
          emit(GetAllBadgesError(error: value['Success']));
        }
      }).catchError((e) {
        emit(GetAllBadgesError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      emit(GetAllBadgesError(error: e.toString()));
      rethrow;
    }
  }
}
