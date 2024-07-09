import 'dart:developer';

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
  // List<TextEditingController> controllers = [
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  // ];
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
        title: const Text("Family Information"),
      ),
      body: Consumer(builder: (context, controller, c) {
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
                          color: Theme.of(context).primaryColor,
                          fontWeightDelta: 4,
                          fontSizeDelta: 1,
                        ),
                  ),
                ),
                Text(
                  '(Atleast two contacts)',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: Colors.red,
                        fontWeightDelta: 2,
                      ),
                ),
                // field for email
                const Space(space: 0.04),
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
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      for (var contactData in emergencyContactsData) {
                        log('Name: ${contactData.name}');
                        log('Relationship: ${contactData.relationship}');
                        log('Phone: ${contactData.phone}');
                        log('Emergency contact: ${contactData.emergency_number}');
                        log('---');
                      }
                      // TODO: Process the collected data (e.g., send to server)
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
