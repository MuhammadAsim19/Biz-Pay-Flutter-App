part of 'get_all_badges_request_cubit.dart';

@immutable
abstract class AllBadgesRequestState {}

class AllBadgesRequestInitial extends AllBadgesRequestState {}

class AllBadgesRequestLoading extends AllBadgesRequestState {}

class AllBadgesRequestLoaded extends AllBadgesRequestState {
  final List<BadgesRequest> pending;
  final List<BadgesRequest> rejected;

  AllBadgesRequestLoaded({required this.pending, required this.rejected});
}

class AllBadgesRequestError extends AllBadgesRequestState {
  final String? error;

  AllBadgesRequestError({this.error});
}
