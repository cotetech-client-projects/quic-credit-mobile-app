import '/exports/exports.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: 'Easy Access',
      description:
          'QuicCredit allows you to access loans easily up to a certain amount',
      imageUrl: 'assets/imgs/easy_access.jpg', // Replace with your image path
    ),
    OnboardingPageModel(
      title: 'Interest',
      description:
          'Interest rates between the range of 2.5 and 30% which is dependent on the loan amount.',
      imageUrl: 'assets/imgs/interest.jpg', // Replace with your image path
    ),
    OnboardingPageModel(
      title: 'Flexible Payment',
      description:
          'Repayment of fees with tenors between the period of 2 to 96 weeks.',
      imageUrl:
          'assets/imgs/flexible_payment.jpg', // Replace with your image path
    ),
    OnboardingPageModel(
      title: 'Speedy Loan Process',
      description:
          'Very fast loan application processes with less back and fourth runnings and paperwork.',
      imageUrl:
          'assets/imgs/speedy_loan_process.jpg', // Replace with your image path
    ),
  ];
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
     statusBarIconBrightness:Brightness.dark,
    ),
  );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(
            pageModel: pages[index],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 130,
        child: Column(children: [
          SmoothPageIndicator(
            controller: pageController,
            count: pages.length,
            axisDirection: Axis.horizontal,
            effect: WormEffect(
              activeDotColor: Theme.of(context).colorScheme.primary,
              // // dotHeight: 15,
              // dotWidth: 15,
              type: WormType.normal,
            ),
          ),
          const Space(),
          SizedBox(
            width: 70,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                if (pageController.page == pages.length - 1) {
                  Routes.pushReplace(Routes.login);
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: const Center(
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
