import 'dart:developer';

import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../State/business_wishlistapi_state.dart';

class BussinessWishlistApiCubit extends Cubit<BussinessWishlistApiState> {
  BussinessWishlistApiCubit() : super(BussinessWishlistApiInitial());

  checkBusinessInWishList(String businessId) async {
    await Future.delayed(Duration.zero);
    emit(BussinessWishlistApiLoading());

    print('Business WishlistApiCubit call');
    try {
      await AllBusiness.inWishlist(businessId).then((value) {
        if (value['Success']) {
          final bool inWishlist = value['body']['inWishlist'];

          print("wishListData$inWishlist");

          emit(BussinessWishlistApiLoaded(wishliatValue: inWishlist));
        } else {
          emit(BussinessWishlistApiError(error: value['error']));
        }
      });
    } catch (e) {
      emit(BussinessWishlistApiError(error: e.toString()));
      rethrow;
    }
  }

  addBusinessInWishList(String businessId, bool operation) async {
    await Future.delayed(Duration.zero);
    emit(BussinessWishlistApiLoading());
    try {
      await AllBusiness.wishlistCheck(businessId, operation).then((value) {
        if (value['Success']) {
          emit(BussinessWishlistApiInLoaded(wishliatValue: operation));
        } else {
          emit(BussinessWishlistApiError(error: value['error']));
        }
      });
    } catch (e) {
      emit(BussinessWishlistApiError(error: e.toString()));
      rethrow;
    }
  }
}
