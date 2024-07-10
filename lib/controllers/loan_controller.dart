import '../models/user_loan_request_model.dart';
import '/services/loan_service.dart';
import '../exports/exports.dart';
import '../models/loan_term_model.dart';
import '../models/repayment_model.dart';

class LoanController with ChangeNotifier {
  // loader
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<Datum> _loans = [];
  List<Datum> get loans => _loans;
  void fetchLoanRepaymentMode() async {
    LoanService().loanRepaymentModel().then((value) {
      _loans = value;
      notifyListeners();
    });
  }

  // loan offer
  List<LoanData> _loanOffer = [];
  List<LoanData> get loanOffer => _loanOffer;
  void fetchLoanTerms() async {
    LoanService().loanTermPeriod().then((value) {
      _loanOffer = value;
      notifyListeners();
    });
  }

// user loan requests
  List<UserLoanRequestModel> _userLoanRequests = [];
  List<UserLoanRequestModel> get userLoanRequests => _userLoanRequests;
  void fetchUserLoanRequests() async {
    LoanService().userLoanRequest().then((value) {
      _userLoanRequests = value;
      notifyListeners();
    });
  }

  // constructor invocation
  LoanController() {
    // repayment mode
    fetchLoanRepaymentMode();
    // loan terms
    fetchLoanTerms();
    //
    fetchUserLoanRequests();
  }
}
