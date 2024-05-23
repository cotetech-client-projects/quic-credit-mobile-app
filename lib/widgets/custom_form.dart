import '/exports/exports.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String errorText;
  final bool readOnly;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  const CustomForm({
    super.key,
    this.suffix,
    this.inputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.labelText,
    required this.errorText,
    required this.hintText,
    this.readOnly = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        textInputAction: inputAction,
        keyboardType: keyboardType,
        controller: controller,
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return errorText;
          }
          return null;
        },
        readOnly: readOnly,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffix,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 4,
              color: Theme.of(context).colorScheme.primary.withAlpha(20),
            ),
          ),
        ),
      ),
    );
  }
}
