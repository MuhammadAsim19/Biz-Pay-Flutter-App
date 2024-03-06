part of 'get_all_badges_cubit.dart';

@immutable
abstract class GetAllBadgesState {}

class GetAllBadgesInitial extends GetAllBadgesState {}

class GetAllBadgesLoading extends GetAllBadgesState {}

class GetAllBadgesLoaded extends GetAllBadgesState {
  final List<BadgesRequest>? pending;
  final List<BadgesRequest>? ongoing;

  GetAllBadgesLoaded({this.pending, this.ongoing});
}

class GetAllBadgesError extends GetAllBadgesState {
  final String? error;

  GetAllBadgesError({this.error});
}
