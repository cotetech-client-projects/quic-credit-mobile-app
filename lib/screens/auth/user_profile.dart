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
  final workStatusController = TextEditingController();
  int workValue = 0;
  int salaryFreq = 0;
  int educationDegreeValue = 0;
  int maritalStatusValue = 0;
  int regionValue = 0;

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

  var regionController = TextEditingController();
  var salaryFrequencyController = TextEditingController();
  var educationDegreeController = TextEditingController();
  var maritalStatusController = TextEditingController();
  var salaryPayDayController = TextEditingController();
  @override
  void initState() {
    Provider.of<DataController>(context).fetchEducation();
    Provider.of<DataController>(context).fetchMaritalStatus();
    Provider.of<DataController>(context).fetchRegions();
    Provider.of<DataController>(context).fetchRelationship();
    Provider.of<DataController>(context).fetchEmergencyNumbers();
    Provider.of<DataController>(context).fetchSalaryFrequency();
    Provider.of<DataController>(context).fetchWorkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Information',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 5,
                fontSizeDelta: 1,
              ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Consumer<DataController>(builder: (context, controller, x) {
          if (mounted) {}
          return ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              // const Space(space: 0.10),

              // date of birth
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
              //  work status
              CommonTextField(
                controller: workStatusController,
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
                      workStatusController.text = value['name'];
                      setState(() {
                        workValue = value['id'];
                      });
                    },
                  );
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    // setState(() {
                    return "Work status is required";
                    // });
                    // return null;
                  }
                  return null;
                },
                radius: 10,
                titleText: "Work Status",
                errorText: dobError,
              ),
              // region
              CommonTextField(
                controller: regionController,
                enableBorder: true,
                suffixIcon: Icons.add,
                enableSuffix: true,
                hintText: "Select region",
                contentPadding: const EdgeInsets.all(10),
                keyboardType: TextInputType.text,
                readOnly: true,
                onTapSuffix: () async {
                  showSheet(
                    data: controller.regions
                        .map((x) => {
                              "name": x.label,
                              "id": x.id,
                            })
                        .toList(),
                    selected: (value) {
                      regionController.text = value['name'];
                      setState(() {
                        regionValue = value['id'];
                      });
                    },
                  );
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    // setState(() {
                    return "Region is required";
                    // });
                    // return null;
                  }
                  return null;
                },
                radius: 10,
                titleText: "Region",
                // errorText: dobError,
              ),
              // salary frequency
              CommonTextField(
                controller: salaryFrequencyController,
                enableBorder: true,
                suffixIcon: Icons.add,
                enableSuffix: true,
                hintText: "Select salary frequency",
                contentPadding: const EdgeInsets.all(10),
                keyboardType: TextInputType.text,
                readOnly: true,
                onTapSuffix: () async {
                  showSheet(
                    data: controller.salaryFrequency
                        .map((x) => {
                              "name": x.label,
                              "id": x.id,
                            })
                        .toList(),
                    selected: (value) {
                      salaryFrequencyController.text = value['name'];
                      setState(() {
                        salaryFreq = value['id'];
                      });
                    },
                  );
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    // setState(() {
                    return "Salary frequency is required";
                    // });
                  }
                  return null;
                },
                radius: 10,
                titleText: "Salary Frequency Status",
                errorText: dobError,
              ),
              //   education degree
              CommonTextField(
                controller: educationDegreeController,
                enableBorder: true,
                suffixIcon: Icons.add,
                enableSuffix: true,
                hintText: "Select education degree",
                contentPadding: const EdgeInsets.all(10),
                keyboardType: TextInputType.text,
                readOnly: true,
                onTapSuffix: () async {
                  showSheet(
                    data: controller.education
                        .map((x) => {
                              "name": x.label,
                              "id": x.id,
                            })
                        .toList(),
                    selected: (value) {
                      educationDegreeController.text = value['name'];
                      setState(() {
                        educationDegreeValue = value['id'];
                      });
                    },
                  );
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    // setState(() {
                    return "Education degree is required";
                    // });
                  }
                  return null;
                },
                radius: 10,
                titleText: "Education Degree",
                // errorText: dobError,
              ),
              // marital status
              CommonTextField(
                controller: maritalStatusController,
                enableBorder: true,
                suffixIcon: Icons.add,
                enableSuffix: true,
                hintText: "Select marital status",
                contentPadding: const EdgeInsets.all(10),
                keyboardType: TextInputType.text,
                readOnly: true,
                onTapSuffix: () async {
                  showSheet(
                    data: controller.maritalStatus
                        .map((x) => {
                              "name": x.label,
                              "id": x.id,
                            })
                        .toList(),
                    selected: (value) {
                      maritalStatusController.text = value['name'];
                      setState(() {
                        maritalStatusValue = value['id'];
                      });
                    },
                  );
                },
                validate: (value) =>
                    (value!.isEmpty) ? "Marital status is required" : null,
                radius: 10,
                titleText: "Marital Status",
                // errorText: dobError,
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
                      ninError = "NIN is required";
                    });
                    return null;
                  } else if (value.length < 14) {
                    setState(() {
                      ninError = " NIN must be 14 characters long";
                    });
                  }
                  return null;
                },
                radius: 10,
                titleText: "National ID Number (NIN)*",
                errorText: ninError,
              ),
              // salary pay day
              CommonTextField(
                controller: salaryPayDayController,
                enableBorder: true,
                suffixIcon: Icons.calendar_today,
                enableSuffix: true,
                hintText: "Select your salary payday",
                contentPadding: const EdgeInsets.all(10),
                keyboardType: TextInputType.datetime,
                readOnly: true,
                onTapSuffix: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  );
                  if (date != null) {
                    salaryPayDayController.text =
                        DateFormat.yMMMd().format(date);
                  }
                },
                validate: (value) {
                  if (value!.isEmpty) {
                    // setState(() {
                    return "Salary payday is required";
                    // });
                    // return null;
                  }
                  return null;
                },
                radius: 10,
                titleText: "Salary Payday",
                errorText: dobError,
              ),
              const Space(
                space: 0.02,
              ),
              CustomButton(
                loading: controller.loading,
                onPress: controller.loading
                    ? () {}
                    : () {
                        controller.loading = true;
                        if (formKey.currentState!.validate()) {
                          AuthService().completeAuth({
                            "nin": ninController.text,
                            "date_of_birth": dobController.text,
                            "region_id": regionValue,
                            "work_status_id": workValue,
                            "frequency_of_salary_id": salaryFreq,
                            "education_degree_id": educationDegreeValue,
                            "marital_status_id": maritalStatusValue,
                            "gender": genderController.text.toLowerCase(),
                            "salary_payday": salaryPayDayController.text
                          }).then((value) {
                            controller.loading = false;
                            // routes to the next page
                            Routes.pushPage(Routes.familyInfo);
                            showMessage(
                              value,
                              color: Colors.green.shade700,
                            );
                          }).onError((error, stackTrace) {
                            controller.loading = false;
                            showMessage(error.toString());
                            // Routes.pushReplace(Routes.familyInfo);
                          });
                        } else {
                          controller.loading = false;
                          // Routes.pushReplace(Routes.familyInfo);
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
    );
  }
}
