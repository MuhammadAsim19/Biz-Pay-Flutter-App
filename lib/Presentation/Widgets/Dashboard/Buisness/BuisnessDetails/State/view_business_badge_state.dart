abstract class ViewBusinessBadgeState {}

class ViewBusinessBadgeInitial extends ViewBusinessBadgeState {}

class ViewBusinessBadgeLoading extends ViewBusinessBadgeState {}

class ViewBusinessBadgeLoaded extends ViewBusinessBadgeState {}

class ViewBusinessBadgeError extends ViewBusinessBadgeState {
  final String? error;

  ViewBusinessBadgeError({this.error});
}
