import 'package:flutter/material.dart';

import '../../../../../../core/general/asset_path/app_fonts.dart';
import '../../../../../../core/general/theme/app_colors.dart';
import '../../../../../../core/general/theme/theme.dart';

class TwoSideCardWidget extends StatelessWidget {
  const TwoSideCardWidget({super.key, this.title, this.subtitleAr, this.subtitle1, this.subtitle2});
  final String? title;
  final String? subtitleAr;
  final String? subtitle1;
  final String? subtitle2;
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
              textAlign: TextAlign.start,
            ),
          ],
          if (subtitleAr != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  subtitleAr!,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.bold18.copyWith(
                      color: AppColors.fontPrimaryColor,
                      height: 1.3),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ],
          if (subtitle1 != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  subtitle1!,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.bold16.copyWith(
                      color: AppColors.fontPrimaryColor,
                      fontFamily: AppFonts.gabarito,
                      height: 1.3),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
          if (subtitle2 != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  subtitle2!,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.bold18.copyWith(
                      color: AppColors.fontPrimaryColor,
                      fontFamily: AppFonts.gabarito,
                      height: 1.3),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
