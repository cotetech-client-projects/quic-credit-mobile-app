import '/exports/exports.dart';

class ProfileCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget icon;
  const ProfileCard(
      {super.key, required this.text, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade200
              : Colors.white30,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade200
                : Colors.white30,
            blurRadius: 9,
            spreadRadius: 0.5,
            offset: const Offset(3, 3),
          )
        ],
      ),
      child: ListTile(
        title: Text(text),
        leading: icon,
        onTap: onTap,
      ),
    );
  }
}
