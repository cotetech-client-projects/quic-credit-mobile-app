import '/exports/exports.dart';

class ListWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const ListWidget({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.apply(
              fontWeightDelta: 5,
              fontSizeDelta: 2,
            ),
      ),
      trailing: trailing,
    );
  }
}
