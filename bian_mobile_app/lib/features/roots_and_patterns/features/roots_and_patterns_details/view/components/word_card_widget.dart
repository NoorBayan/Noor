import 'package:bian_mobile_app/core/general/asset_path/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/general/theme/theme.dart';

class WordCardWidget extends StatelessWidget {
  const WordCardWidget({super.key, required this.title, required this.subtitle1, required this.subtitle2});
  final String? title;
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
      margin: const EdgeInsets.all(1),
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title!,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.bold24
                      .copyWith(
                        
                        color: AppColors.primaryColors, height: 1.3, ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ],
          if (subtitle1 != null) ...[
            Text(
              textDirection: TextDirection.ltr,
              subtitle1!,
              style: AppTextStyle.bold20
                  .copyWith(color: AppColors.fontPrimaryColor,fontFamily: AppFonts.gabarito, height: 1.3),
              textAlign: TextAlign.center,
            ),
          ],
          if (subtitle2 != null) ...[
            Text(
              subtitle2!,
              textDirection: TextDirection.ltr,
              style: AppTextStyle.bold20
                  .copyWith(color: AppColors.fontPrimaryColor, fontFamily: AppFonts.gabarito, height: 1.3),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
