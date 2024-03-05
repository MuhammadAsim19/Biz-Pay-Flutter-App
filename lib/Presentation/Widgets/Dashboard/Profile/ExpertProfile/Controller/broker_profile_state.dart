part of 'broker_profile_cubit.dart';

@immutable
abstract class BrokerProfileState {}

class BrokerProfileInitial extends BrokerProfileState {}

class BrokerProfileLoading extends BrokerProfileState {}

class BrokerProfileLoaded extends BrokerProfileState {}

class BrokerProfileError extends BrokerProfileState {
  final String? error;

  BrokerProfileError({this.error});
}

class BrokerPackagesLoadingState extends BrokerProfileState {}

class BrokerPackagesLoadedState extends BrokerProfileState {
  final List<PackageModel> packages;

  BrokerPackagesLoadedState({required this.packages});
}

class BrokerPackagesErrorState extends BrokerProfileState {
  final String? error;

  BrokerPackagesErrorState({this.error});
}
