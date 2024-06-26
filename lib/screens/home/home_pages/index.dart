import 'package:quic_credit/screens/home/quick_links/loan_repay.dart';

import '/screens/home/home_pages/widgets/quic_links.dart';
import '/screens/home/quick_links/apply_loan.dart';
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
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      // backgroundColor: Theme.of(context).brightness == Brightness.light
      //     ? Colors.grey.shade200
      //     : Theme.of(context).scaffoldBackgroundColor,
      body: BottomTopMoveAnimationView(
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  // color: Theme.of(context).brightness == Brightness.light
                  //     ? Theme.of(context).primaryColor
                  //     : Colors.grey.shade800,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              // card to display summary of bills

              ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Space(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: AutoSizeText.rich(
                                TextSpan(
                                  children: [
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
                            const CustomAnimatedWidget(
                              child: Icon(
                                Icons.notifications,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin:
                          EdgeInsets.only(top: constraints.maxHeight * 0.091),
                      width: constraints.maxWidth * 0.88,
                      height: constraints.maxWidth * 0.25,
                      padding: const EdgeInsets.fromLTRB(12, 15, 10, 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade50
                            : Colors.black.withAlpha(230),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(
                                      fontWeightDelta: 1,
                                    ),
                                children: [
                                  TextSpan(
                                    text: "\nUGX 0.00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .apply(
                                          fontWeightDelta: 31,
                                          fontSizeDelta: 1,
                                        ),
                                  ),
                                ]),
                            textAlign: TextAlign.center,
                            maxFontSize: 30,
                            minFontSize: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Space(
                    space: .05,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                    child: Text(
                      "Quick Links",
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            fontWeightDelta: 61,
                            fontSizeDelta: 3,
                          ),
                    ),
                  ),
                  const Space(
                    space: .05,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                    child: LimitedBox(
                      maxHeight: constraints.maxHeight * 0.484,
                      maxWidth: double.infinity,
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1.3,
                        children: [
                          QuickLinkWidget(
                            height: constraints.maxHeight * 0.061,
                            color: Colors.green,
                            title: "Make loan Payment",
                            duration: const Duration(milliseconds: 4000),
                            svgPath: "loan.svg",
                            nextPage: const LoanRepay(),
                          ),
                          QuickLinkWidget(
                            duration: const Duration(milliseconds: 3000),
                            height: constraints.maxHeight * 0.061,
                            color: Theme.of(context).primaryColor,
                            title: "Apply for a Loan",
                            svgPath: "payment.svg",
                            nextPage: const ApplyLoan(),
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
      ),
    );
  }
}
