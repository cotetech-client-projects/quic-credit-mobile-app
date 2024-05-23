import '/exports/exports.dart';

class IndexActivity extends StatefulWidget {
  const IndexActivity({super.key});

  @override
  State<IndexActivity> createState() => _IndexActivityState();
}

class _IndexActivityState extends State<IndexActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Activity"),
      ),
    );
  }
}
