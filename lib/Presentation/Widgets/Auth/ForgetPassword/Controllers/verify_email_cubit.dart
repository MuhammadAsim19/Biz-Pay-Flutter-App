import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/forget_email.dart';
import 'package:meta/meta.dart';

part 'State/verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitial());

  verifyEmail({required String email, bool? loading}) async {
    await Future.delayed(const Duration(microseconds: 20));

    if (loading == null) {
      emit(VerifyEmailLoading());
    }

    try {
      await ForgetEmail.forgetEmail(email: email).then((value) {
        log(value.toString());

        if (value['Success'] == true) {
          print(value['body']['id']);
          emit(
              VerifyEmailLoaded(userId: value['body']['id'], loading: loading));
        } else {
          emit(VerifyEmailError(error: value['error']));
        }
      }).catchError((e) {
        emit(VerifyEmailError(error: "Some Thing Wrong"));
        throw e;
      });
    } catch (e) {
      emit(VerifyEmailError(error: e.toString()));
      rethrow;
    }
  }
}
