import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/pay_for_business_badge.dart';

abstract class PayForBusinessBadgeState {}

class PayForBusinessBadgeStateInitial extends PayForBusinessBadgeState {}

class PayForBusinessBadgeStateLoading extends PayForBusinessBadgeState {}

class PayForBusinessBadgeStateLoaded extends PayForBusinessBadgeState {}

class PayForBusinessBadgeStateError extends PayForBusinessBadgeState {
  final String? error;

  PayForBusinessBadgeStateError({required this.error});
}
