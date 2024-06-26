import '/exports/exports.dart';
import 'dart:math' as math;

class CustomAnimatedWidget extends StatefulWidget {
  final Widget child;
  final bool shake;
  final bool zoom;
  final Duration duration;
  const CustomAnimatedWidget({
    super.key,
    this.duration = const Duration(milliseconds: 2000),
    required this.child,
    this.shake = true,
    this.zoom = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomAnimatedWidgetState createState() => _CustomAnimatedWidgetState();
}

class _CustomAnimatedWidgetState extends State<CustomAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _shakeAnimation = Tween<double>(begin: -math.pi / 36, end: math.pi / 36)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 0.6, curve: ShakeCurve()),
    ));

    _zoomAnimation =
        Tween<double>(begin: .80, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.5, curve: Curves.easeInOut),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return widget.shake
            ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateZ(_shakeAnimation.value),
                child: widget.child,
              )
            : widget.zoom
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(
                          _zoomAnimation.value,
                          List.generate(2, (x) => _zoomAnimation.value)
                              .reduce((a, b) => (a + b) - b)),
                    child: widget.child,
                  )
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(_zoomAnimation.value)
                      ..rotateZ(_shakeAnimation.value),
                    child: widget.child,
                  );
      },
    );
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return math.cos(t * math.pi * 8);
  }
}
