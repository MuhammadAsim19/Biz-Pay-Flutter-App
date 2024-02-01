import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/DataSource/Repository/UpdateProfile/update_profile.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  updateProfile({Map<String, dynamic>? body, String? image}) async {
    await Future.delayed(Duration.zero);
    emit(UpdateProfileLoading());
    try {
      await UpdateProfileRepo.updateProfile(body: body, images: image)
          .then((value) {
        log(value.toString());

        if (value['Success']) {
          UserModel userModel = UserModel().copyWith(
            user: User.fromJson(value['body']),
          );

          SharedPrefs.setUserLoginData(userRawData: userModel);
          SharedPrefs.getUserLoginData();
          AppInitializer.init();
          emit(UpdateProfileLoaded());
        } else {
          emit(UpdateProfileError(error: value['error']));
        }
      }).catchError((e) {
        emit(UpdateProfileError(error: "Some Thing Wrong"));
        throw e;
      });
    } catch (e) {
      emit(UpdateProfileError(error: e.toString()));
      rethrow;
    }
  }
}
