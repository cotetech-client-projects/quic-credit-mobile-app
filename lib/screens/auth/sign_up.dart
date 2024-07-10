import 'dart:developer';

import 'package:flutter/gestures.dart';

import '/exports/exports.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // controllers
  bool passKey = false;
  bool confirmKey = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, controller, c) {
          return Form(
            key: formKey,
            child: Consumer<AuthController>(builder: (context, auth, x) {
              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  const Space(space: 0.07),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 25, 10, 10),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            color: Theme.of(context).primaryColor,
                            fontWeightDelta: 18,
                            fontSizeDelta: 6,
                          ),
                    ),
                  ),
                  const Space(space: 0.041),
                  CustomForm(
                    controller: usernameController,
                    labelText: "Name",
                    readOnly: auth.authLoading,
                    keyboardType: TextInputType.text,
                    hintText: "Enter your first-name and last-name",
                  ),
                  CustomForm(
                    controller: phoneController,
                    labelText: "Phone Number",
                    readOnly: auth.authLoading,
                    keyboardType: TextInputType.phone,
                    hintText: "07xxx-xxxx-xxxx",
                  ),
                  CustomForm(
                    controller: emailController,
                    readOnly: auth.authLoading,
                    labelText: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                    hintText: "example@gmail.com",
                  ),
                  CustomForm(
                    controller: passwordController,
                    labelText: "Password",
                    keyboardType: TextInputType.text,
                    obscureText: !passKey,
                    readOnly: auth.authLoading,
                    hintText: "***************",
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          passKey = !passKey;
                        });
                      },
                      icon: Icon(!passKey
                          ? Icons.visibility_off
                          : Icons.remove_red_eye),
                    ),
                  ),
                  CustomForm(
                    controller: confirmController,
                    labelText: "Confirm Password",
                    keyboardType: TextInputType.text,
                    obscureText: !confirmKey,
                    readOnly: auth.authLoading,
                    hintText: "***************",
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmKey = !confirmKey;
                        });
                      },
                      icon: Icon(!confirmKey
                          ? Icons.visibility_off
                          : Icons.remove_red_eye),
                    ),
                  ),
                  // const Space(space: 0.01),
                  CustomButton(
                    buttonHeight: 55,
                    loading: auth.authLoading,
                    onPress: () {
                      auth.authLoading = true;
                      if (formKey.currentState!.validate()) {
                        auth.authLoading = true;
                        if (passwordController.text != confirmController.text) {
                          auth.authLoading = false;
                          showMessage(
                            "Passwords do not match",
                            color: Colors.red,
                          );
                          return;
                        } else {
                          AuthService().register({
                            "role_id": 2,
                            "first_name":
                                usernameController.text.split(" ").first,
                            "last_name":
                                usernameController.text.split(" ").last,
                            "email": emailController.text,
                            "contact": phoneController.text,
                            "password": passwordController.text,
                            "password_confirmation": confirmController.text,
                          }).then((value) {
                            auth.authLoading = false;
                            showMessage(value);
                            Routes.pushPage(Routes.login);
                          }).onError((e, stack) {
                            auth.authLoading = false;
                            showMessage(e.toString(), color: Colors.red);
                          });
                        }
                      } else {
                        auth.authLoading = false;
                      }
                    },
                    buttonColor: Theme.of(context).primaryColor,
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
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
