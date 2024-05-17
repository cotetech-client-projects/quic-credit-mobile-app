import '/exports/exports.dart';
import '/screens/auth/widgets/design_widget.dart';

class AuthBody extends StatelessWidget {
  final Widget child;
  const AuthBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 0,
          right: 0,
          child: DesignWidget(),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: DesignWidget(
            angle: 190,
            offset: Offset(0, 190),
          ),
        ),
        child,
      ],
    );
  }
}
