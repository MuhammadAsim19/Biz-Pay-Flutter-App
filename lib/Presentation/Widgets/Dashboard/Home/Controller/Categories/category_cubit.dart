import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Category/category.dart';
import 'package:buysellbiz/Domain/Category/categroy.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  getCategory() async {
    await Future.delayed(Duration.zero);

    emit(CategoryLoading());

    print('cubit call');

    try {
      await CategoryRepo.getCategory().then((value) {
        log(value.toString());
        if (value['Success']) {
          List<Category> cate =
              List.from(value["body"].map((e) => Category.fromJson(e)));
          emit(CategoryLoaded(model: cate));
        } else {
          emit(CategoryError(error: value['error']));
        }
      }).catchError((e) {
        emit(CategoryError(error: e.toString()));
      });
    } catch (e) {
      emit(CategoryError(error: e.toString()));
      rethrow;
    }
  }
}
