import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static double get buttonBorderRadius => 28.r;
  static double get borderRadiusValue => 10.r;
  static BorderRadius get borderRadius =>
      BorderRadius.circular(borderRadiusValue);
  static SmoothBorderRadius get smoothBorderRadius => SmoothBorderRadius(
        cornerRadius: borderRadiusValue,
        cornerSmoothing:0,
      );
  static double get secondaryButtonBorderRadius => 12.r;
  static double get horizontalPadding => 20.w;
  static double _statusBarHeight = 20.w;
  static double get statusBarHeight => _statusBarHeight;
  static EdgeInsetsGeometry get defaultMargin =>
      const EdgeInsets.symmetric(horizontal: 18).w;
  static double get appBarHeight => 84.h;
  static double get bottomBarHeight => Platform.isAndroid ? 72.h : 78.h;

  static void init(BuildContext context) {
    _statusBarHeight = MediaQuery.of(context).padding.top;
  }

  static double getTopPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static Widget getTopPaddingVerticalSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }

  static Widget getBottomPaddingVerticalSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.bottom,
    );
  }
  

  static Widget getBottomViewInsetsPaddingVerticalSpace(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).viewInsets.bottom,
    );
  }

  static double getBottomViewInsetsPadding(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  static double getBottomPaddingWithNavbar(BuildContext context) {
    return getBottomPadding(context) + bottomBarHeight;
  }

  static double getTopPaddingAndAppBarHeight(BuildContext context) {
    return appBarHeight + getTopPadding(context);
  }

  static double getHeightWithoutTopPaddingAndAppBar(BuildContext context) {
    final mediaData = MediaQuery.of(context);
    return (mediaData.size.height + mediaData.padding.bottom) -
        getTopPaddingAndAppBarHeight(context);
  }

  static double getContentHeight(BuildContext context) {
    final mediaData = MediaQuery.of(context);
    return mediaData.size.height -
        (getTopPaddingAndAppBarHeight(context) +
            getBottomPaddingWithNavbar(context));
  }

  static double getMidHeight(BuildContext context) {
    return (getContentHeight(context) -
            (AppDimensions.appBarHeight + AppDimensions.bottomBarHeight)) /
        2;
  }
}
