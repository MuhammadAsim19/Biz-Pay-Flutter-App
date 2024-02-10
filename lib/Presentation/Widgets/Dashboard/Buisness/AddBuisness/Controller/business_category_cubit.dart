import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'business_category_state.dart';

class BusinessCategoryCubit extends Cubit<BusinessCategoryState> {
  BusinessCategoryCubit() : super(BusinessCategoryInitial());

  getCategory() async {
    await Future.delayed(Duration.zero);

    emit(BusinessCategoryLoading());

    try {
      await AllBusiness.getBusinessCetegory().then((value) {
        if (value['Success']) {
          List<BusinessCategory> business =
              List.from(value["body"].map((e) => BusinessCategory.fromJson(e)));

          log(business.toString());

          emit(BusinessCategoryLoaded(list: business));
        } else {
          emit(BusinessCategoryError(error: value['error']));
        }
      }).catchError((e) {
        emit(BusinessCategoryError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(BusinessCategoryError(error: e.toString()));
      rethrow;
    }
  }
}
