import '/screens/home/activity/index_activity.dart';
import '/screens/home/home_pages/index.dart';
import '/screens/home/profile/profile.dart';

import '/exports/exports.dart';

class IndexHome extends StatefulWidget {
  const IndexHome({super.key});

  @override
  State<IndexHome> createState() => _IndexHomeState();
}

class _IndexHomeState extends State<IndexHome> {
  final pageController = PageController(initialPage: 1);
  List<Widget> pages = [
    const IndexActivity(),
    const HomePage(),
    const ProfilePage()
  ];
  int initiatePage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: SafeArea(
          child: GNav(
            gap: 10,
            // activeColor: const Color.fromARGB(255, 0, 0, 0),
            iconSize: 30,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            duration: const Duration(milliseconds: 100),
            tabBackgroundColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor.withAlpha(40)
                : Colors.white24,
            color: Colors.grey.shade400,
            textStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorDark,
                  fontWeightDelta: 5,
                ),
            tabActiveBorder: Border.all(
              color: Theme.of(context).primaryColor.withAlpha(40),
              width: 1.3,
            ), // tab button border

            curve: Curves.easeOutExpo, // tab animation curves
            tabs: [
              GButton(
                icon: Icons.timelapse,
                text: 'Transactions',
                iconActiveColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
              ),
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                iconActiveColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profile',
                iconActiveColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
              ),
            ],
            selectedIndex: initiatePage,
            onTabChange: (index) {
              setState(() {
                initiatePage = index;
              });
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear);
            },
          ),
        ),
      ),
    );
  }
}
