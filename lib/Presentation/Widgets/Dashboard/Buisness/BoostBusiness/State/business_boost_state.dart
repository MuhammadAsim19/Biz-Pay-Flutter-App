import 'package:buysellbiz/Domain/BusinessModel/boost_model.dart';

abstract class BusinessBoostState {}

class BusinessBoostInitialState extends BusinessBoostState {}

class BusinessBoostLoadingState extends BusinessBoostState {}

class BusinessBoostErrorState extends BusinessBoostState {
  final String error;

  BusinessBoostErrorState({required this.error});
}

class BusinessBoostLoadedState extends BusinessBoostState {
  final List<BoostModel> boostPackages;

  BusinessBoostLoadedState({required this.boostPackages});
}

class BusinessBoostActivatedState extends BusinessBoostState {}
