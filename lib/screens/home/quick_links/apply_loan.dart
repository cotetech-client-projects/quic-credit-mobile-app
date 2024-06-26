import 'package:quic_credit/widgets/space.dart';

import '/exports/exports.dart';

class ApplyLoan extends StatefulWidget {
  const ApplyLoan({super.key});

  @override
  State<ApplyLoan> createState() => _ApplyLoanState();
}

class _ApplyLoanState extends State<ApplyLoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Apply for a Loan',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Space(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Approved Loan Amount',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "30,000",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0.0),
                child: Divider(),
              )
            ],
          ),
        );
      }),
    );
  }
}
