import 'package:buysellbiz/Presentation/Widgets/Auth/Login/Controllers/login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> appProviders = [
  BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
  BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),


];
