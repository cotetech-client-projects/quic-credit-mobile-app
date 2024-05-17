import 'package:flutter/gestures.dart';

import '/exports/exports.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, controller, c) {
          return AuthBody(
            child: Form(
              child: ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  const Space(space: 0.27),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 25, 10, 10),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeightDelta: 8,
                            fontSizeDelta: 6,
                          ),
                    ),
                  ),
                  const Space(space: 0.041),
                  CustomForm(
                    controller: phoneController,
                    labelText: "Phone number",
                    keyboardType: TextInputType.phone,
                    errorText: "Phone number is required",
                    hintText: "07xxx-xxxx-xxx",
                  ),
                  const Space(space: 0.041),
                  CustomButton(
                    onPress: () => Routes.pushPage(Routes.otp),
                    buttonColor: Theme.of(context).colorScheme.primary,
                    text: "Register",
                    buttonRadius: 10,
                    textColor: Colors.white,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "\n\tAlready have an account? ",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 4,
                            ),
                        children: [
                          TextSpan(
                            text: "Login",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Routes.pushPage(
                                    Routes.login,
                                  ),
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  fontWeightDelta: 4,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
