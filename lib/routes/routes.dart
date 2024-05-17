import '/exports/exports.dart';

class Routes {
  // routes definition
  static String splash = "/splash";
  static String onboard = "/onBoard";
  static String createAccount = "/createAccount";
  static String newPass = "/new-password";
  static String completeProfile = "/completeProfile";
  static String otp = "/verifyPhone";
  static String login = "/login";
  static String home = "/home";
  static String settings = "/settings";
  static String notifications = "/notifications";
  static String indexAuth = "/indexAuth";
  static String work = "/work-info";
  static String familyInfo = "/family-info";
  static String forgoPassword = "/forgot-password";
  // routes merger
  static Map<String, Widget Function(BuildContext context)> routes = {
    onboard: (context) => OnboardingScreen(),
    splash: (context) => SplashScreen(),
    indexAuth: (context) => const IndexAuthPage(),
    createAccount: (context) => const SignUp(),
    newPass: (context) => const SetPassword(),
    completeProfile: (context) => const UserProfile(),
    forgoPassword: (context) => const ForgotPassword(),
    login: (context) => const LoginScreen(),
    otp: (context) => const PhoneVerification(),
    work: (context) => const WorkInfo(),
    familyInfo: (context) => const FamilyInfo(),
    home: (context) => const IndexHome(),
    // settings: (context) => const GeneralSettings(),
  };
  // routes methods
  static void popPage() {
    Navigator.of(context).pop();
  }

  static void pushPage(String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void pushReplace(String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static void replacePage(Widget route) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => route, fullscreenDialog: true),
    );
  }

  static void removePage(String route) {
    Navigator.of(context).popAndPushNamed(route);
  }

  static void removeUntilPage(String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }

  static void animateToPage(Widget page, {type = 'fade'}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => type == 'slide'
            ? SlideTransition(
                position: animation.drive(Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(
                    curve: Curves.decelerate,
                  ),
                )),
                child: page,
              )
            : FadeTransition(
                opacity: animation,
                child: page,
              ),
      ),
    );
  }
}
