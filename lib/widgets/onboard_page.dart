import '/exports/exports.dart';
class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel pageModel;

 const OnboardingPage({required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pageModel.imageUrl,
            height: 200, // Adjust height as needed
          ),
         const SizedBox(height: 30),
          Text(
            pageModel.title,
            style: GoogleFonts.nunitoSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            pageModel.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
