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
              stepIconBuilder: (stepIndex, stepState) {
                print(stepIndex);
              },
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
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          fontWeightDelta: 5,
                        ),
                  ),
                  content: SizedBox(
                    height: constraints.maxHeight * 0.45,
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Loan Amount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomForm(
                          controller: loanAmountController,
                          labelText: "Loan Amount",
                          errorText: "",
                          hintText: "Provide the amount of money you need..",
                        ),
                        const Space(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Loan Term',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomForm(
                          controller: loanTermAmountController,
                          labelText: "Loan Term (in days)",
                          errorText: "",
                          hintText: "Provide the time for loan repayment..",
                        ),
                        const Space(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Loan Interest',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomForm(
                          controller: loanTermAmountController,
                          labelText: "Loan Term (in days)",
                          errorText: "",
                          readOnly: true,
                          hintText: "Provide the time for loan repayment..",
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  isActive: currentStep == 1,
                  state: currentStepState,
                  title: Text("Submit Loan Request"),
                  content: Text("Submit loan request"),
                )
              ],
            ));
      }),
    );
  }
}
