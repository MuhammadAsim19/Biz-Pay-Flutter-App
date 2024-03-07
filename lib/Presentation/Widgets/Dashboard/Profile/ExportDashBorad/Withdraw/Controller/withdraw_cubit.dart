import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Repository/ConnectAccount/connect_account_repo.dart';
import 'package:buysellbiz/Domain/ConnectAccount/balance_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/State/withdraw_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  WithdrawCubit() : super(WithdrawInitialState());

  getBalance() async {
    await Future.delayed(Duration.zero);
    emit(WithdrawLoadingState());
    ConnectAccountRepo.showBalance().then(
      (value) {
        log(value.toString());
        if (value["Success"]) {
          emit(WithdrawLoadedState(
              balanceModel: BalanceModel.fromJson(value["body"])));
        } else {
          emit(WithdrawErrorState(error: value['error']));
        }
      },
    );
  }

  void triggerWithdraw({required String amount}) async {
    try {
      emit(WithdrawWithdrawProcessingState());
      ConnectAccountRepo.withdrawBalance(amount: amount).then(
        (value) {
          log(value.toString());
          if (value["Success"]) {
            emit(WithdrawWithdrawSuccessState());
          } else {
            emit(WithdrawErrorState(error: value['error']));
          }
        },
      );
    } catch (e) {
      emit(WithdrawErrorState(error: 'Error Happened, Please try again later'));
    }
  }
}
