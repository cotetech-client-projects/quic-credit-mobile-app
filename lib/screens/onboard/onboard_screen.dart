import '/exports/exports.dart';

class OnboardingScreen extends StatelessWidget {
 OnboardingScreen({super.key});
  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: 'Easy Access',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl: 'assets/imgs/easy_access.jpg', // Replace with your image path
    ),
    OnboardingPageModel(
      title: 'Interest',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl: 'assets/imgs/interest.jpg', // Replace with your image path
    ),
    OnboardingPageModel(
      title: 'Flexible Payment',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl:
          'assets/imgs/flexible_payment.png', // Replace with your image path
    ),
    OnboardingPageModel(
      title: 'Speedy Loan Process',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl:
          'assets/imgs/speedy_loan_process.png', // Replace with your image path
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(
            pageModel: pages[index],
          );
        },
      ),
    );
  }
}
