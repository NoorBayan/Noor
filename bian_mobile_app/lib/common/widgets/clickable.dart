import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  const Clickable({Key? key, required this.onTap, required this.child}) : super(key: key);
  final VoidCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
