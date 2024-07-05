class Apis {
  static String baseURL = "https://quic-credit.fantastopia.com/api";
  // auth routes
  static String login = "$baseURL/login";
  static String register = "$baseURL/register";
  static String verify = "${baseURL}auth/users/activation/";
  static String resendActivation = "${baseURL}auth/users/resend_activation/";
  static String resetPassword = "${baseURL}auth/users/reset_password/";
  static String resetPasswordConfirm =
      "${baseURL}auth/users/reset_password_confirm/";

  static String logout = "$baseURL/logout";
}
