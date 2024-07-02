import '/exports/exports.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space(),
            AutoSizeText(
              "QuicCredit Privacy Policy",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 10,
                  ),
            ),
            const Space(),
            AutoSizeText(
              "QuicCredit is a mobile loan application that allows you to access loans instantly.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Space(),
            AutoSizeText(
              "To apply for a loan, you need to download the QuicCredit app from the Google Play Store, create an account, and apply for a loan.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Space(),
            AutoSizeText(
              "You can repay your loan through the QuicCredit app using mobile money.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Space(),
            AutoSizeText(
              "You can contact QuicCredit through the app or by sending an email to QuicCredit",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
