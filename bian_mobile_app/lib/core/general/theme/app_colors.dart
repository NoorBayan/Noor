import 'package:flutter/material.dart';

class AppColors {
  //Brand Colors
  static const PrimaryColor primaryColors = PrimaryColor();
  static const SecondaryColor secondaryColors = SecondaryColor();
  static const GreyColors greyColors = GreyColors();
  static const Color thirdColor = Color(0xFFF29030);
  static const Color starColor = Color(0xFFFFC20E);

  //Alert Colors
  static const ErrorColor errorColors = ErrorColor();
  static const SuccessColor successColors = SuccessColor();
  static const WarningColor warningColors = WarningColor();
  static const Color infoColor = Color(0xFF00C0F3);

  //Text Colors
  static const Color fontPrimaryColor = Color(0xFF888888);
  static const Color fontSecondaryColor = Color(0xFF4A4A4A);
  static const Color fontThirdColor = Color(0xFF010101);
  static const Color fontForthColor = Color(0xFF6B6B6B);
  static const Color fontAndIconFourthColor = Color(0xFFBAC1CC);

  //input colors
  static const Color inputFontColor = Color(0xFFCCD3DF);
  static final Color inputFormColor = disabledColor.withOpacity(0.4);
  static const Color disabledFormColor = Color(0xFFCCD3DF);
  static final Color inputFormErrorColor = errorColors.withOpacity(0.05);

  //other colors
  static const Color iconColor = Color(0xFFBAC1CC);
  static const Color backgroundColor = Color(0xFFF8F8F8);
  static const Color disabledColor = Color(0xFFCBD1D7);
  static const Color whiterColor = Color(0xFFFFFFFF);

  static const Color backgroundColor2 = Color(0xFFFBFBFB);
  static const Color dropShadow = Color(0xFFAEAEAE);
  static const FontColor fontColor = FontColor();

  static const Color badgeColor = Color(0xFF26A69A);

  //colors buttons status
  static final Color secondaryButtonColor = disabledColor.withOpacity(0.4);
  static const Color primaryColorActive = Color(0xFF462DA2);
  static const Color secondaryColorActive = Color(0xFFF5BC00);
  static const Color errorColorActive = Color(0xFFA10629);
  static const Color deactivatedButtonsColor = Color(0xFFE8E8E8);

  //
  static const Color whiteColor = Color(0xFFFFFFFF);
  static final Color testDesginColor = Colors.redAccent.withOpacity(0.2);
  static const Color transparent = Colors.transparent;
}

class FontColor extends Color {
  const FontColor() : super(0xFF202833); //uses 800 as default

  Color get c800 => const Color(0xFF202833);
  Color get secondaryColor => const Color(0xFF424D57);
  Color get thirdColor => const Color(0xFF6E7A8A);
  Color get fourthColorAndIcon => const Color(0xFF8B96A2);
  Color get inputFontColor => const Color(0xFFA2ADB9);
  Color get c300 => const Color(0xFFB9C2CA);
  Color get c100 => const Color(0xFFE5E8EB);
  Color get c50 => const Color(0xFFF6F7F8);
  Color get disabledColor => const Color(0xFFCBD1D7);
}

// class AlertColor {
//   const AlertColor(); //uses 900 as default

//   // success
//   Color get successColor => const SuccessColor();
//   Color get successColorDisabled => const SuccessColor().c100;
//   Color get successColorSecondary => const SuccessColor().c50;

//   // error
//   Color get errorColor => const ErrorColor();
//   Color get errorColorDisabled => const ErrorColor().c100;
//   Color get errorColorSecondary => const ErrorColor().c50;

//   // warning
//   Color get warningColor => const WarningColor();
//   Color get warningColorDisabled => const WarningColor().c100;
//   Color get warningColorSecondary => const WarningColor().c50;

//   // info
//   Color get infoColor => const InfoColor();
//   Color get infoColorDisabled => const InfoColor().c100;
//   Color get infoColorSecondary => const InfoColor().c50;
// }

// class SuccessColor extends Color {
//   const SuccessColor() : super(0xFF4DCE6B); //uses 500 as default

//   Color get c900 => const Color(0xFF2E7B3F);
//   Color get c800 => const Color(0xFF358F4A);
//   Color get c700 => const Color(0xFF3DA455);
//   Color get c600 => const Color(0xFF44B85F);
//   Color get c500 => const Color(0xFF4DCE6B);
//   Color get c400 => const Color(0xFF5FD37A);
//   Color get c300 => const Color(0xFF7ADA90);
//   Color get c200 => const Color(0xFFA6E6B5);
//   Color get c100 => const Color(0xFFD2F2DA);
//   Color get c50 => const Color(0xFFEDFAF0);
// }

class PrimaryColor extends Color {
  const PrimaryColor() : super(0xFF4395DC); //uses 600 as default

  // Color get c1000 => const Color(0xFF140929);
  // Color get c900 => const Color(0xFF281252);
  // Color get c800 => const Color(0xFF3D1C7C);
  // Color get c700 => const Color(0xFF5125A5);
  Color get c600 => const Color(0xFF4395DC);
  // Color get c500 => const Color(0xFF8458D8);
  // Color get c400 => const Color(0xFFA382E2);
  // Color get c300 => const Color(0xFFC1ABEB);
  // Color get c200 => const Color(0xFFE0D5F5);
  // Color get c100 => const Color(0xFFF0EAFA);
  // Color get c50 => const Color(0xFFF8F5FD);
}

