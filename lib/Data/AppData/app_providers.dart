import 'package:buysellbiz/Presentation/Widgets/Auth/Controller/SocialCubit/social_login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/set_password_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_email_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/ForgetPassword/Controllers/verify_otp_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/Login/Controllers/login_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Controllers/sign_up_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/AllBadges/Controller/all_badges_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/SendBadgeRequest/Controller/send_badge_request_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/ShowExpertProfiles/Controller/show_experts_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/business_category_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BoostBusiness/Controller/business_boost_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/add_to_recently_view_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/bussiness_wishlist_api_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Category/Controller/category_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Brokers/broker_by_id_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Brokers/brokers_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Business/all_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/OnlineBusiness/online_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/RecentlyAdded/recently_added_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Categories/category_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/RecentlyView/recently_viewed_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Controller/read_notification_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ChangePassword/change_password_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/CustomerSupport/customer_support_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ListBusiness/update_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ListBusiness/your_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/UpdateProfile/update_profile_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/DeleteAccount/delete_account_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/broker_profile_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/get_all_country_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/BadgesRequests/Controller/get_all_badges_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/PrivacyPolicy/Controller/privacy_policy_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/DeleteBusiness/Controller/delete_business_cubit.dart';
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
  BlocProvider<BussinessWishlistApiCubit>(
      create: (context) => BussinessWishlistApiCubit()),
  BlocProvider<BusinessCategoryCubit>(
      create: (context) => BusinessCategoryCubit()),
  BlocProvider<BrokerProfileCubit>(create: (context) => BrokerProfileCubit()),
  BlocProvider<GetAllCountryCubit>(create: (context) => GetAllCountryCubit()),
  BlocProvider<PrivacyPolicyCubit>(create: (context) => PrivacyPolicyCubit()),
  BlocProvider<YourBusinessCubit>(create: (context) => YourBusinessCubit()),
  BlocProvider<AddToRecentlyViewCubit>(
      create: (context) => AddToRecentlyViewCubit()),
  BlocProvider<ChangePasswordCubit>(create: (context) => ChangePasswordCubit()),
  BlocProvider<NotificationCubit>(create: (context) => NotificationCubit()),
  BlocProvider<CustomerSupportCubit>(
      create: (context) => CustomerSupportCubit()),
  BlocProvider<UpdateProfileCubit>(create: (context) => UpdateProfileCubit()),
  BlocProvider<DeleteAccountCubit>(create: (context) => DeleteAccountCubit()),
  BlocProvider<CategoryBusinessCubit>(
      create: (context) => CategoryBusinessCubit()),
  BlocProvider<ReadNotificationCubit>(
      create: (context) => ReadNotificationCubit()),
  BlocProvider<UpdateBusinessCubit>(create: (context) => UpdateBusinessCubit()),
  BlocProvider<BrokerByIdCubit>(create: (context) => BrokerByIdCubit()),
  BlocProvider<UpdateBusinessCubit>(create: (context) => UpdateBusinessCubit()),
  BlocProvider<DeleteBusinessCubit>(create: (context) => DeleteBusinessCubit()),
  // BlocProvider<AppBudgesCubit>(create: (context) => AppBudgesCubit()),
  BlocProvider<AllBadgesCubit>(create: (context) => AllBadgesCubit()),
  BlocProvider<BusinessBoostCubit>(create: (context) => BusinessBoostCubit()),
  BlocProvider<ShowExpertsCubit>(create: (context) => ShowExpertsCubit()),
  BlocProvider<SendBadgeRequestCubit>(
      create: (context) => SendBadgeRequestCubit()),
  BlocProvider<GetAllBadgesCubit>(create: (context) => GetAllBadgesCubit()),
];
