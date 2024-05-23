import 'package:flutter/gestures.dart';

import '/exports/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool _toggleVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer(
            builder: (context, controller, c) {
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineLarge!.apply(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeightDelta: 4,
                              fontSizeDelta: 10,
                            ),
                      ),
                    ),
                    const Space(space: 0.041),
                    // field for email
                    CustomForm(
                      controller: phoneController,
                      labelText: "Phone number",
                      keyboardType: TextInputType.phone,
                      errorText: "Phone number is required",
                      hintText: "07xxx-xxxx-xxx",
                    ),
                    const Space(space: 0.030),
                    // field for password
                    CustomForm(
                      controller: passwordController,
                      obscureText: !_toggleVisibility,
                      labelText: "Password",
                      errorText: "Password is required",
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: Icon(
                          !_toggleVisibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      hintText: "***********",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Routes.pushPage(
                            Routes.forgoPassword,
                          ),
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  fontWeightDelta: 3,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      onPress: () => Routes.replacePage(
                        const IndexHome(),
                      ),
                      buttonColor: Theme.of(context).colorScheme.primary,
                      text: "Login",
                      buttonRadius: 10,
                      textColor: Colors.white,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "\n\tDon't have an account? ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Routes.pushPage(
                                    Routes.createAccount,
                                  ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
