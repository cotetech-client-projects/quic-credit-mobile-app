import '/exports/exports.dart';

class QuickLinkWidget extends StatelessWidget {
  final double height;
  final Color color;
  final String title;
  final String svgPath;
  final VoidCallback onTap;
  const QuickLinkWidget(
      {super.key,
      required this.height,
      required this.color,
      required this.title,
      required this.svgPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: onTap,
      child: Card(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: AutoSizeText(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Colors.white,
                      fontWeightDelta: 5,
                    ),
                maxFontSize: 19,
                minFontSize: 5,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
