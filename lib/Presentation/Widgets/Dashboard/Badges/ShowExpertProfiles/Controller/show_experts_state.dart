import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';

abstract class ShowExpertsState {}

class ShowExpertsInitial extends ShowExpertsState {}

class ShowExpertsLoading extends ShowExpertsState {}

class ShowExpertsLoaded extends ShowExpertsState {
  final List<BrokersListModel>? profileData;

  ShowExpertsLoaded({this.profileData});
}

class ShowExpertsError extends ShowExpertsState {
  final String? error;

  ShowExpertsError({this.error});
}
