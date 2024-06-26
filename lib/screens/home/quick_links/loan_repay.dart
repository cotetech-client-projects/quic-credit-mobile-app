import '/exports/exports.dart';

class LoanRepay extends StatefulWidget {
  const LoanRepay({super.key});

  @override
  State<LoanRepay> createState() => _LoanRepayState();
}

class _LoanRepayState extends State<LoanRepay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Repayment"),
      ),
      body: const Center(
        child: Text('Loan Repay'),
      ),
    );
  }
}
