import 'package:flutter/material.dart';

import 'theme.dart';

class AppButtonStyle {
  static TextStyle get defaultTextStyle => AppTextStyle.medium16.copyWith(color: AppColors.whiteColor);

  static TextStyle get secondaryTextStyle => AppTextStyle.medium16.copyWith(color: AppColors.greyColors.c800);
  static TextStyle get thirdTextStyle => AppTextStyle.medium16.copyWith(color: AppColors.whiteColor);

  static Color get defaultPrimaryColor => AppColors.thirdColor;
  static Color get defaultSecondaryColor => AppColors.primaryColors;

  static Color getActiveColorByPrimary(Color primaryColor) {
    if (primaryColor == AppColors.primaryColors) {
      return AppColors.primaryColorActive;
  } else if (primaryColor == AppColors.thirdColor) {
      return AppColors.secondaryColorActive;
    } else if (primaryColor == AppColors.errorColors) {
      return AppColors.errorColorActive;
    }
    return primaryColor;
  }

  static ButtonStyle primaryButtonStyle(
      {Color primaryColor = AppColors.thirdColor,
      bool withOutElevation = false,
      isWithBorder = false}) {
    return ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      // padding: EdgeInsets.only( bottom: 4.h),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadius),
      textStyle: defaultTextStyle,
      onPrimary: getActiveColorByPrimary(primaryColor),
      side: isWithBorder ? const BorderSide(color: AppColors.fontColor) : null,
      elevation: withOutElevation ? 0 : 2.r,
      shadowColor: primaryColor.opacity != 1 ? AppColors.transparent : null,
    );
  }

  static ButtonStyle get primaryButtonTextSytle => TextButton.styleFrom(
        primary: AppColors.thirdColor,
        // padding: EdgeInsets.only( bottom: 4.h),
        alignment: Alignment.center,
        side: const BorderSide(color: AppColors.errorColors),
        shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadius),
        textStyle: defaultTextStyle,
      );

  static ButtonStyle get primaryErrorButtonStyle => ElevatedButton.styleFrom(
        primary: AppColors.errorColors,
        // padding: EdgeInsets.only( bottom: 4.h),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadius),
        textStyle: defaultTextStyle,
        onPrimary: AppColors.errorColorActive,
      );

  static ButtonStyle get outlinedButtonSytle => OutlinedButton.styleFrom(
        primary: AppColors.thirdColor,
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: AppDimensions.borderRadius),
        textStyle: defaultTextStyle,
        side: const BorderSide(color: AppColors.thirdColor),
      );
}
