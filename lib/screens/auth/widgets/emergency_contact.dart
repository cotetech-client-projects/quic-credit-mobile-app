import '/exports/exports.dart';

class EmergencyContact extends StatefulWidget {
  final int id;
  const EmergencyContact({
    super.key,
    required this.id,
  });

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  @override
  Widget build(BuildContext context) {
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
          errorText: "",
          enableBorder: true,
          controller: TextEditingController(),
          validate: (value) {
            return null;
          },
        ),
        CommonTextField(
          titleText: "Phone number",
          hintText: "Phone number here...",
          contentPadding: const EdgeInsets.all(10),
          keyboardType: TextInputType.name,
          radius: 10,
          errorText: "",
          enableBorder: true,
          controller: TextEditingController(),
          validate: (value) {
            return null;
          },
        ),
        const Space(space: 0.01),
        // field for email
        CommonTextField(
          titleText: "Relationship",
          hintText: "Relationship here...",
          contentPadding: const EdgeInsets.all(10),
          keyboardType: TextInputType.name,
          radius: 10,
          errorText: "",
          enableBorder: true,
          controller: TextEditingController(),
          validate: (value) {
            return null;
          },
        ),
      ],
    );
  }
}
