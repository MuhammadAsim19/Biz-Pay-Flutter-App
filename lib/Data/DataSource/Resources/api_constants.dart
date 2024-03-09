class ApiConstant {
  static String baseurl = 'http://192.168.1.17:8000';

  // static String baseurl = 'http://54.145.216.241:8000'; // Aws Urls
  static String login = "$baseurl/api/user/login";
  static String signUp = "$baseurl/api/user/register";
  static String agreeToPrivacy =
      "$baseurl/api/privacy_and_terms/agree_to_policy";
  static String socketBase = "54.145.216.241:8000";
  static String socialLoginUrl = '$baseurl/api/user/continue_with_google';
  static String forgetEmail = '$baseurl/api/user/forget_password/check_user';
  static String verifyOtp = '$baseurl/api/user/forget_password/validate_otp';
  static String registerVerifyOtp = '$baseurl/api/user/register/verify_otp';
  static String setPassword =
      '$baseurl/api/user/forget_password/request_change_password';
  static String blockUser = "$baseurl/block_user";
  static String createBusinessChatUrl = "$baseurl/createBusinessConversation";
  static String createBrokerChatUrl = "$baseurl/createBrokerConversation";

  // static String blockUser = "$baseUrl/block_user";
  // static String createBusinessUrl = "$baseUrl/createBusinessConversation";
  static String changePassword = '$baseurl/api/user/changePassword';
  static String allCountry = '$baseurl/countries';
  static String stateOfCountry = '$baseurl/states';
  static String stateCity = '$baseurl/cities';

  /// Business Apis
  static String getAllBusiness = "$baseurl/api/business";
  static String getBusinessById = "$baseurl/api/business/details";
  static String getAllCateg = "$baseurl/api/category/get_titles";
  static String catg = "$baseurl/api/business/filterByCategory/";
  static String recentlyAddedBusiness = "$baseurl/api/business/recently_added";
  static String category = "$baseurl/api/category";
  static String brokerList = "$baseurl/api/broker";
  static String brokerById = "$baseurl/api/broker/info";
  static String switchTOBroker = "$baseurl/api/broker/switch_to_broker";
  static String recentlyViewBusiness = "$baseurl/api/user/get_recentlyViewed";
  static String addToRecentlyViewed = "$baseurl/api/user/add_to_recentlyViewed";
  static String wishList = "$baseurl/api/user/businesses_wishlist";
  static String addBusiness = "$baseurl/api/business/create";
  static String checkBusinessesWishlist =
      "$baseurl/api/user/check_businesses_wishlist";
  static String userBusiness = "$baseurl/api/user/get/businessess";
  static String toggleWishlist = "$baseurl/api/user/toggle_wishlist";
  static String customerSupport = "$baseurl/api/user/needs_support";
  static String deleteAccount = "$baseurl /api/user/delete_user";
  static String updateProfile = "$baseurl/api/user/update_user/";
  static String privacyPolicy = "$baseurl/api/privacy_and_terms";
  static String getAllNotification = "$baseurl/api/user/getAllNotification";
  static String categoryBusiness = "$baseurl/api/business/filterByCategory";
  static String readNotification = "$baseurl/api/user/readNotification";
  static String updateBusiness = "$baseurl/api/business/update";
  static String deleteBusiness = "$baseurl/api/business/delete";
  static String allBadges = "$baseurl/api/broker/badge/all";
  static String allPackages = "$baseurl/api/broker/packages/all";
  static String verifyPayment = "$baseurl/api/broker/verify_payment";
  static String allBoostPackages = "$baseurl/api/user/businessBoost/plans";
  static String activateBoost = "$baseurl/api/user/businessBoost/activate";
  static String verifyBoostPayment =
      "$baseurl/api/user/businessBoost/verifyPayment";
  static String getExportFormBadges = "$baseurl/api/broker/filterByBadge/";
  static String sendBadgeRequest = "$baseurl/api/user/requestABadge";
  static String badgePaymentVerify =
      "$baseurl/api/broker/badgeRequests/verifyPayment";
  static String getBrokerBadgeRequest = "$baseurl/api/broker/badgeRequests/all";
  static String getExpertOnboarding = "$baseurl/api/broker/payment/setup";
  static String expertBalance = "$baseurl/api/broker/payment/showWallet";
  static String verifyOnboarding = "$baseurl/api/broker/payment/verifyStatus";
  static String withdrawBalance = "$baseurl/api/broker/payment/withdraw";
  static String getUserBadgeRequest = "$baseurl/api/user/badgeRequests/all";
  static String addBadgeDelivery = "$baseurl/api/broker/badgeRequests/deliver";
  static String acceptRejectDelivery = "$baseurl/api/user/badgeRequests/";
  static String requestBadgeView = "$baseurl/api/user/badgeRequests/viewBadge";
  static String verifyBadgeviewPayment =
      "$baseurl/api/user/badgeRequests/viewBadge/verifyPayment";
  static String viewBusinessBudge = "$baseurl/api/business/viewBadge/";
}
