part of 'get_all_badges_request_cubit.dart';

@immutable
abstract class AllBadgesRequestState {}

class AllBadgesRequestInitial extends AllBadgesRequestState {}

class AllBadgesRequestLoading extends AllBadgesRequestState {}

class AllBadgesRequestLoaded extends AllBadgesRequestState {
  final List<BadgesRequest>? pending;
  final List<BadgesRequest>? ongoing;

  AllBadgesRequestLoaded({this.pending, this.ongoing});
}

class AllBadgesRequestError extends AllBadgesRequestState {
  final String? error;

  AllBadgesRequestError({this.error});
}
