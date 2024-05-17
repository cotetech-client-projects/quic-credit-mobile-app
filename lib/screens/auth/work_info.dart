import "/exports/exports.dart";

class WorkInfo extends StatefulWidget {
  const WorkInfo({super.key});

  @override
  State<WorkInfo> createState() => _WorkInfoState();
}

class _WorkInfoState extends State<WorkInfo> {
  // form key
  final formKey = GlobalKey<FormState>();
  // controllers
  final companyNameController = TextEditingController();
  final workStatusController = TextEditingController();
  final monthlyIncomeController = TextEditingController();

  // error strings
  String companyNameError = "";
  String workStatusError = "";
  String monthlyIncomeError = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(
        child: Consumer(
          builder: (context, controller, child) {
            return Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(15.0),
                children: [
                  const Space(space: 0.10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                    child: Text(
                      'Add Your Work Information',
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeightDelta: 4,
                            fontSizeDelta: 1,
                          ),
                    ),
                  ),
                  const Space(space: 0.01),
                  // field for email
                  CommonTextField(
                    titleText: "Company Name *",
                    hintText: "Company Name here...",
                    contentPadding: const EdgeInsets.all(10),
                    keyboardType: TextInputType.name,
                    radius: 10,
                    errorText: companyNameError,
                    enableBorder: true,
                    controller: companyNameController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          companyNameError = "Company name is required";
                        });
                        return null;
                      }
                      return null;
                    },
                  ),

                  const Space(space: 0.01),
                  // field for email
                  CommonTextField(
                    titleText: "Work Status *",
                    controller: workStatusController,
                    hintText: "Work Status here...",
                    contentPadding: const EdgeInsets.all(10),
                    keyboardType: TextInputType.number,
                    radius: 10,
                    errorText: workStatusError,
                    enableBorder: true,
                    validate: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          workStatusError = "Work status is required";
                        });
                        return null;
                      }
                      return null;
                    },
                  ),

                  const Space(space: 0.01),
                  // field for email
                  CommonTextField(
                    enableBorder: true,
                    titleText: "Your Monthly Income *",
                    hintText: "Monthly Income here...",
                    errorText: monthlyIncomeError,
                    contentPadding: const EdgeInsets.all(10),
                    keyboardType: TextInputType.number,
                    controller: monthlyIncomeController,
                    radius: 10,
                    validate: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          monthlyIncomeError = "Monthly income is required";
                        });
                        return null;
                      }
                      return null;
                    },
                  ),
                  const Space(space: 0.01),
                  // button
                  CustomButton(
                    onPress: () {
                      if (!formKey.currentState!.validate()) {
                      } else {
                        Routes.pushPage(Routes.familyInfo);
                      }
                    },
                    buttonColor: Theme.of(context).colorScheme.primary,
                    text: "Continue",
                    buttonRadius: 10,
                    textColor: Colors.white,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
