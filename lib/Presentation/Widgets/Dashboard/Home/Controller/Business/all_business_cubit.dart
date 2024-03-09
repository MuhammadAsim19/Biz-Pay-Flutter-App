import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Application/Services/PaymentServices/payment_services.dart';
import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:meta/meta.dart';

part 'all_business_state.dart';

class AllBusinessCubit extends Cubit<AllBusinessState> {
  AllBusinessCubit() : super(AllBusinessInitial());

  getBusiness({String? id}) async {
    await Future.delayed(Duration.zero);

    emit(AllBusinessLoading());

    print('cubit call');

    try {
      await AllBusiness.getBusiness(id: id).then((value) {
        if (value['Success']) {
          log("here is value ${value.toString()}");

          List<BusinessModel> business =
              List.from(value["body"].map((e) => BusinessModel.fromJson(e)));
          emit(AllBusinessLoaded(business: business));
        } else {
          emit(AllBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(AllBusinessError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(AllBusinessError(error: e.toString()));
      rethrow;
    }
  }

  getByIdBusiness({String? id}) async {
    await Future.delayed(Duration.zero);

    emit(AllBusinessLoading());

    print('cubit call');

    try {
      await AllBusiness.getBusiness(id: id).then((value) {
        if (value['Success']) {
          log("here is value ${value.toString()}");
          BusinessModel model = BusinessModel.fromJson(value['body']);
          emit(BusinessByIdLoaded(business: model));
        } else {
          emit(AllBusinessError(error: value['error']));
        }
      }).catchError((e) {
        emit(AllBusinessError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(AllBusinessError(error: e.toString()));
      rethrow;
    }
  }
}
