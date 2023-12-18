part of 'recently_viewed_cubit.dart';

@immutable
abstract class RecentlyViewedState {}

class RecentlyViewedInitial extends RecentlyViewedState {}

class RecentlyViewedLoading extends RecentlyViewedState {}

class RecentlyViewedLoaded extends RecentlyViewedState {
  final List<BusinessModel>? business;

  RecentlyViewedLoaded({this.business});
}

class RecentlyViewedError extends RecentlyViewedState {
  final String? error;

  RecentlyViewedError({this.error});
}
