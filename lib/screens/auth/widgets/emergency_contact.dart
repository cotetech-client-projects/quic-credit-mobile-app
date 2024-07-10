import 'dart:developer';

import '/exports/exports.dart';

class EmergencyContact extends StatefulWidget {
  final int id;
  final Function(EmergencyContactData) onSave;
  const EmergencyContact({
    super.key,
    required this.id,
    required this.onSave,
  });

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  String nameError = "";
  String phoneError = "";
  String relationshipError = "";
  String numberError = "";
  //controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final numberController = TextEditingController();
  final relationshipController = TextEditingController();
  //values
  String relationShipValue = "0";
  String numberValue = "0";
  @override
  void initState() {
    super.initState();
    Provider.of<DataController>(context).fetchEmergencyNumbers();
    Provider.of<DataController>(context).fetchRelationship();
    // Add listeners to all controllers
    nameController.addListener(_onFormChanged);
    relationshipController.addListener(_onFormChanged);
    phoneController.addListener(_onFormChanged);
    // relationshipController.addListener(_onFormChanged);
    // numberController.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    widget.onSave(EmergencyContactData(
      name: nameController.text,
      relationship: relationShipValue,
      phone: phoneController.text,
      emergency_number: numberValue,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(builder: (context, controller, c) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Space(space: 0.01),
          Text(
            "${widget.id}${widget.id == 1 ? 'st' : widget.id == 2 ? 'nd' : widget.id == 3 ? 'rd' : 'th'} emergency contact",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Space(space: 0.01),
          // field for email
          CommonTextField(
            titleText: "Name",
            hintText: "Name here...",
            contentPadding: const EdgeInsets.all(10),
            keyboardType: TextInputType.name,
            radius: 10,
            errorText: nameError,
            enableBorder: true,
            onChanged: (p0) {
              // log(p0);
            },
            controller: nameController,
            validate: (value) {
              if (value!.isEmpty) {
                setState(() {
                  nameError = "This field is required";
                });
              }
              return null;
            },
          ),

          CommonTextField(
            titleText: "Phone number",
            hintText: "Phone number here...",
            contentPadding: const EdgeInsets.all(10),
            keyboardType: TextInputType.phone,
            radius: 10,
            errorText: phoneError,
            enableBorder: true,
            controller: phoneController,
            validate: (value) {
              setState(() {
                phoneError = value!.isEmpty ? "This field is required" : "";
              });
              return null;
            },
          ),
          // CommonTextField(
          //   titleText: "Emergency Contact Type",
          //   hintText: "Emergency Contact Type here...",
          //   contentPadding: const EdgeInsets.all(10),
          //   keyboardType: TextInputType.text,
          //   radius: 10,
          //   errorText: numberError,
          //   enableBorder: true,
          //   controller: numberController,
          //   readOnly: true,
          //   suffixIcon: Icons.add,
          //   enableSuffix: true,
          //   onTapSuffix: () {
          //     showSheet(
          //         data: controller.emergency_numbers
          //             .map((e) => {
          //                   "id": e.id,
          //                   "name": e.description,
          //                 })
          //             .toList(),
          //         selected: (value) {
          //           setState(() {
          //             numberController.text = value['name'];
          //             numberValue = value['id'].toString();
          //             widget.onSave(EmergencyContactData(
          //               name: nameController.text,
          //               relationship: relationShipValue,
          //               phone: phoneController.text,
          //               emergency_number: numberValue,
          //             ));
          //             log("number value: $numberValue");
          //           });
          //         });
          //   },
          //   validate: (value) {
          //     setState(() {
          //       numberError = value!.isEmpty ? "This field is required" : "";
          //     });
          //     return null;
          //   },
          // ),

          const Space(space: 0.01),
          // field for email
          CommonTextField(
            titleText: "Relationship",
            hintText: "Relationship here...",
            contentPadding: const EdgeInsets.all(10),
            keyboardType: TextInputType.name,
            radius: 10,
            errorText: relationshipError,
            enableBorder: true,
            controller: relationshipController,
            suffixIcon: Icons.add,
            enableSuffix: true,
            onTapSuffix: () {
              showSheet(
                  data: controller.relationship
                      .map((e) => {
                            "id": e.id,
                            "name": e.name,
                          })
                      .toList(),
                  selected: (value) {
                    setState(() {
                      relationshipController.text = value['name'];
                      relationShipValue = value['id'].toString();
                      widget.onSave(EmergencyContactData(
                        name: nameController.text,
                        relationship: relationShipValue,
                        phone: phoneController.text,
                        emergency_number: numberValue,
                      ));
                      log("relationship value: $relationShipValue");
                    });
                  });
            },
            validate: (value) {
              setState(() {
                relationshipError =
                    value!.isEmpty ? "This field is required" : "";
              });
              return null;
            },
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    // nameController.dispose();
    // relationshipController.dispose();
    // phoneController.dispose();
    // relationshipController.dispose();
    super.dispose();
  }
}

class EmergencyContactData {
  final String name;
  final String relationship;
  final String phone;
  final String emergency_number;

  EmergencyContactData({
    required this.name,
    required this.relationship,
    required this.phone,
    required this.emergency_number,
  });
}
