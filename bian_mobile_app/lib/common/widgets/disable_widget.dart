import 'package:flutter/material.dart';

class DisableWidget extends StatelessWidget {
  const DisableWidget({
    Key? key,
    required this.child,
    this.condition = true,
    this.withOpacity = true,
    this.opacity = 0.6,
  }) : super(key: key);
  final Widget child;
  final bool condition;
  final bool withOpacity;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: condition,
      child: withOpacity
          ? Opacity(
              opacity: !condition ? 1 : opacity,
              child: child,
            )
          : child,
    );
  }
}
