import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../State/business_detail_state.dart';

class BussinessWishlistApiCubit extends Cubit<BussinessWishlistApiState> {
  BussinessWishlistApiCubit() : super(BussinessWishlistApiInitial());

  Future<void> bussinessWishlistApi(String businessId) async {
    await Future.delayed(Duration.zero);
    emit(BussinessWishlistApiLoading());

    print('BussinessWishlistApiCubit call');
    try {
      final value = await AllBusiness.inWishlist(businessId);

      if (value['Success']) {
        final bool inWishlist = value['body']['inWishlist'];

        emit(BussinessWishlistApiLoaded(wishliatValue: inWishlist));
      } else {
        emit(BussinessWishlistApiError(error: value['error']));
      }
    } catch (e) {
      emit(BussinessWishlistApiError(error: e.toString()));
      rethrow;
    }
  }
}
