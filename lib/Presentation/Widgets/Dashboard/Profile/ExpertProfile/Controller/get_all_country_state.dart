part of 'get_all_country_cubit.dart';

@immutable
abstract class GetAllCountryState {}

class GetAllCountryInitial extends GetAllCountryState {}

class GetAllCountryLoading extends GetAllCountryState {}

class GetAllCountryLoaded extends GetAllCountryState {
  final List<dynamic>? country;

  GetAllCountryLoaded({this.country});
}

class GetAllCountryStateLoaded extends GetAllCountryState {
  final List<dynamic>? states;

  GetAllCountryStateLoaded({this.states});
}

class GetAllCountryError extends GetAllCountryState {
  final String? error;

  GetAllCountryError({this.error});
}