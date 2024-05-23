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
      statusBarColor: Colors.black38,
      systemNavigationBarColor: Colors.black45,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
      ],
      child: Consumer<ThemeController>(builder: (context, controller, co) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          themeMode: controller.themeMode,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          initialRoute: Routes.splash,
          routes: Routes.routes,
        );
      }),
    ),
  );
}
