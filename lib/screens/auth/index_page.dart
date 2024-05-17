import "/exports/exports.dart";

class IndexAuthPage extends StatefulWidget {
  const IndexAuthPage({super.key});

  @override
  State<IndexAuthPage> createState() => _IndexAuthPageState();
}

class _IndexAuthPageState extends State<IndexAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/get_started.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black,
              ],
              // stops: [0.0, 0.54, 0.37, 0.9],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "QuicCredit",
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: " \n",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "  Get Started\n".toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    10,
                    10,
                    10,
                    50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: CustomButton(
                          buttonColor: Theme.of(context).colorScheme.primary,
                          textColor: Colors.white,
                          onPress: () => Routes.pushPage(Routes.login),
                          text: "Login",
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: CustomButton(
                          buttonColor: Colors.green.shade400.withOpacity(0.78),
                          fontWeight: FontWeight.w900,
                          textColor: Colors.white,
                          onPress: () => Routes.pushReplace(
                            Routes.createAccount,
                          ),
                          text: "Register",
                        ),
                      ),
                    ],
                  ),
                ),
                const Space(
                  space: 0,
                ),
                Center(
                  child: Text(
                    "Terms and Conditions Apply",
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: Colors.white,
                          fontWeightDelta: 2,
                        ),
                  ),
                ),
                const Space(
                  space: 0.051,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
