import 'package:flutter/material.dart';

class NoGlowScrollBehaviorWrapper extends StatelessWidget {
  const NoGlowScrollBehaviorWrapper({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: _NoGlowScrollBehavior(), child: child);
  }
}

class _NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
