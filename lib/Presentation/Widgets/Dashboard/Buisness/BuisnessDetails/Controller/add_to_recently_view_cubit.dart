import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:meta/meta.dart';

part '../State/add_to_recently_view_state.dart';

class AddToRecentlyViewCubit extends Cubit<AddToRecentlyViewState> {
  AddToRecentlyViewCubit() : super(AddToRecentlyViewInitial());

  addToRecentlyViewed(String businessId) async {
    await Future.delayed(Duration.zero);
    emit(AddToRecentlyViewLoading());

    try {
      await AllBusiness.addToRecentlyView(businessId).then((value) {
        if (value['Success']) {
          print(value.toString());

          emit(AddToRecentlyViewLoaded());
        } else {
          emit(AddToRecentlyViewError(error: value['error']));
        }
      });
    } catch (e) {
      emit(AddToRecentlyViewError(error: e.toString()));
      rethrow;
    }
  }
}
