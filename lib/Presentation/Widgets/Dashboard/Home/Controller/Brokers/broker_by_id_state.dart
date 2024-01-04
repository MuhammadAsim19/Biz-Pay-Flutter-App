part of 'broker_by_id_cubit.dart';

@immutable
abstract class BrokerByIdState {}

class BrokerByIdInitial extends BrokerByIdState {}

class BrokerByIdLoading extends BrokerByIdState {}

class BrokerByIdLoaded extends BrokerByIdState {
  final BrokersListModel? model;

  BrokerByIdLoaded({this.model});
}

class BrokerByIdError extends BrokerByIdState {
  final String? error;

  BrokerByIdError({this.error});
}
