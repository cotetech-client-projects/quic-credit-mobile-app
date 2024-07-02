import 'package:quic_credit/screens/home/notifications/notifications_page.dart';
import 'package:quic_credit/screens/home/profile/contact_us.dart';
import 'package:quic_credit/screens/home/profile/faqs_page.dart';

import '../settings/invite_page.dart';
import '/screens/home/profile/widgets/profile_card.dart';
import '/screens/home/settings/index_settings.dart';
import '/exports/exports.dart';
import 'privacy_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 1),
            child: SingleChildScrollView(
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
                      radius: constraints.maxWidth * 0.18,
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
                    onTap: () => Routes.animateToPage(const IndexSettings(),
                        type: 'slide'),
                    icon: const Icon(
                      Icons.settings_outlined,
                    ),
                  ),
                  const Space(
                    space: 0.02,
                  ),
                  ProfileCard(
                    text: "Notifications",
                    onTap: () => Routes.animateToPage(
                      const NotificationsPage(),
                    ),
                    icon: const Icon(Icons.message_outlined),
                  ),
                  const Space(
                    space: 0.02,
                  ),
                  ProfileCard(
                    text: "Privacy Policy",
                    onTap: () => Routes.animateToPage(
                      const PrivacyPage(),
                    ),
                    icon: const Icon(Icons.privacy_tip_outlined),
                  ),
                  const Space(
                    space: 0.02,
                  ),
                  ProfileCard(
                    text: "FAQs",
                    onTap: () => Routes.animateToPage(
                      const FaqsPage(),
                    ),
                    icon: const Icon(
                      Icons.question_answer_outlined,
                    ),
                  ),
                  const Space(
                    space: 0.02,
                  ),
                  // ProfileCard(
                  //   text: "Contact us",
                  //   onTap: () => Routes.animateToPage(
                  //     const ContactUs(),
                  //   ),
                  //   icon: const Icon(
                  //     Icons.contact_support_outlined,
                  //   ),
                  // ),
                  // const Space(
                  //   space: 0.02,
                  // ),

                  ProfileCard(
                    text: "Logout ",
                    onTap: () {
                      showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog.adaptive(
                              title: const Text(
                                "Logout",
                              ),
                              content: const Text(
                                "You're about to logout.",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Routes.popPage(),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Routes.pushReplace(Routes.login);
                                  },
                                  child: Text(
                                    "Logout",
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
                      Icons.logout,
                    ),
                  ),
                  const Space(
                    space: 0.02,
                  ),

                  Text(
                    "\nCopyright, All rights reserved.",
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
