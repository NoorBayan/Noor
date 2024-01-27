import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/general/theme/app_colors.dart';
import '../../core/general/theme/dimensions.dart';
import 'clickable.dart';
import 'custom_icon.dart';

class BorderedIcon extends StatelessWidget {
  const BorderedIcon(
      {super.key,
      required this.iconPath,
      this.iconSize,
      this.iconWidth,
      this.iconHeight,
      this.size,
      this.width,
      this.height,
      this.onTap,
      this.iconColor});
  final String iconPath;
  final double? iconSize;
  final double? iconWidth;
  final double? iconHeight;
  final double? size;
  final double? width;
  final double? height;
  final Color? iconColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final width = size ?? this.width ?? 48.r;
    final height = size ?? this.height ?? 48.r;
    return Clickable(
      onTap: onTap ?? () {},
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: AppDimensions.smoothBorderRadius,
          ),
          color: AppColors.whiteColor.withOpacity(.1),
        ),
        child: Center(
          child: CustomIcon(
            iconPath: iconPath,
            height: iconHeight ?? 24.r,
            width: iconWidth ?? 24.r,
            iconColor: iconColor,
          ),
        ),
      ),
    );
  }
}
