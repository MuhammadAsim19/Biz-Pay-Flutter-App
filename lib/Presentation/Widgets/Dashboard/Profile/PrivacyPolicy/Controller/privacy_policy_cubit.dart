import 'package:buysellbiz/Data/DataSource/Repository/PrivacyPolicy/privacy_policy_repo.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_model.dart';

import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/PrivacyPolicy/State/privacy_policy_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit() : super(PrivacyPolicyInitial());

  getPrivacyPolicyData() async {
    await Future.delayed(Duration.zero);
    emit(PrivacyPolicyLoading());

    try {
      await PrivacyPolicyRepo.privacyPolicyData().then((value) {
        print(value.toString());
        if (value['Success'] == true) {
          List<PrivacyPolicyModel> privacyModel = List.from(value['body']
                  ['policy']
              .map((e) => PrivacyPolicyModel.fromJson(e)));

          emit(PrivacyPolicyLoaded(privacyModel: privacyModel));
        } else {
          emit(PrivacyPolicyError(error: value['error']));
        }
      }).catchError((e) {
        emit(PrivacyPolicyError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(PrivacyPolicyError(error: e.toString()));
      rethrow;
    }
  }
}
