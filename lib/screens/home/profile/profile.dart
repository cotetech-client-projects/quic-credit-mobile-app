import 'package:auto_size_text/auto_size_text.dart';
import 'package:quic_credit/screens/home/profile/widgets/profile_card.dart';
import 'package:quic_credit/screens/home/settings/index_settings.dart';

import '/exports/exports.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constaints) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 48, 15, 1),
          child: Column(
            children: [
              const Space(
                space: 0.03,
              ),
              // profile image
              PhysicalModel(
                shape: BoxShape.circle,
                color: Colors.green.shade100,
                shadowColor: Colors.grey.shade100,
                elevation: 5,
                child: CircleAvatar(
                  radius: constaints.maxWidth * 0.28,
                  backgroundImage: const AssetImage(
                    "assets/imgs/interest.jpg",
                  ),
                ),
              ),
              const Space(
                space: 0.02,
              ),
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Mugamba Bruno",
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            fontWeightDelta: 10,
                          ),
                    ),
                    TextSpan(
                      text: "\n@bruno\n",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              // cards for user selection.
              ProfileCard(
                text: "App Settings",
                onTap: () =>
                    Routes.animateToPage(const IndexSettings(), type: 'slide'),
                icon: const Icon(
                  Icons.settings_outlined,
                ),
              ),
              const Space(
                space: 0.02,
              ),
              ProfileCard(
                text: "Privacy Policy",
                onTap: () {},
                icon: const Icon(Icons.privacy_tip_outlined),
              ),
              const Space(
                space: 0.02,
              ),
              ProfileCard(
                text: "Logout ",
                onTap: () {},
                icon: const Icon(
                  Icons.logout,
                ),
              ),
              const Space(
                space: 0.02,
              ),
              ProfileCard(
                text: "Exit App",
                onTap: () {
                  showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          title: const Text(
                            "Exit App",
                          ),
                          content: const Text(
                            "Are you sure you want to exit the app?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Routes.popPage(),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              child: Text(
                                "Exit",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      color: Colors.red,
                                    ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.exit_to_app,
                ),
              ),
              Text(
                "\nCopyright, All rights reserved.",
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        );
      },
    );
  }
}
