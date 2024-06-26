import '../exports/exports.dart';

class LoanService {
  static const platform = MethodChannel('com.app.quic_credit/loanEligibility');

  Future<void> _checkLoanEligibility() async {
    String loanAmount;
    try {
      final double result = await platform
          .invokeMethod('checkLoanEligibility', {"userId": 12345});
      loanAmount = 'Loan amount: \$${result.toStringAsFixed(2)}';
    } on PlatformException catch (e) {
      loanAmount = "Failed to get loan amount: '${e.message}'.";
    }
  }
}
