part of '../Controller/search_listing_cubit.dart';

@immutable
abstract class SearchListingState {}

class SearchListingInitial extends SearchListingState {}

class SearchListingLoading extends SearchListingState {}

class SearchListingLoaded extends SearchListingState {}

class SearchListingError extends SearchListingState {
  final String? error;

  SearchListingError({this.error});
}
