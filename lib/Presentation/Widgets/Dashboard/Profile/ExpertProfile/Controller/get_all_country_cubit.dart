import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Brokers/get_country.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/all_business_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_country_state.dart';

class GetAllCountryCubit extends Cubit<GetAllCountryState> {
  GetAllCountryCubit() : super(GetAllCountryInitial());

  getCountry() async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(GetAllCountryLoading());

    try {
      await GetCountry.getCountryList().then((value) {
        if (value['Success']) {
          List<dynamic> list = value['body'];
          // print(list.toString());
          // List<BusinessModel> business =
          // List.from(value["body"].map((e) => BusinessModel.fromJson(e)));
          emit(GetAllCountryLoaded(country: list));
        } else {
          emit(GetAllCountryError(error: value['error']));
        }
      }).catchError((e) {
        emit(GetAllCountryError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(GetAllCountryError(error: e.toString()));
      rethrow;
    }
  }

  getCountryStates({String? countryName, String? state, bool? city}) async {
    await Future.delayed(const Duration(microseconds: 10));
    // emit(GetAllCountryLoading());

    try {
      await GetCountry.getCountryStates(countryName ?? "", state ?? "", city!)
          .then((value) {
        if (value['Success']) {
          print(value['body']);

          // List<BusinessModel> business =
          // List.from(value["body"].map((e) => BusinessModel.fromJson(e)));
          if (city == false) {
            emit(GetAllCountryStateLoaded(states: value['body']));
          } else {
            emit(GetAllCountryCityLoaded(city: value['body']));
          }
        } else {
          emit(CityAndStateError(error: value['error']));
        }
      }).catchError((e) {
        emit(CityAndStateError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(CityAndStateError(error: e.toString()));
      rethrow;
    }
  }
}
