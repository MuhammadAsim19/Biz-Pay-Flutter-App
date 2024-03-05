import 'package:buysellbiz/Domain/Badges/badgeModel.dart';

abstract class AllBadgesState {}

class AllBadgesInitialState extends AllBadgesState {}

class AllBadgesErrorState extends AllBadgesState {
  final String error;
  AllBadgesErrorState({required this.error});
}

class AllBadgesLoadingState extends AllBadgesState {}

class AllBadgesSelectionState extends AllBadgesState {}

class AllBadgesLoadedState extends AllBadgesState {
  final List<BadgeModel> badges;

  AllBadgesLoadedState({required this.badges});
}
