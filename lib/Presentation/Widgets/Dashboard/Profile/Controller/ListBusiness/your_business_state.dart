part of 'your_business_cubit.dart';

@immutable
abstract class YourBusinessState {}

class YourBusinessInitial extends YourBusinessState {}

class YourBusinessLoading extends YourBusinessState {}

class YourBusinessLoaded extends YourBusinessState {
  final List<BusinessModel>? business;

  YourBusinessLoaded({this.business});
}

class YourBusinessError extends YourBusinessState {
  final String? error;

  YourBusinessError({this.error});
}
