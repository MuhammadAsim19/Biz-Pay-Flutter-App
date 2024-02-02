import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Auth/verify_otp.dart';
import 'package:meta/meta.dart';

part 'State/verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpInitial());

  verify(String otp, String userId, bool isFromSignup, {bool? loading}) async {
    print(userId);

    emit(VerifyOtpLoading());
    try {
      await VerifyOtp.verifyOtp(
              otp: otp, userID: userId, isFromSignUp: isFromSignup)
          .then((value) async {
        if (value['Success'] == true) {
          emit(VerifyOtpLoaded(otpToken: value['body']['resetPasswordToken']));
          await SharedPrefs.setLoginToken(value['body']['token'] ?? "");
        } else {
          emit(VerifyOtpError(error: value['error']));
        }
      }).catchError((e) {
        emit(VerifyOtpError(error: 'Some Thing Wrong'));
      });
    } catch (e) {
      emit(VerifyOtpError(error: e.toString()));
    }
  }
}
