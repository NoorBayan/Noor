import '../../../core/general/theme/theme.dart';
import 'package:flutter/material.dart';

class WordInfoItem extends StatelessWidget {
  const WordInfoItem(
      {super.key, required this.title, this.subtitle1, this.subtitle2});
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
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: AppTextStyle.bold20.copyWith(
                color: AppColors.fontSecondaryColor,
                height: 1.3
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (subtitle1 != null) ...[
            Text(
              textDirection: TextDirection.ltr,
              subtitle1!,
              style: AppTextStyle.bold20.copyWith(
                color: AppColors.fontPrimaryColor,
                height: 1.3
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (subtitle2 != null) ...[
            Text(
              subtitle2!,
               textDirection: TextDirection.ltr,
              style: AppTextStyle.bold20.copyWith(
                color: AppColors.fontPrimaryColor,
                 height: 1.3
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
