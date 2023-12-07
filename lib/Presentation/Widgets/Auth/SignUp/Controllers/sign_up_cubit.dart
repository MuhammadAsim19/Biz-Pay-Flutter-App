import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/Repository/Auth/sign_up_repo.dart';
import 'package:meta/meta.dart';

part '../State/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  createUser({required Map<String, dynamic> body}) async {
    await Future.delayed(const Duration(milliseconds: 25));

    emit(SignUpLoading());

    try {
      await SignUpRepo.signUp(body: body).then((value) {
        if (value['Success'] == true) {
          emit(SignUpLoaded());
        } else {
          emit(SignUpError(error: value['error']));
        }
      }).catchError((e) {
        emit(SignUpError(error: 'Some Thing Wrong'));
      });
    } catch (e) {
      emit(SignUpError(error: e.toString()));
    }
  }
}
