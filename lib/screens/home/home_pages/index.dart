import 'package:quic_credit/screens/home/home_pages/widgets/quic_links.dart';

import '/exports/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade200
          : Theme.of(context).scaffoldBackgroundColor,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade800,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            // card to display summary of bills

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Space(space: 0.080),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                //🌙
                                text: "☀️",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(
                                      fontWeightDelta: 1,
                                      fontSizeDelta: 20,
                                      color: Colors.white,
                                    ),
                              ),
                              TextSpan(
                                text: "\nWelcome, Bruno",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(
                                      fontWeightDelta: 28,
                                      fontSizeDelta: 3,
                                      color: Colors.white,
                                    ),
                              ),
                              TextSpan(
                                text: "\nYou have no current loan.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                      fontWeightDelta: 1,
                                      fontSizeDelta: 3,
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: constraints.maxWidth * 0.01),
                    width: constraints.maxWidth * 0.88,
                    height: constraints.maxWidth * 0.35,
                    padding: const EdgeInsets.fromLTRB(12, 15, 10, 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade50
                          : Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(-0, 2),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey.shade300
                                  : Colors.white30,
                          blurRadius: 10,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                              text: "Current Loan",
                              style:
                                  Theme.of(context).textTheme.titleLarge!.apply(
                                        fontWeightDelta: 1,
                                      ),
                              children: [
                                TextSpan(
                                  text: "\nUGX 0.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .apply(
                                        fontWeightDelta: 31,
                                        fontSizeDelta: 3,
                                      ),
                                ),
                              ]),
                          textAlign: TextAlign.center,
                          maxFontSize: 40,
                          minFontSize: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                  child: Text(
                    "Quick Links",
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          fontWeightDelta: 61,
                          fontSizeDelta: 5,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: LimitedBox(
                    maxHeight: constraints.maxHeight * 0.42,
                    maxWidth: double.infinity,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 1.3,
                      children: [
                        QuickLinkWidget(
                          height: constraints.maxHeight * 0.061,
                          color: Colors.red,
                          title: "Loan Breakdown",
                          svgPath: "loan.svg",
                        ),
                        QuickLinkWidget(
                          height: constraints.maxHeight * 0.061,
                          color: Colors.green,
                          title: "Make loan Payment",
                          svgPath: "payment.svg",
                        ),
                        QuickLinkWidget(
                          height: constraints.maxHeight * 0.061,
                          color: Theme.of(context).colorScheme.primary,
                          title: "Apply for a Loan",
                          svgPath: "payment.svg",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
