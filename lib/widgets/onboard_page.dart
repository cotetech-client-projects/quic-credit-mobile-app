import '/exports/exports.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel pageModel;

  const OnboardingPage({required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black45,
            Colors.black,
          ],
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pageModel.imageUrl),
        ),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black12,
              Colors.black,
            ],
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 230),
            Text(
              pageModel.title,
              style: Theme.of(context).textTheme.headlineLarge!.apply(
                    color: Colors.white,
                    fontWeightDelta: 10,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              pageModel.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                    color: Colors.grey.shade300,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
