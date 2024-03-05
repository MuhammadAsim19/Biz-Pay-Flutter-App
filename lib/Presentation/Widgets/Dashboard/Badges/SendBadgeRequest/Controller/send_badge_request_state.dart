abstract class SendBadgeRequestState {}

class SendBadgeRequestInitial extends SendBadgeRequestState {}

class SendBadgeRequestLoading extends SendBadgeRequestState {}

class SendBadgeRequestLoaded extends SendBadgeRequestState {}

class SendBadgeRequestError extends SendBadgeRequestState {
  final String? error;

  SendBadgeRequestError({this.error});
}
