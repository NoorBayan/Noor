import 'package:flutter/material.dart';

import 'theme.dart';

class AppIconStyle {
  static BoxDecoration get decorationBackgroundColor => BoxDecoration(
        color: AppColors.thirdColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.w),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.dropShadow.withOpacity(0.1),
        //     offset: Offset(0, 4.w),
        //     blurRadius: 12.w,
        //   ),
        // ],
      );
}
