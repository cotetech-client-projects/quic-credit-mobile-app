import '/screens/auth/widgets/emergency_contact.dart';
import '/exports/exports.dart';

class FamilyInfo extends StatefulWidget {
  const FamilyInfo({super.key});

  @override
  State<FamilyInfo> createState() => _FamilyInfoState();
}

class _FamilyInfoState extends State<FamilyInfo> {
  // form key
  final formKey = GlobalKey<FormState>();
  // list for ugandan regions
  List<Map<String, dynamic>> regions = [
    {"name": "Central Region"},
    {"name": "Eastern"},
    {"name": "Northern"},
    {"name": "Western"},
  ];
  // list for martial status
  List<Map<String, dynamic>> martialStatus = [
    {"name": "Single"},
    {"name": "Married"},
    {"name": "Divorced"},
    {"name": "Widowed"},
  ];
  int emergencyContacts = 1;
  // controllers
  final regionController = TextEditingController();
  final cityController = TextEditingController();
  final maritalStatusController = TextEditingController();
  // errors
  String regionError = "";
  String cityError = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(
        child: Consumer(builder: (context, controller, c) {
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(15.0),
              addAutomaticKeepAlives: true,
              children: [
                const Space(space: 0.10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                  child: Text(
                    'Add Your Family Information',
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          color: Theme.of(context).primaryColor,
                          fontWeightDelta: 4,
                          fontSizeDelta: 1,
                        ),
                  ),
                ),
                const Space(space: 0.01),
                // field for email
                CommonTextField(
                  titleText: "Region *",
                  hintText: "Select your region",
                  readOnly: true,
                  enableSuffix: true,
                  suffixIcon: Icons.arrow_drop_down_circle_outlined,
                  onTapSuffix: () => showSheet(
                    data: regions,
                    selected: (value) {
                      setState(() {
                        regionController.text = value['name'];
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  keyboardType: TextInputType.name,
                  radius: 10,
                  errorText: "",
                  enableBorder: true,
                  controller: regionController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        regionError = "Region is required";
                      });
                      return null;
                    }
                    return null;
                  },
                ),
                const Space(space: 0.01),
                // field for email
                CommonTextField(
                  titleText: "City *",
                  hintText: "City name here...",
                  contentPadding: const EdgeInsets.all(10),
                  keyboardType: TextInputType.name,
                  radius: 10,
                  errorText: "",
                  enableBorder: true,
                  controller: cityController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        cityError = "City is required";
                      });
                      return null;
                    }
                    return null;
                  },
                ),
                const Space(space: 0.01),
                // field for email
                CommonTextField(
                  titleText: "Marital Status *",
                  hintText: "Your status...",
                  contentPadding: const EdgeInsets.all(10),
                  keyboardType: TextInputType.name,
                  radius: 10,
                  readOnly: true,
                  enableSuffix: true,
                  suffixIcon: Icons.arrow_drop_down_circle_outlined,
                  onTapSuffix: () => showSheet(
                    data: martialStatus,
                    selected: (value) {
                      setState(() {
                        maritalStatusController.text = value['name'];
                      });
                    },
                  ),
                  errorText: "",
                  enableBorder: true,
                  controller: maritalStatusController,
                  validate: (value) {
                    return null;
                  },
                ),
                const Space(space: 0.04),
                ...List.generate(
                  emergencyContacts,
                  (index) => EmergencyContact(
                    id: index + 1,
                  ),
                ),
                const Space(space: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {
                        setState(() {
                          emergencyContacts++;
                        });
                      },
                      label: Text(
                        "Add Contact",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                const Space(space: 0.01),
                CustomButton(
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      Routes.pushPage(Routes.home);
                    }
                  },
                  buttonColor: Theme.of(context).primaryColor,
                  text: "Submit Changes ",
                  buttonRadius: 10,
                  textColor: Colors.white,
                ),
                const Space(space: 0.051),
              ],
            ),
          );
        }),
      ),
    );
  }
}
