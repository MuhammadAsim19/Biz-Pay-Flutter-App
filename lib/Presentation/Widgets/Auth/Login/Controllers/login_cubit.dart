import 'package:buysellbiz/Data/DataSource/Repository/Auth/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part '../State/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginUser({required Map<String, dynamic> body}) async {
    print('cubit calll');

    await Future.delayed(const Duration(microseconds: 25));

    emit(LoginLoading());

    try {
      await LoginRepo().login(body: body).then((value) {
        print('here is value$value');

        if (value['Success'] == true) {
          emit(LoginLoaded());
        } else {
          print(value['error']);

          emit(LoginError(error: value['error']));
        }
      }).catchError((e) {
        emit(LoginError(error: 'Some Thing Wrong'));
      });
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}
