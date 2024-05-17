import '/exports/exports.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  // password controllers
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer(builder: (context, controller, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
                child: Text(
                  'Ensure that the password is secure',
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 2,
                      ),
                ),
              ),
              const Space(space: 0.041),
              // field for password
              CustomForm(
                labelText: "Password",
                errorText: "Password is required",
                hintText: "***********",
                obscureText: true,
                controller: passwordController,
              ),
              const Space(space: 0.030),
              // field for password
              CustomForm(
                labelText: "Confirm Password",
                errorText: "Password is required",
                hintText: "***********",
                obscureText: true,
                controller: confirmPasswordController,
              ),

              const Space(space: 0.030),
              CustomButton(
                onPress: () {
                  Routes.pushPage(Routes.completeProfile);
                },
                text: "Continue",
                buttonColor: Theme.of(context).colorScheme.primary,
                buttonRadius: 10,
                textColor: Colors.white,
              ),
            ],
          );
        }),
      ),
    );
  }
}
