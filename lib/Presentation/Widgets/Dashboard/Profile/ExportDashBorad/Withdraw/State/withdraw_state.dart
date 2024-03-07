import 'package:buysellbiz/Domain/ConnectAccount/balance_model.dart';

abstract class WithdrawState {}

class WithdrawInitialState extends WithdrawState {}

//
class WithdrawLoadingState extends WithdrawState {}

class WithdrawLoadedState extends WithdrawState {
  final BalanceModel balanceModel;

  WithdrawLoadedState({required this.balanceModel});
}

//
class WithdrawWithdrawProcessingState extends WithdrawState {}

class WithdrawWithdrawSuccessState extends WithdrawState {}

//
class WithdrawErrorState extends WithdrawState {
  final String error;

  WithdrawErrorState({required this.error});
}
