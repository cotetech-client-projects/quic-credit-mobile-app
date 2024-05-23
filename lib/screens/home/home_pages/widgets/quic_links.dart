import '/exports/exports.dart';

class QuickLinkWidget extends StatelessWidget {
  final double height;
  final Color color;
  final String title;
  final String svgPath;
  const QuickLinkWidget(
      {super.key,
      required this.height,
      required this.color,
      required this.title,
      required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color.withAlpha(150),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svgs/$svgPath",
            height: height,
            color: Colors.white,
          ),
          const Space(space: 0.020),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.apply(
                  color: Colors.white,
                  fontWeightDelta: 5,
                ),
          ),
        ],
      ),
    );
  }
}
