import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/delete_account.dart';
import 'package:meta/meta.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  deleteAccount() async {
    await Future.delayed(Duration.zero);
log("change");
    emit(DeleteAccountLoading());

    try {
      await DeleteAccountRepo.deleteAccount().then((value) {
        if (value['Success']) {
          emit(DeleteAccountLoaded());
        } else {
          emit(DeleteAccountError(error: value['error']));
        }
      }).catchError((e) {
        emit(DeleteAccountError(error: 'Some Thing Wrong'));
      });
    } catch (e) {
      emit(DeleteAccountError(error: e.toString()));
    }
  }
}
