part of 'add_delivery_cubit.dart';

@immutable
abstract class AddDeliveryState {}

class AddDeliveryInitial extends AddDeliveryState {}

class AddDeliveryLoading extends AddDeliveryState {}

class AddDeliveryLoaded extends AddDeliveryState {}

class AddDeliveryError extends AddDeliveryState {
  final String? error;

  AddDeliveryError({this.error});
}
