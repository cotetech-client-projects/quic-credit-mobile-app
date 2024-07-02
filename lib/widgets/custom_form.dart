import '/exports/exports.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController controller;
  final double height;
  final String labelText;
  final String hintText;
  final Widget? icon;
  final String? errorText;
  final bool readOnly;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  const CustomForm({
    super.key,
    this.suffix,
    this.height = 95,
    this.icon,
    this.inputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.labelText,
    this.errorText,
    required this.hintText,
    this.readOnly = false,
    this.obscureText = false,
  });
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  // validate password
  bool isValidPassword(String password) {
    // Regex for password validation
    final passwordRegExp = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');

    return passwordRegExp.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        textInputAction: inputAction,
        keyboardType: keyboardType,
        controller: controller,
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        validator: (value) {
          if (keyboardType == TextInputType.phone && value!.isEmpty) {
            return "Phone number is required!";
          } else if (keyboardType == TextInputType.text && value!.isEmpty) {
            return "This field is required!";
          } else if (keyboardType == TextInputType.emailAddress &&
              value!.isEmpty) {
            return "Email address is required!";
          } else if (keyboardType == TextInputType.text &&
              obscureText == true &&
              value!.isEmpty) {
            return "Password is required!";
          } else if (keyboardType == TextInputType.emailAddress &&
              isValidEmail(value!) == false) {
            return "Email is invalid!";
          } else if (obscureText == true && value!.length < 6) {
            return "Password is too short!";
          } else if (obscureText == true && isValidPassword(value!) == false) {
            return "Password must contain at least one uppercase letter, one lowercase letter and one special character!";
          }
          return null;
        },
        readOnly: readOnly,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                fontSizeDelta: 2,
              ),
          suffixIcon: suffix,
          errorMaxLines: 2,
          prefix: icon,
          hintMaxLines: 2,
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
