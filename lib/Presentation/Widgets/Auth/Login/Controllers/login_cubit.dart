import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/login_repo.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part '../State/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginUser({required Map<String, dynamic> body}) async {
    print('cubit call');

    await Future.delayed(const Duration(microseconds: 25));

    emit(LoginLoading());

    try {
      await LoginRepo().login(body: body).then((value) async {
        print('here is value$value');

        if (value['Success'] == true) {
          UserModel userData = UserModel.fromJson((value['body']));

          print(userData.toJson());

          await SharedPrefs.setUserLoginData(userRawData: userData);
          emit(LoginLoaded(userData: userData));
          if (userData.user?.otpModel?.isVerified == true) {
            SharedPrefs.setLoginToken(value['body']['token']);
          }
          // SharedPrefs.getUserLoginData();
        } else {
          print(value['error']);

          emit(LoginError(error: value['error']));
        }
      }).catchError((e) {
        emit(LoginError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(LoginError(error: e.toString()));
      rethrow;
    }
  }
}
