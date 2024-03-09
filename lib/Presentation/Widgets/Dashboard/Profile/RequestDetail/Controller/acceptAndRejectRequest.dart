import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/State/acceptAndRejectRequest_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcceptAndRejectRequestCubit extends Cubit<AcceptAndRejectRequestState> {
  AcceptAndRejectRequestCubit() : super(AcceptAndRejectRequestStateInitial());

  acceptRequest({String? status, String? requestId}) async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(AcceptAndRejectRequestStateLoading());

    await BadgesRepo.acceptORRejectRequest(status: status, requestID: requestId)
        .then((value) {
      if (value['Success']) {
        emit(AcceptAndRejectRequestStateLoaded());
      } else {
        emit(AcceptAndRejectRequestStateError(error: value['error']));
      }
    }).catchError((e) {
      emit(AcceptAndRejectRequestStateError(error: e.toString()));
      throw e;
    });
  }
}
