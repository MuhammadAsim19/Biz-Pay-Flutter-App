class ApiConstant {
  //static String baseUrl = 'http://34.203.136.253';
  static  String baseUrl='http://192.168.1.2:8000';
  static String login = "$baseUrl/api/user/login";
  static String signUp = "$baseUrl/api/user/register";
  static String socialLoginUrl = '$baseUrl/api/user/continue_with_google';
  static String forgetEmail = '$baseUrl/api/user/forget_password/check_user';
  static String verifyOtp = '$baseUrl/api/user/forget_password/validate_otp';
}
