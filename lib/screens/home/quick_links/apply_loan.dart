import '/exports/exports.dart';

class ApplyLoan extends StatefulWidget {
  const ApplyLoan({super.key});

  @override
  State<ApplyLoan> createState() => _ApplyLoanState();
}

class _ApplyLoanState extends State<ApplyLoan> {
  final loanAmountController = TextEditingController();
  final loanTermAmountController = TextEditingController();
  ScrollController stepController = ScrollController();
  // form key
  final formKey = GlobalKey<FormState>();
  int currentStep = 0;
  StepState currentStepState = StepState.indexed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Apply for a Loan',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Stepper(
            currentStep: currentStep,
            controller: stepController,
            onStepContinue: () {
              if (currentStep >= 1) {
                setState(() {
                  currentStepState = StepState.complete;
                });
              } else {
                setState(() {
                  currentStepState = StepState.editing;
                });
                setState(() {
                  currentStep++;
                });
              }
            },
            onStepCancel: () {
              if (currentStep < 1) {
                setState(() {
                  currentStep = 0;
                });
              } else {
                setState(() {
                  currentStepState = StepState.indexed;
                  currentStep--;
                });
              }
            },
            steps: [
              Step(
                isActive: currentStep == 0,
                state: currentStep == 0
                    ? StepState.editing
                    : currentStep > 0
                        ? StepState.complete
                        : StepState.indexed,
                title: Text(
                  "Request a a specific amount",
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        fontWeightDelta: 5,
                      ),
                ),
                content: SizedBox(
                  height: constraints.maxHeight * 0.45,
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        CommonTextField(
                          controller: loanAmountController,
                          titleText: "Loan Amount",
                          contentPadding: const EdgeInsets.all(10),
                          radius: 10,
                          enableBorder: true,
                          hintText: "Provide the amount of money you need..",
                        ),
                        // const Space(),
                        const Space(),
                        CommonTextField(
                          controller: loanTermAmountController,
                          titleText: "Loan Term (in days)",
                          contentPadding: const EdgeInsets.all(10),
                          radius: 10,
                          enableBorder: true,
                          hintText: "Provide the time for loan repayment..",
                        ),
                        const Space(),
                        CommonTextField(
                          controller: loanTermAmountController,
                          titleText: "Loan Term (in days)",
                          enableBorder: true,
                          radius: 10,
                          readOnly: true,
                          hintText: "Provide the time for loan repayment..",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Step(
                isActive: currentStep == 1,
                state: currentStepState,
                title: Text(
                  "Submit Loan Request",
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        fontWeightDelta: 5,
                      ),
                ),
                content: Text("Submit loan request"),
              )
            ],
          ),
        );
      }),
    );
  }
}
