class ApiConstant {
  //static String baseUrl = 'http://34.203.136.253';

  static String baseUrl = 'http://192.168.1.17:9000';
  static String login = "$baseUrl/api/user/login";
  static String signUp = "$baseUrl/api/user/register";
  static String socialLoginUrl = '$baseUrl/api/user/continue_with_google';
  static String forgetEmail = '$baseUrl/api/user/forget_password/check_user';
  static String verifyOtp = '$baseUrl/api/user/forget_password/validate_otp';
  static String setPassword =
      '$baseUrl/api/user/forget_password/request_change_password';

  /// Business Apis
  static String getAllBusiness = "$baseUrl/api/business";
  static String catg = "$baseUrl/api/business/filterByCategory/";

  static String getAllBusinessDetails = "$baseUrl/api/business/details/";
  static String recentlyAddedBusiness = "$baseUrl/api/business/recently_added";
  static String category = "$baseUrl/api/category";
  static String brokerList = "$baseUrl/api/broker";

  static String recentlyViewBusiness = "$baseUrl/api/user/get_recentlyViewed";
}
