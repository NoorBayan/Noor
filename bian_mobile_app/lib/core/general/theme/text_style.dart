import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../asset_path/app_fonts.dart';
import 'theme.dart';

class AppTextStyle {
  static const FontWeight boldFontWeight = FontWeight.w700;
  static const FontWeight semiBoldFontWeight = FontWeight.w600;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight lightFontWeight = FontWeight.w300;

  static const Color mainColorFont = AppColors.fontPrimaryColor;

  static Widget wrapAppToStopTextScaleFactor(
      {required Widget child, required BuildContext context}) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0,
      ),
      child: child,
    );
  }

  static Widget wrapAppToRemoveFirstAndLastLineHeight({required Widget child}) {
    return DefaultTextHeightBehavior(
      textHeightBehavior: AppTextStyle.removeFirstAndLastLineHeight,
      child: child,
    );
  }

  static TextHeightBehavior get removeFirstAndLastLineHeight =>
      const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      );

  static TextStyle _baseStyleFont({
    required FontWeight fontWeight,
    required double fontSize,
    double? height,
    String? fontFamily,
    double? lineHeight,
  }) =>
      TextStyle(
        fontFamily: fontFamily ?? AppFonts.cairo,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
        height: _FontHeightConstants.getHeightFromLineHeight(
            fontSize, fontWeight, lineHeight),
        color: mainColorFont,
      );
// 8
  static TextStyle get bold8 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 8.0,
      );

  static TextStyle get semiBold8 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 8.0,
      );

  static TextStyle get regular8 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 8.0,
      );

  static TextStyle get light8 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 8.0,
      );

  static TextStyle get medium8 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 8.0,
      );

// 10
  static TextStyle get bold10 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 10.0,
      );

  static TextStyle get semiBold10 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 10.0,
      );

  static TextStyle get regular10 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 10.0,
      );

  static TextStyle get light10 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 10.0,
      );

  static TextStyle get medium10 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 10.0,
        lineHeight: 14,
      );

// 12
  static TextStyle get bold12 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 12.0,
      );

  static TextStyle get semiBold12 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 12.0,
      );

  static TextStyle get regular12 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 12.0,
      );

  static TextStyle get light12 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 12.0,
      );

  static TextStyle get medium12 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 12.0,
        lineHeight: 14,
      );

// 13
  static TextStyle get bold13 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 13.0,
      );
  static TextStyle get semiBold13 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 13.0,
      );

  static TextStyle get regular13 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 13.0,
      );

  static TextStyle get light13 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 13.0,
      );

  static TextStyle get medium13 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 13.0,
      );
// 14
  static TextStyle get bold14 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 14.0,
        lineHeight: 18,
      );
  static TextStyle get semiBold14 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 14.0,
      );

  static TextStyle get regular14 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 14.0,
      );

  static TextStyle get light14 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 14.0,
      );

  static TextStyle get medium14 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 14.0,
        lineHeight: 18,
      );

// 15
  static TextStyle get bold15 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 15.0,
      );
  static TextStyle get semiBold15 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 15.0,
      );

  static TextStyle get regular15 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 15.0,
      );

  static TextStyle get light15 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 15.0,
      );

  static TextStyle get medium15 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 15.0,
      );

// 16
  static TextStyle get bold16 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 16.0,
        lineHeight: 26,
      );
  static TextStyle get semiBold16 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 16.0,
      );

  static TextStyle get regular16 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 16.0,
        lineHeight: 22,
      );

  static TextStyle get light16 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 16.0,
      );

  static TextStyle get medium16 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 16.0,
        lineHeight: 24,
      );

// 18
  static TextStyle get bold18 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 18.0,
        lineHeight: 28,
      );
  static TextStyle get semiBold18 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 18.0,
      );

  static TextStyle get regular18 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 18.0,
      );

  static TextStyle get light18 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 18.0,
      );

  static TextStyle get medium18 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 18.0,
        lineHeight: 28,
      );

// 20
  static TextStyle get bold20 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 20.0,
        lineHeight: 30,
      );

  static TextStyle get semiBold20 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 20.0,
      );

  static TextStyle get regular20 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 20.0,
      );

  static TextStyle get light20 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 20.0,
      );

  static TextStyle get medium20 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 20.0,
        lineHeight: 30,
      );
