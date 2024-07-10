import 'dart:async';
import 'dart:developer';

import 'package:quic_credit/models/user_model.dart';

import '/screens/home/quick_links/coupons.dart';
import '/screens/home/quick_links/apply_loan.dart';
import '/screens/home/quick_links/loan_repay.dart';
import '/exports/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    AuthenticatedUser().getUser();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      AuthenticatedUser().getUser();
      log(timer.tick.toString());
      if (authenticatedUser.user != null) {
        setState(() {
          userModel = authenticatedUser.user;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    AuthenticatedUser().getUser();
    // });
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.indigo.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _buildHeader(),
                const SizedBox(height: 20),
                _buildCurrentBalance(),
                const SizedBox(height: 20),
                _buildQuickLinks(),
                const SizedBox(height: 20),
                _buildLoanOffer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${userModel?.user.firstName}',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Text(
              'Make you loan request right now \nin less than (5) minutes.',
              style: GoogleFonts.poppins(
                fontSize: 13,
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          backgroundImage: const AssetImage(
            "assets/pngs/new_logo.png",
          ),
          radius: 25,
        ),
      ],
    );
  }

  Widget _buildCurrentBalance() {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade800
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          side: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade200
                : Colors.black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SizedBox(
            width: double.infinity,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Maximum Loan Amount',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Text(
                  'UGX 3,000,000',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildInfoCard(String title, String amount, IconData icon) {
  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quick Link',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(''),
            ),
          ],
        ),
        Row(
          children: [
            _buildQuickLinkCard('Apply for\na loan', Icons.monetization_on, () {
              Routes.animateToPage(const ApplyLoan());
            }),
            const SizedBox(width: 16),
            _buildQuickLinkCard('Make a loan\npayment', Icons.payment, () {
              Routes.animateToPage(const LoanRepay());
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickLinkCard(String title, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade300
                  : Colors.black,
            ),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade800
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade600
                    : Theme.of(context).primaryColor.withAlpha(50),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(icon),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.shade600
                      : Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoanOffer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Loan Offer',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text('')),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade800
                : Theme.of(context).primaryColor.withAlpha(30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.handshake),
                      SizedBox(width: 8),
                      Text('Coupon Loan'),
                    ],
                  ),
                  Text('Recommended for you.'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Routes.animateToPage(
                    CouponPage(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Apply',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
