import '/exports/exports.dart';

class ApplyLoan extends StatefulWidget {
  const ApplyLoan({super.key});

  @override
  State<ApplyLoan> createState() => _ApplyLoanState();
}

class _ApplyLoanState extends State<ApplyLoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Apply Loan'),
      ),
    );
  }
}
