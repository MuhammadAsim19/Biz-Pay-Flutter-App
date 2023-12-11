import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/set_password.dart';
import 'package:meta/meta.dart';

part 'State/set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  SetPasswordCubit() : super(SetPasswordInitial());

  setPassword(String token, String password) async {
    try {
      emit(SetPasswordLoading());

      await SetPassword.setPassword(token: token, password: password)
          .then((value) {
        log(value.toString());

        if (value['Success'] == true) {
          emit(SetPasswordLoaded());
        } else {
          emit(SetPasswordError(error: value['error']));
        }
      }).catchError((e) {
        emit(SetPasswordError(error: 'Some Thing Wrong'));
      });
    } catch (e) {
      emit(SetPasswordError(error: e.toString()));
    }
  }
}
