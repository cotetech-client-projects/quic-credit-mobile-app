import '/exports/exports.dart';
import 'widgets/list_widget.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 3,
              ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight * 0.5,
          child: const Card(
            elevation: 0,
            margin: EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: [
                Space(space: 0.02),
                ListWidget(title: "Email", icon: Icons.email_outlined),
                ListWidget(title: "Tel", icon: Icons.phone_outlined),
                ListWidget(title: "Whatsapp", icon: Icons.whatshot_outlined),
                Space(space: 0.02),
              ],
            ),
          ),
        );
      }),
    );
  }
}
