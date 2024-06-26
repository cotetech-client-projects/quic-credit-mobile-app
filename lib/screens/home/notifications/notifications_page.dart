import '/exports/exports.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomAnimatedWidget(
              child: SvgPicture.asset(
                "assets/svgs/notifications.svg",
                width: 300,
                height: 300,
              ),
            ),
          ),
          Text(
            "No notifications",
            style: Theme.of(context).textTheme.titleLarge!.apply(
                  fontWeightDelta: 10,
                  fontSizeFactor: 1.12,
                ),
          )
        ],
      ),
    );
  }
}
