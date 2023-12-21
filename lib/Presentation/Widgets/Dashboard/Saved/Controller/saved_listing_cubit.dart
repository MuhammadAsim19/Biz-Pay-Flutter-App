import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/WishlistRepo/wishlist_repo.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Domain/WishList/wishlist_model.dart';
import 'package:meta/meta.dart';

part 'saved_listing_state.dart';

class SavedListingCubit extends Cubit<SavedListingState> {
  SavedListingCubit() : super(SavedListingInitial());

  getWishlistData() async {
    await Future.delayed(Duration.zero);

    emit(SavedListingLoading());

    print('cubit call');

    try {
      await WishlistRepo.wishlistData().then((value) {
        print(value.toString());
        if (value['Success'] == true) {
          List<WishList> wishList = List.from(
              value['body']['wishList'].map((e) => WishList.fromJson(e)));

          emit(SavedListingLoaded(wishList: wishList));
        } else {
          emit(SavedListingError(error: value['error']));
        }
      }).catchError((e) {
        emit(SavedListingError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(SavedListingError(error: e.toString()));
      rethrow;
    }
  }
}
