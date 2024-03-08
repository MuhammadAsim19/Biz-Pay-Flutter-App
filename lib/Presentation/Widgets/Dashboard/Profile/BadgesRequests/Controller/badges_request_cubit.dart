import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/BadgesRequests/State/badges_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadgesRequestCubit extends Cubit<BadgesRequestState> {
  BadgesRequestCubit() : super(BadgesRequestInitial());

  getBadgesRequest() async {
    await Future.delayed(Duration.zero);
    emit(BadgesRequestLoading());
    try {
      await BadgesRepo.getAllBadgesRequests(isBroker: false).then((value) {
        if (value['Success']) {
          log(value.toString());
          List<BadgesRequest> badgesRequest =
              List.from(value['body'].map((e) => BadgesRequest.fromJson(e)));
          List<BadgesRequest> accepted = badgesRequest
              .where((element) => element.status == "accepted")
              .toList();
          List<BadgesRequest> delivered = badgesRequest
              .where((element) => element.status == "delivered")
              .toList();
          emit(BadgesRequestLoaded(accepted: accepted, delivered: delivered));
        } else {
          emit(BadgesRequestError(error: value['error']));
        }
      }).catchError((e) {
        emit(BadgesRequestError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      emit(BadgesRequestError(error: e.toString()));
      rethrow;
    }
  }
}
