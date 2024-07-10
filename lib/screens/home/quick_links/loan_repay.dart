import 'package:flutter/material.dart';
import 'package:quic_credit/exports/exports.dart';

import '../../../main.dart';
import 'installment_payment.dart';
import 'single_term_payment.dart';

class LoanRepay extends StatelessWidget {
  const LoanRepay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Repayment',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 10,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCurrentAmountDueCard(),
            const SizedBox(height: 20),
            const Text(
              'Make loan Payment',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildRemainingPaymentSection(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentAmountDueCard() {
    return Card(
      color: Theme.of(context).primaryColor,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current amount due',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(Icons.qr_code, color: Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '\UGX 2590.00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white, size: 16),
                        SizedBox(width: 5),
                        Text('Repayment date',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Text(
                      '12th May 2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.download, color: Colors.white, size: 16),
                        SizedBox(width: 5),
                        Text('Repayment amount',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Text('\UGX 495',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'You have 2 days left to repay your loan',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemainingPaymentSection() {
    return Row(
      children: [
        // design two cards, one for paying in installments and the other to pay one time
        _buildQuickLinkCard(
            title: 'Pay One-time \n',
            icon: Icons.payment,
            onTap: () {
              // make payment
              Routes.animateToPage(const SingleTermPayment());
            }),
        const SizedBox(width: 16),
        _buildQuickLinkCard(
            title: 'Pay in Installments',
            icon: Icons.payment,
            onTap: () {
              // make payment
              Routes.animateToPage(const InstallmentPayment());
            }),
      ],
    );
  }

  Widget _buildQuickLinkCard(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(),
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
                color: Theme.of(context).primaryColor.withAlpha(50),
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
              const Align(
                alignment: Alignment.bottomRight,
                child: Card(
                  elevation: 0,
                  color: Colors.black,
                  child: Padding(
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
}
