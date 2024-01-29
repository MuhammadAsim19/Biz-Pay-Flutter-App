import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/ChangePassword/change_password.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  changePassword(Map<String, dynamic> body) async {
    await Future.delayed(Duration.zero);
    emit(ChangePasswordLoading());

    try {
      await ChangePassword().changePassword(body).then((value) {
        log(value.toString());

        if (value['Success']) {
          print(value.toString());

          emit(ChangePasswordLoaded());
        } else {
          emit(ChangePasswordError(error: value['error']));
        }
      }).catchError((e) {
        emit(ChangePasswordError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(ChangePasswordError(error: e.toString()));
      print(Future.error(e));
      rethrow;
    }
  }
}
