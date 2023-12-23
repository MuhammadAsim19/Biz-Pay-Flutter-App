part of '../Controller/add_to_recently_view_cubit.dart';

@immutable
abstract class AddToRecentlyViewState {}

class AddToRecentlyViewInitial extends AddToRecentlyViewState {}

class AddToRecentlyViewLoading extends AddToRecentlyViewState {}

class AddToRecentlyViewLoaded extends AddToRecentlyViewState {}

class AddToRecentlyViewError extends AddToRecentlyViewState {
  final String? error;

  AddToRecentlyViewError({this.error});
}
