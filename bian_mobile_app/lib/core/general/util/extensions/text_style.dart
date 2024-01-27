import 'package:flutter/material.dart';
import 'num.dart';

extension CustomSizeExtension on TextStyle {
  /// get actual line height 
  double get actualHeight => (1 * fontSize.orOne).toDouble().roundToDouble();
}
