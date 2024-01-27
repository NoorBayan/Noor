import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import '../asset_path/app_fonts.dart';
import 'app_colors.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';

export 'app_colors.dart';
export 'button_style.dart';
export 'dimensions.dart';
export 'icon_style.dart';
export 'text_field_style.dart';
export 'text_style.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.whiteColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.primaryColors,
      colorScheme: const ColorScheme.light(
        secondary: AppColors.primaryColors,
      ),
      // fontFamily: AppFonts.montserratArabic,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.inputFormColor,
      ),
    );
  }

  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color:const Color(0xFF000000).withOpacity(.16),
      offset: const Offset(0, 3),
      blurRadius: 6,
    )
  ];

  static Brightness brightnessByColor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
  }

  static void stopLandscapeMode() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  // static SystemUiOverlayStyle get latestSystemUiOverlayStyle {
  //   return (SystemChrome.latestStyle ?? SystemUiOverlayStyle.light).copyWith();
  // }

  static SystemUiOverlayStyle get latestSystemUiOverlayStyle {
    return _latestSystemUiOverlayStyle.copyWith();
  }

  static SystemUiOverlayStyle _latestSystemUiOverlayStyle =
      SystemUiOverlayStyle.light;

  static changeStatusAndNavigationBarColor(
      {Color? statusBarcolor, Color? navigationBarColor}) {
    Brightness? statusBarBrightness =
        statusBarcolor == null ? null : brightnessByColor(statusBarcolor);
    Brightness? navigationBarBrightness = navigationBarColor == null
        ? null
        : brightnessByColor(navigationBarColor);

    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: statusBarcolor,
      statusBarBrightness: statusBarBrightness,
      statusBarIconBrightness: statusBarBrightness,
      systemNavigationBarColor: navigationBarColor,
      systemNavigationBarDividerColor: navigationBarColor,
      systemNavigationBarIconBrightness: navigationBarBrightness,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarContrastEnforced: true,
    );
    SystemChrome.setSystemUIOverlayStyle(
      systemUiOverlayStyle,
    );

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode .manual);

    _latestSystemUiOverlayStyle = systemUiOverlayStyle;

    return systemUiOverlayStyle;
  }
}
