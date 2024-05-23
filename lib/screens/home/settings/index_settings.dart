import 'package:quic_credit/screens/home/settings/theme_widget.dart';

import '/exports/exports.dart';

class IndexSettings extends StatefulWidget {
  const IndexSettings({super.key});

  @override
  State<IndexSettings> createState() => _IndexSettingsState();
}

class _IndexSettingsState extends State<IndexSettings>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App Settings",
        ),
      ),
      // ignore: prefer_const_constructors
      body: Consumer<ThemeController>(builder: (context, controller, c) {
        return Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ListTile(
              leading: Icon(
                Icons.color_lens,
              ),
              title: Text(
                "App Theme",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(controller.themeMode == ThemeMode.system
                  ? "System Mode"
                  : controller.themeMode == ThemeMode.light
                      ? "Light Mode"
                      : "Dark Mode"),
              onTap: () {
                showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    transitionAnimationController: animationController,
                    builder: (context) {
                      return BottomSheet(
                          onClosing: () {},
                          builder: (context) {
                            return const ThemeWidget();
                          });
                    });
              },
            ),
            const ListTile(
              leading: Icon(
                Icons.notifications,
              ),
              title: Text("Notifications"),
              // onTap: () => Routes.pushPage(const Notifications()),
            ),
          ],
        );
      }),
    );
  }
}
