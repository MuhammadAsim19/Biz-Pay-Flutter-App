part of 'brokers_cubit.dart';

@immutable
abstract class BrokersState {}

class BrokersInitial extends BrokersState {}

class BrokersLaoding extends BrokersState {}

class BrokersLoaded extends BrokersState {
  final List<BrokersListModel>? brokers;

  BrokersLoaded({this.brokers});
}

class BrokersError extends BrokersState {
  final String? error;

  BrokersError({this.error});
}
