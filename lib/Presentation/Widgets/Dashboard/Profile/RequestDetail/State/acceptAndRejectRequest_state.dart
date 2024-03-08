abstract class AcceptAndRejectRequestState {}

class AcceptAndRejectRequestStateInitial extends AcceptAndRejectRequestState {}

class AcceptAndRejectRequestStateLoading extends AcceptAndRejectRequestState {}

class AcceptAndRejectRequestStateLoaded extends AcceptAndRejectRequestState {}

class AcceptAndRejectRequestStateError extends AcceptAndRejectRequestState {
  final String? error;

  AcceptAndRejectRequestStateError({this.error});
}
