import '/exports/exports.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({super.key});

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invite Friends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0.0),
        child: Column(
          children: [
            SvgPicture.asset("assets/svgs/invite.svg"),
            AutoSizeText(
              'Invite your friends to QuicCredit and earn rewards',
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                    fontSizeDelta: 2,
                  ),
              textAlign: TextAlign.center,
              minFontSize: 20,
              maxFontSize: 22,
            ),
            const SizedBox(height: 20),
            CustomAnimatedWidget(
              child: CustomButton(
                onPress: () {},
                text: 'Invite Friends',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
