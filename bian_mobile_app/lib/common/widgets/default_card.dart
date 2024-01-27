import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../../core/general/theme/theme.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.shadows,
    this.color,
    this.height,
    this.width,
    this.isWithShadow = true,
    this.borderRadius,
    this.borderSide,
  });

  final Widget child;
  final bool isWithShadow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? height;
  final double? width;
  final BorderSide? borderSide;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? shadows;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
      decoration: ShapeDecoration(
        color: color ?? AppColors.whiteColor,
        shadows: (isWithShadow ? shadows : null) ??
            const [
              BoxShadow(
                color: Color(0x1CE7E7E7),
                blurRadius: 20,
                offset: Offset(0, 3),
              )
            ],
        shape: SmoothRectangleBorder(
          borderRadius: AppDimensions.smoothBorderRadius,
          side: borderSide ?? BorderSide.none,
        ),
      ),
      child: child,
    );
  }
}
