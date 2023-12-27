class ApiConstant {
  static String baseUrl = 'http://192.168.1.14:9000';
  static String login = "$baseUrl/api/user/login";
  static String signUp = "$baseUrl/api/user/register";
  static String socialLoginUrl = '$baseUrl/api/user/continue_with_google';
  static String forgetEmail = '$baseUrl/api/user/forget_password/check_user';
  static String verifyOtp = '$baseUrl/api/user/forget_password/validate_otp';
  static String setPassword =
      '$baseUrl/api/user/forget_password/request_change_password';
  static String blockUser="$baseUrl/block_user";

  static String changePassword = '$baseUrl/api/user/changePassword';

  static String allCountry = '$baseUrl/countries';

  static String stateOfCountry = '$baseUrl/states';
  static String stateCity = '$baseUrl/cities';

  /// Business Apis
  static String getAllBusiness = "$baseUrl/api/business";
  static String getAllCateg = "$baseUrl/api/category/get_titles";

  static String catg = "$baseUrl/api/business/filterByCategory/";

  static String getAllBusinessDetails = "$baseUrl/api/business/details/";
  static String recentlyAddedBusiness = "$baseUrl/api/business/recently_added";
  static String category = "$baseUrl/api/category";
  static String brokerList = "$baseUrl/api/broker";
  static String switchTOBroker = "$baseUrl/api/broker/switch_to_broker";

  static String recentlyViewBusiness = "$baseUrl/api/user/get_recentlyViewed";

  static String addToRecentlyViewed = "$baseUrl/api/user/add_to_recentlyViewed";

  static String wishList = "$baseUrl/api/user/businesses_wishlist";
  static String addBusiness = "$baseUrl/api/business/create";
  static String checkBusinessesWishlist =
      "$baseUrl/api/user/check_businesses_wishlist";

  static String userBusiness = "$baseUrl/api/user/get/businessess";

  static String toggleWishlist = "$baseUrl/api/user/toggle_wishlist";

  static String customerSupport = "$baseUrl/api/user/needs_support";
  static String deleteAccount = "$baseUrl /api/user/delete_user";

  static String updateProfile = "$baseUrl/api/user/update_user/";
  static String privacyPolicy = "$baseUrl/api/privacy_and_terms";
}
