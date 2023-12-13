part of '../Controller/add_buisness_cubit.dart';

@immutable
abstract class AddBuisnessState {}

class AddBuisnessInitial extends AddBuisnessState {}

class AddBuisnessLoading extends AddBuisnessState {}

class AddBuisnessLoaded extends AddBuisnessState {}

class AddBuisnessError extends AddBuisnessState {
 final String? error;
  AddBuisnessError({this.error});
}


