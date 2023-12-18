part of 'recently_added_cubit.dart';

@immutable
abstract class RecentlyAddedState {}

class RecentlyAddedInitial extends RecentlyAddedState {}

class RecentlyAddedLoading extends RecentlyAddedState {}

class RecentlyAddedLoaded extends RecentlyAddedState {

 final List<BusinessModel>? data;

 RecentlyAddedLoaded({this.data});
}

class RecentlyAddedError extends RecentlyAddedState {

final  String? error;
RecentlyAddedError({this.error});
}


