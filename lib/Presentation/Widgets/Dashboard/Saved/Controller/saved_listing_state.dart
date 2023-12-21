part of 'saved_listing_cubit.dart';

@immutable
abstract class SavedListingState {}

class SavedListingInitial extends SavedListingState {}

class SavedListingLoading extends SavedListingState {}

class SavedListingLoaded extends SavedListingState {
  final List<WishList>? wishList;

  SavedListingLoaded({this.wishList});
}

class SavedListingError extends SavedListingState {
  final String? error;

  SavedListingError({this.error});
}
