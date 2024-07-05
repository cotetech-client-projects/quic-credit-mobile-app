import 'package:flutter/gestures.dart';
import '/services/auth_service.dart';
import '/exports/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool _toggleVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        forceMaterialTransparency: true,
      ),
      body: Consumer(
        builder: (context, controller, c) {
          return Form(
            key: formKey,
            child: Consumer<AuthController>(builder: (context, auth, x) {
              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  const Space(
                    space: 0.0,
                  ),
                  SvgPicture.asset(
                    "assets/svgs/login.svg",
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            color: Theme.of(context).primaryColor,
                            fontWeightDelta: 4,
                            fontSizeDelta: 10,
                          ),
                    ),
                  ),
                  const Space(space: 0.041),
                  // field for email
                  CustomForm(
                    controller: phoneController,
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    hintText: "example@gmail.com",
                    readOnly: auth.authLoading,
                    // icon: Icon(Icons.person),
                  ),

                  // field for password
                  CustomForm(
                    controller: passwordController,
                    obscureText: !_toggleVisibility,
                    labelText: "Password",
                    readOnly: auth.authLoading,
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
                    loading: auth.authLoading,
                    onPress: () {
                      auth.authLoading = true;
                      if (formKey.currentState!.validate()) {
                        AuthService().login({
                          "email": phoneController.text,
                          "password": passwordController.text,
                        }).then((value) {
                          showMessage(
                            value,
                            color: Colors.green,
                          );
                          auth.authLoading = false;
                          // route to home
                          Routes.replacePage(
                            const IndexHome(),
                          );
                        }).onError((error, stackTrace) {
                          showMessage(
                            error.toString(),
                            color: Colors.red,
                          );
                          auth.authLoading = false;
                        });
                      } else {
                        auth.authLoading = false;
                      }
                    },
                    buttonColor: Theme.of(context).primaryColor,
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
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
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
