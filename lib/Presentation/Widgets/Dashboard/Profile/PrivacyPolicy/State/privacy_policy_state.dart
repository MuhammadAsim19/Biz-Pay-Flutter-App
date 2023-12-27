import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_model.dart';

abstract class PrivacyPolicyState {}

class PrivacyPolicyInitial extends PrivacyPolicyState {}

class PrivacyPolicyLoading extends PrivacyPolicyState {}

class PrivacyPolicyLoaded extends PrivacyPolicyState {
  final List<PrivacyPolicyModel>? privacyModel;

  PrivacyPolicyLoaded({this.privacyModel});
}

class PrivacyPolicyError extends PrivacyPolicyState {
  final String? error;

  PrivacyPolicyError({this.error});
}
