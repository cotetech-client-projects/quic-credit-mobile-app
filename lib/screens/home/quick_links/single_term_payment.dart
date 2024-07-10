import 'dart:developer';

import 'package:quic_credit/controllers/loan_controller.dart';

import '/exports/exports.dart';

class SingleTermPayment extends StatefulWidget {
  const SingleTermPayment({super.key});

  @override
  State<SingleTermPayment> createState() => _SingleTermPaymentState();
}

class _SingleTermPaymentState extends State<SingleTermPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'One time Repayment',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SvgPicture.asset(
              "assets/svgs/loan-repayment.svg",
              height: 250,
            ),
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

  // This is the section that will be used to make payment
  Widget _buildRemainingPaymentSection() {
    final _amountController = TextEditingController();
    final _amountPayController = TextEditingController();
    int loanID = 0;
    return Consumer<LoanController>(builder: (contex, controller, x) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CommonTextField(
            titleText: "Select Loan request",
            enableBorder: true,
            hintText: "Loan request",
            radius: 10,
            contentPadding: const EdgeInsets.all(10),
            controller: _amountController,
            keyboardType: TextInputType.text,
            enableSuffix: true,
            suffixIcon: Icons.arrow_drop_down,
            readOnly: true,
            onTapSuffix: () {
              // show dialog to select loan request
              log("Select loan request");
              showSheet(
                  data: controller.userLoanRequests
                      .map((x) => {
                            "id": x.id,
                            "name": "UGX ${x.amountRequested}",
                          })
                      .toList(),
                  selected: (value) {
                    _amountController.text = value['name'];
                    loanID = value['id'];
                  });
            },
          ),
          const Space(
            space: 0.02,
          ),
          CommonTextField(
            titleText: "Amount to pay",
            enableBorder: true,
            hintText: "Enter amount to pay",
            radius: 10,
            contentPadding: const EdgeInsets.all(10),
            controller: _amountPayController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: "Process Payment",
            buttonRadius: 10,
            textColor: Colors.white,
            buttonColor: Theme.of(context).primaryColor,
            onPress: () {
              // make payment
              var data = {
                "loan_request_id": 1,
                "amount_to_be_paid": _amountController.text,
                "payment_due_at": DateTime.now().toString(),
              };
              log(data.toString());
            },
          ),
        ],
      );
    });
  }

}
