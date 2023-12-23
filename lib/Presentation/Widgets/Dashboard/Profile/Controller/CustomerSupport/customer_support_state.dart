part of 'customer_support_cubit.dart';

@immutable
abstract class CustomerSupportState {}

class CustomerSupportInitial extends CustomerSupportState {}

class CustomerSupportLoading extends CustomerSupportState {}

class CustomerSupportLoaded extends CustomerSupportState {}

class CustomerSupportError extends CustomerSupportState {
  final String? error;

  CustomerSupportError({this.error});
}
