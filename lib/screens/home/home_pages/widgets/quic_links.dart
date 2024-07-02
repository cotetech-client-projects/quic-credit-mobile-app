import '/exports/exports.dart';

class QuickLinkWidget extends StatelessWidget {
  final double height;
  final Color color;
  final String title;
  final Duration duration;
  final String svgPath;
  final Widget nextPage;
  const QuickLinkWidget({
    super.key,
    required this.height,
    required this.color,
    required this.title,
    required this.svgPath,
    required this.nextPage,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  Widget build(BuildContext context) {
    return Routes.animateTo(
      openWidget: nextPage,
      closedWidget: Card(
        elevation: 0,
        color: color.withAlpha(250),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAnimatedWidget(
              child: SvgPicture.asset(
                "assets/svgs/$svgPath",
                height: height,
                color: Colors.white,
              ),
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
