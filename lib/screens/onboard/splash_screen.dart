import 'dart:async';
import '/exports/exports.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 2.5, end: 3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.repeat(reverse: true);
    Future.delayed(const Duration(seconds: 3), () async {
      // String? tokenInvalid = await SessionService().getToken();
      // check if user is first time user
      StorageService().getData('firstTimeUser').then((value) {
        if (value == null) {
          StorageService().setData('firstTimeUser', true);
          Routes.pushReplace(Routes.onboard);
        } else {
          // if (tokenInvalid!.isEmpty) {
          Routes.pushReplace(Routes.login);
          // } else {
          //   // route to auth index
          //   Routes.pushReplace(Routes.home);
          // }
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Image.asset(
              "assets/pngs/icon.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const Space(space: 0.22),
          SpinKitDualRing(
            size: 35.0,
            color: Theme.of(context).primaryColor,
          ),
          const Space(space: 0.13),
          Text(
            "Powered by COTE Limited",
            style: Theme.of(context).textTheme.bodyLarge!.apply(
                  fontWeightDelta: 3,
                ),
          ),
          const Space(space: 0.052),
        ],
      ),
    );
  }
}
