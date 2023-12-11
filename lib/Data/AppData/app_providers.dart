import 'package:buysellbiz/Presentation/Widgets/Auth/Controller/SocialCubit/social_login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/set_password_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_email_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_otp_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/Controllers/login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> appProviders = [
  BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
  BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
  BlocProvider<SocialLoginCubit>(create: (context) => SocialLoginCubit()),
  BlocProvider<VerifyEmailCubit>(create: (context) => VerifyEmailCubit()),
  BlocProvider<VerifyOtpCubit>(create: (context) => VerifyOtpCubit()),
  BlocProvider<SetPasswordCubit>(create: (context) => SetPasswordCubit()),


];
