import "/exports/exports.dart";

// global definition for build context
var navigatorKey = GlobalKey<NavigatorState>();
BuildContext context = navigatorKey.currentContext!;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Rendering the app in full screen mode.
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [],
  );
  // prevent app from changing to landscape
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
// styling to the top and bottom navigation bars in full screen mode.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black12,
    ),
  );
  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      theme: Themes.lightTheme,
      initialRoute:Routes.splash,
      routes:Routes.routes,
    ),
  );
}
