import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/sign_up_repo.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:meta/meta.dart';

part '../State/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  createUser({required Map<String, dynamic> body}) async {
    await Future.delayed(const Duration(milliseconds: 25));

    emit(SignUpLoading());

    try {
      await SignUpRepo.signUp(body: body).then((value) async {
        if (value['Success'] == true) {
          UserModel userData = UserModel.fromJson((value['body']));

          await SharedPrefs.setUserLoginData(userRawData: userData);
          await SharedPrefs.setLoginToken(value['body']['token']);
          emit(SignUpLoaded(userModel: userData));
        } else {
          emit(SignUpError(error: value['error']));
        }
      }).catchError((e) {
        emit(SignUpError(error: 'Some Thing Wrong'));
        throw e;
      });
    } catch (e) {
      emit(SignUpError(error: e.toString()));
      rethrow;
    }
  }
}
