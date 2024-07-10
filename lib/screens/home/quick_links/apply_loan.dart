import 'dart:developer';
import '/controllers/loan_controller.dart';
import '/services/loan_service.dart';
import '/exports/exports.dart';

class ApplyLoan extends StatefulWidget {
  const ApplyLoan({super.key});

  @override
  State<ApplyLoan> createState() => _ApplyLoanState();
}

class _ApplyLoanState extends State<ApplyLoan> {
  final formKey = GlobalKey<FormState>();
  // controllers
  final _loanAmountController = TextEditingController();
  final _loanTermController = TextEditingController();
  final _repaymentModeController = TextEditingController();
  // dynmaic values
  int loanTerm = 0;
  int loanMode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Apply Loan',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 10,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: AuthService().checkProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data != null && snapshot.data == false) {
                  Routes.pushPage(Routes.completeProfile);
                }
              }
              return Consumer<LoanController>(
                  builder: (context, controller, x) {
                return Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      _buildLoanAmountSection(),
                      const SizedBox(height: 20),
                      CommonTextField(
                        titleText: "Loan Term (Days to pay)",
                        enableBorder: true,
                        hintText: "Select Loan Term",
                        radius: 10,
                        controller: _loanTermController,
                        enableSuffix: true,
                        suffixIcon: Icons.arrow_drop_down,
                        onTapSuffix: () {
                          showSheet(
                            data: controller.loanOffer.map((predicate) {
                              return {
                                "id": predicate.id,
                                "name": predicate.daysToPay.toString()
                              };
                            }).toList(),
                            selected: (value) {
                              _loanTermController.text = value["name"];
                              setState(() {
                                loanTerm = value["id"];
                              });
                            },
                          );
                        },
                        readOnly: true,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      const Space(
                        space: 0.02,
                      ),
                      CommonTextField(
                        titleText: "Loan Repayment mode",
                        enableBorder: true,
                        hintText: "Select Repayment mode",
                        radius: 10,
                        controller: _repaymentModeController,
                        enableSuffix: true,
                        suffixIcon: Icons.arrow_drop_down,
                        onTapSuffix: () {
                          showSheet(
                            data: controller.loans.map((predicate) {
                              return {
                                "id": predicate.id,
                                "name": predicate.modeName
                              };
                            }).toList(),
                            selected: (value) {
                              log(value.toString());
                              _repaymentModeController.text = value["name"];
                              setState(() {
                                loanMode = value["id"];
                              });
                            },
                          );
                        },
                        readOnly: true,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      const Space(
                        space: 0.02,
                      ),
                      CommonTextField(
                        titleText: "Amount",
                        enableBorder: true,
                        hintText: "Enter Amount",
                        radius: 10,
                        controller: _loanAmountController,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      const Space(
                        space: 0.02,
                      ),
                      CustomButton(
                        loading: controller.loading,
                        onPress: controller.loading
                            ? () {}
                            : () {
                                if (formKey.currentState!.validate()) {
                                  controller.loading = true;
                                  Map<String, dynamic> data = {
                                    "loan_term_id": loanTerm,
                                    "loan_repayment_mode_id": loanMode,
                                    "amount_requested":
                                        _loanAmountController.text
                                  };
                                  log(data.toString());
                                  LoanService().applyLoan(data).then((value) {
                                    controller.loading = false;
                                    showMessage(
                                      value,
                                      color: Colors.green.shade600,
                                    );
                                  }).onError((error, stackTrace) {
                                    controller.loading = false;
                                    showMessage(
                                      error.toString(),
                                      color: Colors.red.shade600,
                                    );
                                  });
                                } else {
                                  showMessage(
                                    "Please fill all fields",
                                    color: Colors.red.shade600,
                                  );
                                }
                              },
                        textColor: Colors.white,
                        buttonColor: Theme.of(context).primaryColor,
                        text: ('Apply Now'),
                        buttonRadius: 10,
                      ),
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }

  Widget _buildLoanAmountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svgs/loan-request.svg",
          height: 250,
        ),
      ],
    );
  }
}
