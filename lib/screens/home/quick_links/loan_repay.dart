import '/exports/exports.dart';

class LoanRepay extends StatefulWidget {
  const LoanRepay({super.key});

  @override
  State<LoanRepay> createState() => _LoanRepayState();
}

class _LoanRepayState extends State<LoanRepay> {
  final loanRepaymentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loan Repayment",
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 2,
              ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Space(),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text.rich(
                TextSpan(
                  text: "Loan break down\n",
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        fontWeightDelta: 2,
                      ),
                  children: [
                    TextSpan(
                      text: "\nAmount payable : ",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 2,
                          ),
                    ),
                    TextSpan(
                      text: " 30,000\n",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 2,
                          ),
                    )
                  ],
                ),
              ),
            ),
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
            controller: loanRepaymentController,
            labelText: "Loan amount",
            errorText: "",
            keyboardType: TextInputType.number,
            hintText: "Enter amount you're paying",
          ),
          const Space(),
          CustomButton(
            onPress: () {},
            buttonColor: Themes.primaryColor,
            textColor: Colors.white,
            text: "Process Payment",
          )
        ],
      ),
    );
  }
}
