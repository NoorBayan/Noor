import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/general/asset_path/app_icons.dart';
import '../../core/general/theme/theme.dart';
import 'custom_icon.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    Key? key,
    required this.onTap,
    this.iconBackgroundColor,
    this.iconColor,
  }) : super(key: key);

  final Function()? onTap;
  final Color? iconBackgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            context.pop();
          },
      child: Container(
        height: 36.r,
        width: 36.r,
        decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: AppDimensions.smoothBorderRadius,
            ),
            color: iconBackgroundColor ?? AppColors.whiteColor),
        child: Center(
          child: CustomIcon(
              iconPath: AppIcons.backArrow,
              width: 12.r,
              height: 10.r,
              isWithDirectionality: true,
              iconColor: iconColor),
        ),
      ),
    );
  }
}
