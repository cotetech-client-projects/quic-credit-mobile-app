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
  static String completeAuth = "$baseURL/personal-information";
  static String regions = "$baseURL/regions";
  static String education = "$baseURL/education-degrees";
  static String salaryFrequency = "$baseURL/salary-frequencies";
  static String maritalStatus = "$baseURL/marital-statuses";
  static String workStatus = "$baseURL/work-statuses";
  static String relationship = "$baseURL/relationships";
  static String emergencyContacts = "$baseURL/emergency-contacts";

  static String emergencyNumberTypes = "$baseURL/emergency-numbers";
}
