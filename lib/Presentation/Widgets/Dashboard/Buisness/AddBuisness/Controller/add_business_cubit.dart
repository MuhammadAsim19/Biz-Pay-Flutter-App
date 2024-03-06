import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/add_business.dart';
import 'package:meta/meta.dart';

part 'add_business_state.dart';

class AddBusinessCubit extends Cubit<AddBusinessState> {
  AddBusinessCubit() : super(AddBusinessInitial());

  addBusiness(
      {required Map<String, dynamic> body,
      List<String?>? images,
      List<String?>? files}) async {
    emit(AddBusinessLoading());

    try {
      await AddBusiness()
          .addBusiness(body: body, attachFiles: files, images: images)
          .then((value) {
        if (value['Success']) {
          log(value.toString());
          emit(AddBusinessLoaded(businessId: value['body']['_id']));
        } else {
          emit(AddBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(AddBusinessError(error: e.toString()));
        print(Future.error(e.toString()));
        throw e;
      });
    } catch (e) {
      emit(AddBusinessError(error: e.toString()));
      print(Future.error(e.toString()));
      rethrow;
    }
  }
}
