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
          child: ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              const Space(space: 0.10),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                child: Text(
                  'Add Your Personal Information',
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
                titleText: "First Name *",
                keyboardType: TextInputType.name,
                radius: 10,
                validate: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      firstNameError = "Full name is required";
                    });
                    return null;
                  }
                  return null;
                },
                contentPadding: const EdgeInsets.all(10),
                enableBorder: true,
                errorText: firstNameError,
                hintText: "Provide your firstname e.g John",
                controller: firstNameController,
              ),
              const Space(space: 0.010),
              // field for email
              CommonTextField(
                titleText: "Middle Name (Optional)",
                keyboardType: TextInputType.name,
                radius: 10,
                contentPadding: const EdgeInsets.all(10),
                enableBorder: true,
                hintText: "Provide your middle name e.g Doe",
                controller: middleNameController,
              ),
              const Space(space: 0.010),
              // field for email
              CommonTextField(
                titleText: "Last Name",
                keyboardType: TextInputType.name,
                radius: 10,
                contentPadding: const EdgeInsets.all(10),
                enableBorder: true,
                errorText: lastNameError,
                hintText: "Provide your last name e.g Matovu",
                controller: lastNameController,
                validate: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      lastNameError = "Last name is required";
                    });
                    return null;
                  }
                  return null;
                },
              ),
              const Space(space: 0.010),
              // form for date of birth
              CommonTextField(
                titleText: "Email Address*",
                keyboardType: TextInputType.emailAddress,
                radius: 10,
                validate: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      emailError = "Email is required";
                    });
                    return null;
                  }
                  return null;
                },
                contentPadding: const EdgeInsets.all(10),
                enableBorder: true,
                errorText: emailError,
                hintText: "Provide your email address",
                controller: emailController,
              ),
              const Space(space: 0.010),
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
              // gender ui
              const Space(space: 0.010),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                child: Text(
                  "Gender",
                  style: TextStyles(context).getDescriptionStyle(),
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
              const Space(space: 0.01),
              CustomButton(
                onPress: () {
                  if (!formKey.currentState!.validate()) {
                    print("Form is valid");
                  } else {
                    Routes.pushPage(Routes.work);
                  }
                },
                buttonColor: Theme.of(context).primaryColor,
                text: "Submit Profile",
                buttonRadius: 10,
                textColor: Colors.white,
              ),
              const Space(space: 0.091),
            ],
          ),
        ),
      ),
    );
  }
}