// 22
  static TextStyle get bold22 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 22.0,
        lineHeight: 32,
      );

  static TextStyle get semiBold22 => _baseStyleFont(
        fontWeight: semiBoldFontWeight,
        fontSize: 22.0,
      );

  static TextStyle get regular22 => _baseStyleFont(
        fontWeight: regularFontWeight,
        fontSize: 20.0,
      );

  static TextStyle get light22 => _baseStyleFont(
        fontWeight: lightFontWeight,
        fontSize: 22.0,
      );

  static TextStyle get medium22 => _baseStyleFont(
        fontWeight: mediumFontWeight,
        fontSize: 22.0,
      );
  // 24
  static TextStyle get bold24 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontSize: 22.0,
        lineHeight: 34,
      );

  // 24
  static TextStyle get bold30 => _baseStyleFont(
        fontWeight: boldFontWeight,
        fontFamily: AppFonts.gabarito,
        fontSize: 30,
        lineHeight: 34,
      );
  // 48
  static TextStyle get bold48 => _baseStyleFont(
        fontWeight: boldFontWeight,
        height: 0,
        fontSize: 48.0,
      );

//
  static const List<_FontHeightConstants> _listFontHeightConstants = [
    // 12-8
    _FontHeightConstants(
      fontWeight: boldFontWeight,
      from: 8,
      to: 12,
      height: 24,
    ),
    _FontHeightConstants(
      fontWeight: semiBoldFontWeight,
      from: 8,
      to: 12,
      height: 24,
    ),
    _FontHeightConstants(
      fontWeight: mediumFontWeight,
      from: 8,
      to: 12,
      height: 20,
    ),
    _FontHeightConstants(
      fontWeight: regularFontWeight,
      from: 8,
      to: 12,
      height: 20,
    ),
    _FontHeightConstants(
      fontWeight: lightFontWeight,
      from: 8,
      to: 12,
      height: 20,
    ),

    // 15-13

    _FontHeightConstants(
      fontWeight: boldFontWeight,
      from: 13,
      to: 15,
      height: 30,
    ),
    _FontHeightConstants(
      fontWeight: semiBoldFontWeight,
      from: 13,
      to: 15,
      height: 30,
    ),
    _FontHeightConstants(
      fontWeight: mediumFontWeight,
      from: 13,
      to: 15,
      height: 26,
    ),
    _FontHeightConstants(
      fontWeight: regularFontWeight,
      from: 13,
      to: 15,
      height: 26,
    ),
    _FontHeightConstants(
      fontWeight: lightFontWeight,
      from: 13,
      to: 15,
      height: 26,
    ),

    // 19-16

    _FontHeightConstants(
      fontWeight: boldFontWeight,
      from: 16,
      to: 19,
      height: 36,
    ),
    _FontHeightConstants(
      fontWeight: semiBoldFontWeight,
      from: 16,
      to: 19,
      height: 36,
    ),
    _FontHeightConstants(
      fontWeight: mediumFontWeight,
      from: 16,
      to: 19,
      height: 30,
    ),
    _FontHeightConstants(
      fontWeight: regularFontWeight,
      from: 16,
      to: 19,
      height: 30,
    ),
    _FontHeightConstants(
      fontWeight: lightFontWeight,
      from: 16,
      to: 19,
      height: 30,
    ),

    // 24-20

    _FontHeightConstants(
      fontWeight: boldFontWeight,
      from: 20,
      to: 24,
      height: 46,
    ),
    _FontHeightConstants(
      fontWeight: semiBoldFontWeight,
      from: 20,
      to: 24,
      height: 46,
    ),
    _FontHeightConstants(
      fontWeight: mediumFontWeight,
      from: 20,
      to: 24,
      height: 40,
    ),
    _FontHeightConstants(
      fontWeight: regularFontWeight,
      from: 20,
      to: 24,
      height: 40,
    ),
    _FontHeightConstants(
      fontWeight: lightFontWeight,
      from: 20,
      to: 24,
      height: 46,
    ),
  ];
}

class _FontHeightConstants {
  final double from;
  final double to;
  final double height;
  final FontWeight fontWeight;
  const _FontHeightConstants({
    required this.from,
    required this.to,
    required this.height,
    required this.fontWeight,
  });

  bool isBetween(double value) {
    return value >= from && value <= to;
  }

  double getValue(double fontSize) {
    return height / fontSize;
  }

  static double getHeight(double fontSize, FontWeight fontWeight) {
    for (final _FontHeightConstants constants
        in AppTextStyle._listFontHeightConstants) {
      if (constants.fontWeight == fontWeight && constants.isBetween(fontSize)) {
        return constants.getValue(fontSize);
      }
    }
    return 1.0;
  }

  static double getHeightFromLineHeight(
      double fontSize, FontWeight fontWeight, double? lineHeight) {
    if (lineHeight != null) {
      return lineHeight / fontSize;
    }
    return getHeight(fontSize, fontWeight);
  }
}
