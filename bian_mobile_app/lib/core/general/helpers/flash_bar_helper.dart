import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../../common/widgets/custom_icon.dart';
import '../asset_path/app_icons.dart';
import '../routes/navigator_service.dart';
import '../theme/theme.dart';
import 'custom_logger.dart';

const Duration _defaultToastDuration = Duration(seconds: 2);

class FlashBarHelper {
  // static Widget setupOverlay({
  //   required BuildContext context,
  //   required Widget child,
  //   // required GlobalKey<NavigatorState> navigatorKey
  // }) {
  //   final theme = Theme.of(context);
  //   final isThemeDark = theme.brightness == Brightness.dark;
  //   // Wrap with toast.
  //   // child = Toast(navigatorKey: navigatorKey, child: child);
  //   // Wrap with flash theme
  //   child = MaterialApp(
  //     navigatorKey: rootNavigatorKey,
  //     builder: (context, _) {
  //       var child = _!;

  //       child = Toast(child: child, navigatorKey: navigatorKey);
  //       return child;
  //     },
  //     locale: DevicePreview.locale(context),
  //     title: 'Flash Demo',
  //     theme: (isThemeDark ? ThemeData.light() : ThemeData.dark())
  //         .copyWith(extensions: [FlashToastTheme(), FlashBarTheme()]),
  //     darkTheme: ThemeData.dark(),
  //     themeMode: isThemeDark ? ThemeMode.dark : ThemeMode.light,
  //     home: child,
  //   );
  //   // child = DefaultFlashTheme(
  //   //   flashBarTheme: isThemeDark
  //   //       ? const FlashBarThemeData.dark()
  //   //       : const FlashBarThemeData.light(),
  //   //   flashDialogTheme: const FlashDialogThemeData(),
  //   //   child: child,
  //   // );

  //   var overlay = Overlay(
  //     initialEntries: [
  //       OverlayEntry(
  //         builder: (context) => child,
  //       ),
  //     ],
  //   );

  //   return overlay;
  // }

  static Future get showToastErrorNoInternet async {
    await FlashBarHelper.showToastError(
        message: "no internet connection is available",
        duration: const Duration(seconds: 1));
  }

  static Future showToastError(
      {required String message,
      BuildContext? context,
      Duration duration = const Duration(seconds: 3)}) async {
    BuildContext _context =
        context ?? NavigationService.instance.currentContext;
    _DefaultToastWidget.show(
      context: _context,
      duration: duration,
      message: message,
      backgroundColor: AppColors.errorColors,
    );
    ;
  }

  static Future showToastSuccess(
      {required String message,
      BuildContext? context,
      Duration duration = const Duration(seconds: 3)}) async {
    BuildContext _context =
        context ?? NavigationService.instance.currentContext;
    _DefaultToastWidget.show(
      context: _context,
      duration: duration,
      message: message,
      backgroundColor: AppColors.successColors,
    );
  }

  static Future showToastInfo(
      {required String message,
      BuildContext? context,
      Duration duration = const Duration(seconds: 3)}) async {
    BuildContext _context =
        context ?? NavigationService.instance.currentContext;

    _DefaultToastWidget.show(
      context: _context,
      duration: duration,
      message: message,
      backgroundColor: AppColors.whiteColor,
    );
  }

