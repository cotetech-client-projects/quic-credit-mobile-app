import '/exports/exports.dart';
import 'package:intl/intl.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // form key
  final formKey = GlobalKey<FormState>();
  // controllers
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final ninController = TextEditingController();
  // error strings
  String firstNameError = "";
  String lastNameError = "";
  String emailError = "";
  String dobError = "";
  String ninError = "";
  int male = -1;
  int female = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(
        child: Form(
          key: formKey,
          child: Consumer<DataController>(builder: (context, controller, x) {
            if (mounted) {
              // controller.fetchEducation();
              // controller.fetchMaritalStatus();
              // controller.fetchRegions();
              // controller.fetchRelationship();
              // controller.fetchSalaryFrequency();
              controller.fetchWorkStatus();
            }
            return ListView(
              padding: const EdgeInsets.all(15.0),
              children: [
                const Space(space: 0.10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                  child: Text(
                    'Personal Information',
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          color: Theme.of(context).primaryColor,
                          fontWeightDelta: 5,
                          fontSizeDelta: 1,
                        ),
                  ),
                ),

                CommonTextField(
                  controller: dobController,
                  enableBorder: true,
                  suffixIcon: Icons.calendar_today,
                  enableSuffix: true,
                  hintText: "Select your date of birth",
                  contentPadding: const EdgeInsets.all(10),
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  onTapSuffix: () async {
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      dobController.text = DateFormat.yMMMd().format(date);
                    }
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        dobError = "Date of birth is required";
                      });
                      return null;
                    }
                    return null;
                  },
                  radius: 10,
                  titleText: "Date Of Birth",
                  errorText: dobError,
                ),
                CommonTextField(
                  controller: dobController,
                  enableBorder: true,
                  suffixIcon: Icons.add,
                  enableSuffix: true,
                  hintText: "Select work status",
                  contentPadding: const EdgeInsets.all(10),
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  onTapSuffix: () async {
                    showSheet(
                      data: controller.workStatus
                          .map((x) => {
                                "name": x.label,
                                "id": x.id,
                              })
                          .toList(),
                      selected: (value) {
                        // dobController.text = value;
                      },
                    );
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        dobError = "Date of birth is required";
                      });
                      return null;
                    }
                    return null;
                  },
                  radius: 10,
                  titleText: "Work Status",
                  errorText: dobError,
                ),

                // gender ui
                const Space(space: 0.010),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    "Gender",
                    style: TextStyles(context).getDescriptionStyle().apply(
                          color: Colors.grey.shade600,
                          fontWeightDelta: 5,
                        ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: RadioListTile(
                        value: male,
                        groupValue: 0,
                        onChanged: (x) {
                          setState(() {
                            female = 1;
                            male = 0;
                            genderController.text = "Male";
                          });
                        },
                        title: const Text("Male"),
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        title: const Text("Female"),
                        value: female,
                        groupValue: 0,
                        onChanged: (x) {
                          setState(() {
                            female = 0;
                            male = 1;
                            genderController.text = "Female";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // field for nin
                CommonTextField(
                  controller: ninController,
                  enableBorder: true,
                  hintText: "Enter your National ID Number",
                  contentPadding: const EdgeInsets.all(10),
                  validate: (value) {
                    if (value!.isEmpty) {
                      setState(() {
                        dobError = "NIN is required";
                      });
                      return null;
                    }
                    return null;
                  },
                  radius: 10,
                  titleText: "National ID Number (NIN)*",
                  errorText: ninError,
                ),

                const Space(
                  space: 0.02,
                ),
                CustomButton(
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      AuthService().completeAuth({
                        "nin": ninController.text,
                        "date_of_birth": dobController.text,
                        "region_id": 1,
                        "work_status_id": 1,
                        "frequency_of_salary_id": 1,
                        "education_degree_id": 1,
                        "marital_status_id": 1,
                        "gender": genderController.text,
                        "salary_payday": "2024-07-15"
                      });
                    }
                  },
                  buttonColor: Theme.of(context).primaryColor,
                  text: "Submit Profile",
                  buttonRadius: 10,
                  textColor: Colors.white,
                ),
                const Space(space: 0.01),
              ],
            );
          }),
        ),
      ),
    );
  }
}
