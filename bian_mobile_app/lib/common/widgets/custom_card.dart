import 'package:flutter/material.dart';

import '../../core/general/theme/theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      required this.child,
      this.width,
      this.height,
      this.containerColor,
      this.margin,
      this.padding,
      this.isWithShadow = true})
      : super(key: key);
  final double? width;
  final double? height;
  final Widget child;
  final Color? containerColor;
  final bool isWithShadow;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: containerColor ?? AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: isWithShadow ? AppTheme.primaryShadow : null,
      ),
      child: child,
    );
  }
}
