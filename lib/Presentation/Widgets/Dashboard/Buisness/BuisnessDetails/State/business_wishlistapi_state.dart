abstract class BussinessWishlistApiState {}

class BussinessWishlistApiInitial extends BussinessWishlistApiState {}

class BussinessWishlistApiLoading extends BussinessWishlistApiState {}

class BussinessWishlistApiLoaded extends BussinessWishlistApiState {
  final bool? wishliatValue;

  BussinessWishlistApiLoaded({this.wishliatValue});
}

class BussinessWishlistApiInLoaded extends BussinessWishlistApiState {
  final bool? wishliatValue;

  BussinessWishlistApiInLoaded({this.wishliatValue});
}

class BussinessWishlistApiError extends BussinessWishlistApiState {
  final String? error;

  BussinessWishlistApiError({this.error});
}
