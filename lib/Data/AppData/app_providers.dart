import 'package:buysellbiz/Presentation/Widgets/Auth/Controller/SocialCubit/social_login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/set_password_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_email_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_otp_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/Controllers/login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/sign_up_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Brokers/brokers_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Business/all_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/OnlineBusiness/online_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/RecentlyAdded/recently_added_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Categories/category_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/RecentlyView/recently_viewed_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/Controller/saved_listing_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> appProviders = [
  BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
  BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
  BlocProvider<SocialLoginCubit>(create: (context) => SocialLoginCubit()),
  BlocProvider<VerifyEmailCubit>(create: (context) => VerifyEmailCubit()),
  BlocProvider<VerifyOtpCubit>(create: (context) => VerifyOtpCubit()),
  BlocProvider<SetPasswordCubit>(create: (context) => SetPasswordCubit()),
  BlocProvider<AllBusinessCubit>(create: (context) => AllBusinessCubit()),
  BlocProvider<RecentlyAddedCubit>(create: (context) => RecentlyAddedCubit()),
  BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
  BlocProvider<RecentlyViewedCubit>(create: (context) => RecentlyViewedCubit()),
  BlocProvider<OnlineBusinessCubit>(create: (context) => OnlineBusinessCubit()),
  BlocProvider<BrokersCubit>(create: (context) => BrokersCubit()),
  BlocProvider<SavedListingCubit>(create: (context) => SavedListingCubit()),
  BlocProvider<AddBusinessCubit>(create: (context) => AddBusinessCubit()),
];
