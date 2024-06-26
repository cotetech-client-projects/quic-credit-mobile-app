import '/exports/exports.dart';

class DesignWidget extends StatelessWidget {
  final Offset offset;
  final double angle;
  const DesignWidget(
      {super.key, this.offset = const Offset(20, -170), this.angle = 15});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: ((angle * 3.14) / 180),
        child: Container(
            width: 450,
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(200),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.43),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(200),
                ),
              ),
            )),
      ),
    );
  }
}
