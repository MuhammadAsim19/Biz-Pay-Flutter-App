import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/AppData/user_data.dart';
import 'package:buysellbiz/Data/DataSource/Repository/SocialRepo/socail_repo.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:meta/meta.dart';

part '../../State/social_login_state.dart';

class SocialLoginCubit extends Cubit<SocialLoginState> {
  SocialLoginCubit() : super(SocialLoginInitial());
  setDataOfSocialToServer(data) async {
    try {
      await Future.delayed(Duration.zero);
      emit(SocialLoginLoading());
      await SocialRepo
          .socialLogin(data)
          .then((value) async {
        log('value ${value["Success"]}');
        if (value["Success"] != null && value["Success"] == true) {
          //    print("here");
          // var  check= null;
          //print(jsonDecode(jsonEncode(value)));
          UserModel userData = UserModel.fromJson((value));

          await SharedPrefs.setUserLoginData(userRawData: value);
          //print("here3");
          emit(SocialLoginSuccess(data: userData));
        } else {
          emit(SocialLoginError(message: value['error']));
        }
      }).catchError((error) {
        //throw error;
        emit(SocialLoginError(message: error.toString()));
      });

    }
    catch(e)
    {
      //rethrow;
    }
  }
}
