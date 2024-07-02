class Apis {
  static String baseURL = "http://94.72.116.178:8000/";
  // auth routes
  static String login = "${baseURL}auth/jwt/create/";
  static String register = "${baseURL}auth/users/";
  static String verify = "${baseURL}auth/users/activation/";
  static String resendActivation = "${baseURL}auth/users/resend_activation/";
  static String resetPassword = "${baseURL}auth/users/reset_password/";
  static String resetPasswordConfirm =
      "${baseURL}auth/users/reset_password_confirm/";
}
