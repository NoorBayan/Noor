import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/general/theme/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color? baseColor;
  final bool enabled;
  final ShimmerDirection? shimmerDirection;
  final Widget? customShape;

  ShimmerWidget.customShapeByWidget({
    Key? key,
    required this.customShape,
    this.baseColor,
    this.shimmerDirection,
    this.enabled = true,
  })  : shapeBorder = const CircleBorder(),
        width = 0,
        height = 0;

  ShimmerWidget.stars({
    super.key,
    double size = 24,
    int count = 5,
    EdgeInsets padding = const EdgeInsets.only(right: 2),
    this.baseColor,
    this.shimmerDirection,
    this.enabled = true,
  })  : width = size,
        height = size,
        shapeBorder = const CircleBorder(),
        customShape = Row(
          children: [
            for (int i = 0; i < count; i++)
              Padding(
                padding: padding,
                child: Icon(
                  Icons.star_rounded,
                  size: size,
                  color: Colors.white,
                ),
              ),
          ],
        );

  ShimmerWidget.square({
    super.key,
    required double size,
    double borderRadius = 2,
    this.enabled = true,
    this.shimmerDirection,
    this.baseColor,
  })  : width = size,
        height = size,
        shapeBorder = RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        customShape = null;

  ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.enabled = true,
    this.shimmerDirection,
    double borderRadius = 2,
    this.baseColor,
  })  : shapeBorder = RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        customShape = null;

  const ShimmerWidget.circular({
    super.key,
    required double size,
    this.enabled = true,
    this.shimmerDirection,
    this.baseColor,
  })  : shapeBorder = const CircleBorder(),
        width = size,
        height = size,
        customShape = null;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.deactivatedButtonsColor,
      highlightColor: AppColors.backgroundColor,
      direction: shimmerDirection ?? ShimmerDirection.rtl,
      enabled: enabled,
      child: customShape ??
          Container(
            width: width,
            height: height,
            decoration: ShapeDecoration(
              color: AppColors.secondaryButtonColor,
              shape: shapeBorder,
            ),
          ),
    );
  }
}
