// import 'dart:developer';

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

  List<EmergencyContactData> emergencyContactsData = [];
  var store = <dynamic>{};
  List<List<TextEditingController>> data = [];
  int emergencyContacts = 1;
  @override
  void initState() {
    super.initState();
    Provider.of<DataController>(context).fetchRelationship();
    Provider.of<DataController>(context).fetchEmergencyNumbers();
  }

  void addEmergencyContactData(EmergencyContactData data) {
    setState(() {
      emergencyContactsData.add(data);
    });
  }

  void updateEmergencyContactData(int index, EmergencyContactData data) {
    setState(() {
      emergencyContactsData[index] = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Family Information",
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 5,
                fontSizeDelta: 1,
              ),
        ),
      ),
      body: Consumer<AuthController>(builder: (context, controller, c) {
        return Form(
          key: formKey,
          child: Consumer<AuthController>(builder: (context, controller, x) {
            return ListView(
              padding: const EdgeInsets.all(15.0),
              addAutomaticKeepAlives: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                  child: Text(
                    'Add Emergency contacts',
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          // color: Theme.of(context).primaryColor,
                          fontWeightDelta: 2,
                          fontSizeDelta: 1,
                        ),
                  ),
                ),
                Text(
                  '(Atleast two contacts)',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: Colors.red,
                        fontWeightDelta: 1,
                      ),
                ),
                // field for email
                const Space(space: 0.014),
                ...List.generate(
                  emergencyContacts,
                  (index) {
                    return EmergencyContact(
                      id: index + 1,
                      onSave: (data) {
                        if (index < emergencyContactsData.length) {
                          updateEmergencyContactData(index, data);
                        } else {
                          addEmergencyContactData(data);
                        }
                      },
                    );
                  },
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
                  loading: controller.authLoading,
                  onPress: controller.authLoading
                      ? () {}
                      : () {
                          if (formKey.currentState!.validate()) {
                            controller.authLoading = true;
                            for (var contactData in emergencyContactsData) {
                              AuthService().emergencyContacts({
                                // 'user_id':'${authenticatedUser.user?.user.id}',
                                'name': contactData.name,
                                'relationship_id': contactData.relationship,
                                'contact': contactData.phone,
                                'emergency_number_id': 1,
                              }).then((res) {
                                controller.authLoading = false;
                                showMessage(
                                  "Emergency contacts added successfully",
                                  color: Colors.green.shade600,
                                );
                                Routes.pushReplace(Routes.home);
                              }).catchError((error) {
                                controller.authLoading = false;
                                showMessage(
                                  "Failed to add emergency contacts",
                                  color: Colors.red.shade600,
                                );
                              });
                            }
                            // TODO: Process the collected data (e.g., send to server)
                          } else {
                            controller.authLoading = false;
                          }
                        },
                  buttonColor: Theme.of(context).primaryColor,
                  text: "Submit Changes ",
                  buttonRadius: 10,
                  textColor: Colors.white,
                ),
                const Space(space: 0.051),
              ],
            );
          }),
        );
      }),
    );
  }
}
