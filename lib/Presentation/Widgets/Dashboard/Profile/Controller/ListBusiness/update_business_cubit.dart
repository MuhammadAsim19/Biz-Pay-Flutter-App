import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:meta/meta.dart';

part 'update_business_state.dart';

class UpdateBusinessCubit extends Cubit<UpdateBusinessState> {
  UpdateBusinessCubit() : super(UpdateBusinessInitial());

  updateBusinessById(
      {Map<String, dynamic>? data, String? bsId, List<String?>? images}) async {
    await Future.delayed(Duration.zero);

    emit(UpdateBusinessLoading());

    print('cubit call');

    try {
      await AllBusiness.updateBusiness(
              body: data, businessId: bsId, images: images)
          .then((value) {
        log(value.toString());

        if (value['Success']) {
          emit(UpdateBusinessLoaded());
        } else {
          emit(UpdateBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(UpdateBusinessError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(UpdateBusinessError(error: e.toString()));
      rethrow;
    }
  }
}
