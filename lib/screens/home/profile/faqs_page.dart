import 'dart:developer';

import '/exports/exports.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  List<Faq> faqs = [
    Faq(
      question: "What is QuicCredit?",
      answer:
          "QuicCredit is a mobile loan application that allows you to access loans instantly.",
      isExpanded: true,
    ),
    Faq(
      question: "How do I apply for a loan?",
      answer:
          "To apply for a loan, you need to download the QuicCredit app from the Google Play Store, create an account, and apply for a loan.",
      isExpanded: false,
    ),
    Faq(
      question: "How do I repay my loan?",
      answer:
          "You can repay your loan through the QuicCredit app using mobile money.",
      isExpanded: false,
    ),
    Faq(
      question: "How do I contact QuicCredit?",
      answer:
          "You can contact QuicCredit through the app or by sending an email to QuicCredit",
      isExpanded: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Frequently Asked Questions",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionPanelList(
              elevation: 4,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  faqs[index].isExpanded = !faqs[index].isExpanded;
                  log(faqs[index].isExpanded.toString());
                });
              },
              children: faqs.map<ExpansionPanel>((Faq faq) {
                return ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      leading: Icon(
                        Icons.question_answer,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        faq.question,
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 5,
                            ),
                      ),
                    );
                  },
                  body: ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(
                      faq.answer,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  isExpanded: faq.isExpanded,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Faq class
class Faq {
  final String question;
  final String answer;
  bool isExpanded;
  Faq({
    required this.question,
    required this.answer,
    required this.isExpanded,
  });
}
