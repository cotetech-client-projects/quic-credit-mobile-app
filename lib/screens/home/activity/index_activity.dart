import 'package:quic_credit/widgets/transaction_widget.dart';

import '/exports/exports.dart';

class IndexActivity extends StatefulWidget {
  const IndexActivity({super.key});

  @override
  State<IndexActivity> createState() => _IndexActivityState();
}

class _IndexActivityState extends State<IndexActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Center(),
        title: Text(
          "Transaction History",
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontStyle: FontStyle.normal,
                fontWeightDelta: 2,
              ),
        ),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: CustomAnimatedWidget(
          //     duration: const Duration(milliseconds: 4000),
          //     child: SvgPicture.asset(
          //       "assets/svgs/no-transaction.svg",
          //       width: 300,
          //       height: 300,
          //     ),
          //   ),
          // ),
          // Text(
          //   "No Transactions yet",
          //   style: Theme.of(context).textTheme.titleLarge!.apply(
          //         fontWeightDelta: 10,
          //       ),
          // )
          ...List.generate(
            10,
            (index) => const TransactionWidget(),
          ),
        ],
      ),
    );
  }
}