  // show error flash bar
  static Future showFlashBarError(
      {BuildContext? context,
      required String message,
      bool withBarrier = true}) async {
    Object? result;
    var currentSystemUiOverlayStyle = AppTheme.latestSystemUiOverlayStyle;

    try {
      final currentContext =
          context ?? NavigationService.instance.currentContext;
      await Future.delayed(
          Duration.zero,
          () => AppTheme.changeStatusAndNavigationBarColor(
                statusBarcolor: AppColors.errorColors,
              ));
      if (currentContext.mounted) {
        result = await showFlash(
          context: currentContext,
          duration: const Duration(seconds: 2),
          persistent: true,
          builder: (_, controller) {
            return FlashBar(
              controller: controller,
              backgroundColor: AppColors.errorColors,

              // brightness: Brightness.dark,
              // boxShadows: const [BoxShadow(blurRadius: 4)],
              // barrierBlur: 0.0,
              // barrierColor: withBarrier ? Colors.black38 : Colors.transparent,
              // barrierDismissible: true,
              behavior: FlashBehavior.fixed,
              position: FlashPosition.top,
              // useSafeArea: true,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: AppColors.errorColors,
                    padding: EdgeInsets.only(
                      // top: MediaQuery.of(currentContext).padding.top,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: MediaQuery.of(currentContext).padding.top,
                        // ),
                        Row(
                          children: [
                            CustomIcon(
                              //todo: configure
                              iconPath: AppIcons.mainHomeLogo,
                              height: 20.r,
                              width: 22.r,
                              iconColor: AppColors.whiteColor,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: Text(
                                message,
                                style: AppTextStyle.medium16
                                    .copyWith(color: AppColors.whiteColor),
                                textHeightBehavior:
                                    AppTextStyle.removeFirstAndLastLineHeight,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      // debugModePrint(e);
    }
    await Future.delayed(Duration.zero, () {
      AppTheme.changeStatusAndNavigationBarColor(
          statusBarcolor: currentSystemUiOverlayStyle.statusBarColor!,
          navigationBarColor:
              currentSystemUiOverlayStyle.systemNavigationBarColor!);
    });
    // await Future.delayed(Duration.zero, () {
    //   AppTheme.changeStatusAndNavigationBarColor(
    //       statusBarcolor: currentSystemUiOverlayStyle.statusBarColor!,
    //       navigationBarColor:
    //           currentSystemUiOverlayStyle.systemNavigationBarColor!);
    // });

    return result;
  }

  // show success flash bar
  static Future showFlashBarSuccess(
      {BuildContext? context,
      required String message,
      bool withBarrier = true}) async {
    var currentSystemUiOverlayStyle = AppTheme.latestSystemUiOverlayStyle;
    Object? result;

    try {
      await Future.delayed(
          Duration.zero,
          () => AppTheme.changeStatusAndNavigationBarColor(
                statusBarcolor: AppColors.successColors,
              ));

      result = await showFlash(
        context: context ?? NavigationService.instance.currentContext,
        duration: const Duration(seconds: 2),
        persistent: true,
        builder: (_, controller) {
          return FlashBar(
            controller: controller,
            backgroundColor: AppColors.successColors,
            // brightness: Brightness.dark,
            // boxShadows: const [BoxShadow(blurRadius: 4)],
            // barrierBlur: 0.0,
            // barrierColor: withBarrier ? Colors.black38 : Colors.transparent,
            // barrierDismissible: true,
            behavior: FlashBehavior.fixed,
            position: FlashPosition.top,
            content: Column(
              children: [
                // Container(
                //   height: kToolbarHeight,
                //   color: AppColors.successColor,
                // ),
                Container(
                  alignment: Alignment.bottomCenter,
                  color: AppColors.successColors,
                  // height: 65.h,
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomIcon(
                            iconPath: "AppIcons.tick",
                            height: 12.5.r,
                            width: 18.11.r,
                            iconColor: AppColors.whiteColor,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: Text(
                              message,
                              style: AppTextStyle.medium16
                                  .copyWith(color: AppColors.whiteColor),
                              textHeightBehavior:
                                  AppTextStyle.removeFirstAndLastLineHeight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    } catch (e) {
      logger.e(e);
    }

    await Future.delayed(Duration.zero, () {
      AppTheme.changeStatusAndNavigationBarColor(
          statusBarcolor: currentSystemUiOverlayStyle.statusBarColor!,
          navigationBarColor:
              currentSystemUiOverlayStyle.systemNavigationBarColor!);
    });

    return result;
  }
}

class _DefaultToastWidget extends StatelessWidget {
  const _DefaultToastWidget({
    super.key,
    required this.message,
    required this.backgroundColor,
    this.textColor,
  });

  final String message;
  final Color backgroundColor;
  final Color? textColor;

  static Future show({
    required BuildContext context,
    required String message,
    Color backgroundColor = AppColors.primaryColors,
    Color textColor = AppColors.whiteColor,
    Duration duration = _defaultToastDuration,
  }) async {
    showToastWidget(
      _DefaultToastWidget(
        message: message,
        backgroundColor: backgroundColor,
        textColor: textColor,
      ),
      context: context,
      duration: duration,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(milliseconds: 350),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6.r,
        horizontal: 8.r,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: Text(
        message,
        style: AppTextStyle.regular14
            .copyWith(color: textColor ?? AppColors.whiteColor),
        textHeightBehavior: AppTextStyle.removeFirstAndLastLineHeight,
      ),
    );
  }
}
