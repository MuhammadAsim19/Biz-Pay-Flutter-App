part of 'app_budges_cubit.dart';

@immutable
abstract class AppBudgesState {}

class AppBudgesInitial extends AppBudgesState {}

class AppBudgesLoading extends AppBudgesState {}

class AppBudgesLoaded extends AppBudgesState {
  final List<AppBadgesModel>? appBadges;

  AppBudgesLoaded({this.appBadges});
}

class AppBudgesError extends AppBudgesState {
  final String? error;

  AppBudgesError({this.error});
}