class SecondaryColor extends Color {
  const SecondaryColor() : super(0xFFFFFFFF); //uses 500 as default

  // Color get c1000 => const Color(0xFF0B2932);
  // Color get c900 => const Color(0xFF165265);
  // Color get c800 => const Color(0xFF207B97);
  // Color get c700 => const Color(0xFF2BA4CA);
  // Color get c600 => const Color(0xFF36CDFC);
  Color get c500 => const Color(0xFFFFFFFF);
  // Color get c400 => const Color(0xFF86E1FD);
  // Color get c300 => const Color(0xFFAFEBFE);
  // Color get c200 => const Color(0xFFD7F5FE);
  // Color get c100 => const Color(0xFFEBFAFF);
  // Color get c50 => const Color(0xFFF5FDFF);
}

class GreyColors extends Color {
  const GreyColors() : super(0xFF9AA4B2); //uses 400 as default

  Color get black => const Color(0xFF000000);
  Color get c900 => const Color(0xFF121926);
  Color get c800 => const Color(0xFF2D3846);
  Color get c700 => const Color(0xFF364152);
  Color get c600 => const Color(0xFF4B5565);
  Color get c500 => const Color(0xFF697586);
  Color get c400 => const Color(0xFF9AA4B2);
  Color get c300 => const Color(0xFFCDD5DF);
  Color get c200 => const Color(0xFFE3E8EF);
  Color get c100 => const Color(0xFFEEF2F6);
  Color get c50 => const Color(0xFFF8FAFC);
  Color get c25 => const Color(0xFFFCFCFD);

  Color get white => const Color(0xFFFFFFFF);
}

// class ErrorColor extends Color {
//   const ErrorColor() : super(0xFFD43131); //uses 500 as default

//   Color get c900 => const Color(0xFF7E1D1D);
//   Color get c800 => const Color(0xFF932222);
//   Color get c700 => const Color(0xFFA82727);
//   Color get c600 => const Color(0xFFBD2B2B);
//   Color get c500 => const Color(0xFFD43131);
//   Color get c400 => const Color(0xFFD84646);
//   Color get c300 => const Color(0xFFDE6565);
//   Color get c200 => const Color(0xFFE99898);
//   Color get c100 => const Color(0xFFF4CBCB);
//   Color get c50 => const Color(0xFFFAEAEA);
// }

class WarningColor extends Color {
  const WarningColor() : super(0xFFFAE075); //uses 500 as default

  Color get c1000 => const Color(0xFF322B11);
  Color get c900 => const Color(0xFF645621);
  Color get c800 => const Color(0xFF958232);
  Color get c700 => const Color(0xFFC7AD42);
  Color get c600 => const Color(0xFFF9D853);
  Color get c500 => const Color(0xFFFAE075);
  Color get c400 => const Color(0xFFFBE898);
  Color get c300 => const Color(0xFFFDEFBA);
  Color get c200 => const Color(0xFFFEF7DD);
  Color get c100 => const Color(0xFFFEFBEE);
  Color get c50 => const Color(0xFFFFFDF7);
}

class SuccessColor extends Color {
  const SuccessColor() : super(0xFF7CBE80); //uses 500 as default

  Color get c1000 => const Color(0xFF122313);
  Color get c900 => const Color(0xFF244626);
  Color get c800 => const Color(0xFF498B4D);
  Color get c700 => const Color(0xFF498B4D);
  Color get c600 => const Color(0xFF5BAE60);
  Color get c500 => const Color(0xFF7CBE80);
  Color get c400 => const Color(0xFF9DCEA0);
  Color get c300 => const Color(0xFFBDDFBF);
  Color get c200 => const Color(0xFFDEEFDF);
  Color get c100 => const Color(0xFFEFF7EF);
  Color get c50 => const Color(0xFFEFF7EF);
}

class ErrorColor extends Color {
  const ErrorColor() : super(0xFFF04437); //uses 500 as default

  Color get c900 => const Color(0xFF7A2619);
  Color get c800 => const Color(0xFF912018);
  Color get c700 => const Color(0xFFB42318);
  Color get c600 => const Color(0xFFD92C20);
  Color get c500 => const Color(0xFFF04437);
  Color get c400 => const Color(0xFFF97066);
  Color get c300 => const Color(0xFFFCA19B);
  Color get c200 => const Color(0xFFFECDCA);
  Color get c100 => const Color(0xFFFEE4E2);
  Color get c50 => const Color(0xFFFEF3F2);
}
// class InfoColor extends Color {
//   const InfoColor() : super(0xFF429AFF); //uses 500 as default

//   Color get c900 => const Color(0xFF275C98);
//   Color get c800 => const Color(0xFF2D6BB1);
//   Color get c700 => const Color(0xFF347ACB);
//   Color get c600 => const Color(0xFF3B89E4);
//   Color get c500 => const Color(0xFF429AFF);
//   Color get c400 => const Color(0xFF68AEFF);
//   Color get c300 => const Color(0xFF8EC2FF);
//   Color get c200 => const Color(0xFFB3D6FF);
//   Color get c100 => const Color(0xFFCFE5FF);
//   Color get c50 => const Color(0xFFECF5FF);
// }
