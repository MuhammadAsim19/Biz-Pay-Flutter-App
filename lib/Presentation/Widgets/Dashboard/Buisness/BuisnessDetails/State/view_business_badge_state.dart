abstract class ViewBusinessBadgeState {}

class ViewBusinessBadgeInitial extends ViewBusinessBadgeState {}

class ViewBusinessBadgeLoading extends ViewBusinessBadgeState {}

class ViewBusinessBadgeLoaded extends ViewBusinessBadgeState {
  final bool? isPaid;
  final String? attachemt;
  final String? note;

  ViewBusinessBadgeLoaded({
    this.isPaid,
    this.attachemt,
    this.note,
  });
}

class ViewBusinessBadgeError extends ViewBusinessBadgeState {
  final String? error;

  ViewBusinessBadgeError({this.error});
}
