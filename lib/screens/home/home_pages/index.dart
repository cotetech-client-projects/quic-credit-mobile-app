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
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).primaryColor.withOpacity(0.01),
                    Theme.of(context).primaryColor.withOpacity(0.0),
                  ],
                  // stops: const [0.0, 0.7],
                ),
                // borderRadius: const BorderRadius.only(
                //   bottomLeft: Radius.circular(25),
                //   bottomRight: Radius.circular(25),
                // ),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "QuicCredit",
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
                                text: "\nGet a loan within 5minutes.",
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
                    margin: EdgeInsets.only(top: constraints.maxHeight * 0.021),
                    width: constraints.maxWidth * 0.88,
                    height: constraints.maxWidth * 0.45,
                    // padding: const EdgeInsets.fromLTRB(12, 15, 10, 10),
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
                              text: "Maximum Loan Amount",
                              style:
                                  Theme.of(context).textTheme.titleLarge!.apply(
                                        fontWeightDelta: 1,
                                      ),
                              children: [
                                TextSpan(
                                  text: "\nUGX 1,000,000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(
                                        fontSizeFactor: 1.2,
                                        fontWeightDelta: 100,
                                        fontSizeDelta: 3,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 15, 18, 0),
                  child: Text(
                    "Quick Links",
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          fontWeightDelta: 61,
                          fontSizeDelta: 3,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 15, 18, 0),
                  child: LimitedBox(
                    maxHeight: constraints.maxHeight * 0.24,
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
                          duration: const Duration(milliseconds: 3000),
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
                InkWell(
                  onTap: () {
                    Routes.pushPage(Routes.completeProfile);
                  },
                  child: Card(
                    elevation: 0,
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "QuicCredit is operated by QuicCredit Limited and is regulated by the Uganda Microfinance Regulatory Authority.",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: Theme.of(context).primaryColor,
                              fontWeightDelta: 3,
                            ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
