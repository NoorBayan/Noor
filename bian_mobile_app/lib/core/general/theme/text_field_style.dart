import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../util/util.dart';
import 'theme.dart';

/// This class contains all the text field styles used in the app.
class AppTextFieldStyle {
  static TextStyle get helperTextStyle =>
      AppTextStyle.light14.copyWith(color: AppColors.greyColors.c500);

  static TextStyle get hintTextStyle =>
      AppTextStyle.medium12.copyWith(color: AppColors.greyColors.c800);
  //  {
  //   /// return TextStyle for hint text without height (set height to null) to fix hint text alignment issue
  //   return TextStyle(
  //     height: 3.h,
  //     color: AppColors.greyColors.c800,
  //     fontSize: AppTextStyle.medium12.fontSize,
  //     fontWeight: AppTextStyle.medium12.fontWeight,
  //     fontFamily: AppTextStyle.medium12.fontFamily,
  //   );
  // }

  static EdgeInsetsGeometry get contentPadding => EdgeInsetsDirectional.only(
        top: 12.h,
        bottom: 12.h,
        // top: 12.h,
        // bottom: 12.h,
        start: 16.w,
        end: 8.w,
      );

  static TextStyle get textStyle {
    /// return TextStyle for text field without height (set height to null) to fix hint text alignment issue
    // return TextStyle(
    //   color: AppTextStyle.regular16.color,
    //   fontSize: AppTextStyle.regular14.fontSize,
    //   fontWeight: AppTextStyle.regular14.fontWeight,
    //   fontFamily: AppTextStyle.regular14.fontFamily,
    // );
    return AppTextStyle.bold14
        .copyWith(color: AppColors.greyColors.c600, height: 1);
  }

  static TextStyle get errorTextStyle =>
      AppTextStyle.light14.copyWith(color: AppColors.errorColors, height: 1.3);

  static EdgeInsetsGeometry get normalContentPadding =>
      EdgeInsetsDirectional.only(
        top: 16.h,
        bottom: 16.h,
        // top: 12.h,
        // bottom: 12.h,
        start: 16.w,
        end: 8.w,
      );

  static EdgeInsetsGeometry get labelUnderBorderContentPadding =>
      EdgeInsetsDirectional.only(
        top: 20.h,
        bottom: 20.h,
        // top: 12.h,
        // bottom: 12.h,
        start: 16.w,
        end: 8.w,
      );

  static InputBorder get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.inputFormColor,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(12.r),
      );

  // static InputBorder get focusedBorder => OutlineInputBorder(
  //       borderSide: BorderSide(
  //         color: AppColors.secondaryColor,
  //         width: 1.w,
  //       ),
  //       borderRadius: BorderRadius.circular(12.r),
  //     );
  static InputBorder get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColors,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(12.r),
      );

  static InputBorder get normalBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.greyColors.c200,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(12.r),
      );

  static InputBorder get border => OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyColors.c200),
        borderRadius: BorderRadius.circular(12.r),
      );

  static InputBorder get disabledBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.r),
      );

  static InputBorder get errorBorder => OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.errorColors,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.r),
      );

  static InputBorder get focusedErrorBorder => OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.errorColors,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.r),
      );

  static InputBorder get withOutBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.r),
      );

  static InputBorder get testBorder => OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondaryColors,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(12.r),
      gapPadding: 0);

  static MaskTextInputFormatter get phoneFormatter => MaskTextInputFormatter(
      mask: '## ### ####', filter: {"#": RegExp(r'[0-9]')});

  static MaskedInputFormatter get phoneFormatter2 =>
      MaskedInputFormatter('00 000 000');

  static MaskedInputFormatter get phoneFormatterWithCode =>
      MaskedInputFormatter('00000 00 000 0000');

  // static MaskedInputFormatter get thousandsFormatter => MaskedInputFormatter( // TODO: fix this
  //       '###,###,###,###,###',
  //     );

  static TextInputFormatter get thousandsFormatter2 =>
      ThousandsSeparatorInputFormatter();

  static MaskedInputFormatter get userNameFormatter => MaskedInputFormatter(
        '@#############################################',
      );
}
