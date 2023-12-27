import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Category/categoury_business.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'category_business_state.dart';

class CategoryBusinessCubit extends Cubit<CategoryBusinessState> {
  CategoryBusinessCubit() : super(CategoryBusinessInitial());

  getCategoryBusiness(String catId) async {
    await Future.delayed(Duration.zero);

    emit(CategoryBusinessLoading());

    print('cubit call');

    try {
      await CategoryBusiness.getCategoryBusiness(catId).then((value) {
        log(value.toString());
        if (value['Success']) {
          List<BusinessModel> business = List.from(
              value["body"]['result'].map((e) => BusinessModel.fromJson(e)));
          emit(CategoryBusinessLoaded(business: business));
        } else {
          emit(CategoryBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(CategoryBusinessError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      emit(CategoryBusinessError(error: e.toString()));
      rethrow;
    }
  }
}
