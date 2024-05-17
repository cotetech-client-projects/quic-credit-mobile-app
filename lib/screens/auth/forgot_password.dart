import '/exports/exports.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // controller
  final emailController = TextEditingController();
  // errors
  String emailError = "";
  // form key
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const Space(space: 0.05),
              SvgPicture.asset(
                "assets/svgs/forgot_password.svg",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const Space(space: 0.015),
              const Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Space(space: 0.01),
              const Text(
                "Enter your phone number to reset your password",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(30, 60, 87, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const Space(space: 0.01),
              CommonTextField(
                icon: Icons.phone,
                titleText: "Phone number",
                hintText: "07xx-xxxx-xxx",
                contentPadding: const EdgeInsets.all(10),
                keyboardType: TextInputType.emailAddress,
                radius: 10,
                errorText: emailError,
                enableBorder: true,
                controller: TextEditingController(),
                validate: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      emailError = "Email is required";
                    });
                    return null;
                  }
                  setState(() {
                    emailError = "";
                  });
                  return null;
                },
              ),
              const Space(space: 0.015),
              CustomButton(
                text: "Submit Request",
                onPress: () {
                  if (formKey.currentState!.validate()) {}
                  Routes.pushPage(Routes.otp);
                },
                textColor: Colors.white,
                buttonRadius: 10,
                buttonColor: Theme.of(context).colorScheme.primary,
              ),
              const Space(space: 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
