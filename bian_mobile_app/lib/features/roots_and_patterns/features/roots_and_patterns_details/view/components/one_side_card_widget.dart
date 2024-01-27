import 'package:flutter/material.dart';

import '../../../../../../core/general/asset_path/app_fonts.dart';
import '../../../../../../core/general/theme/app_colors.dart';
import '../../../../../../core/general/theme/theme.dart';

class OneSideCardWidget extends StatelessWidget {
  const OneSideCardWidget({super.key, this.title, this.subtitle});
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColors,
        boxShadow: AppTheme.primaryShadow,
        borderRadius: BorderRadius.circular(26),
      ),
      width: 1.sw,
      margin: const EdgeInsets.all(1),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              textDirection: TextDirection.ltr,
              title!,
              style: AppTextStyle.bold20.copyWith(
                  color: AppColors.fontSecondaryColor,
                  fontFamily: AppFonts.gabarito,
                  height: 1.3),
              textAlign: TextAlign.center,
            ),
          ],
          if (subtitle != null) ...[
            Text(
              subtitle!,
              textDirection: TextDirection.ltr,
              style: AppTextStyle.bold16.copyWith(
                  color: AppColors.fontPrimaryColor,
                  fontFamily: AppFonts.gabarito,
                  height: 1.3),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
