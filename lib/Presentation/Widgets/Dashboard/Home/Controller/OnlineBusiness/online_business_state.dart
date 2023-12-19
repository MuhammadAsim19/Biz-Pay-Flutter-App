part of 'online_business_cubit.dart';

@immutable
abstract class OnlineBusinessState {}

class OnlineBusinessInitial extends OnlineBusinessState {}

class OnlineBusinessLoading extends OnlineBusinessState {}

class OnlineBusinessLoaded extends OnlineBusinessState {
  final List<BusinessModel>? data;

  OnlineBusinessLoaded({this.data});
}

class OnlineBusinessError extends OnlineBusinessState {
  final String? error;

  OnlineBusinessError({this.error});
}
