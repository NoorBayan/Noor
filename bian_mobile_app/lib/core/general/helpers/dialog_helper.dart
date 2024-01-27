import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../routes/navigator_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class DialogHelper {
  static Future<T?> showDialog<T>({
    BuildContext? context,
    bool barrierDismissible = true,
    required WidgetBuilder builder,
  }) {
    BuildContext _context = context ?? NavigationService.instance.currentContext;
    // assert(debugCheckHasMaterialLocalizations(_context));
    final ThemeData theme = Theme.of(
      _context,
    );
    return showGeneralDialog(
      context: _context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return WillPopScope(
          onWillPop: () async => barrierDismissible,
          child: SafeArea(
            child: Builder(builder: (BuildContext context) {
              return Theme(
                data: theme,
                child: Material(
                  type: MaterialType.transparency,
                  child: pageChild,
                ),
              );
            }),
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(_context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  static Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  static Future<void> showLoadingDialog({
    BuildContext? context,
    Duration? duration,
  }) async {
    BuildContext _context = context ?? NavigationService.instance.currentContext;

    if (duration != null) {
      Future.delayed(duration, () => Navigator.pop(_context));
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              // width: 100.r,
              // height: 100.r,
              width: 1.sw,
              height: 1.sh,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // static Future<T?> showAlertDialog<T>

  // static Future<T?> showAlertDialog<T>({
  //   required BuildContext context,
  //   String? title,
  //   String? message,
  //   required Widget content,
  //   required List<Widget> actions,
  // }) {
  //   return showDialog<T>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       final ThemeData theme = Theme.of(context);
  //       return AlertDialog(
  //         title: title != null ? new Text(title) : null,
  //         content: new SingleChildScrollView(
  //           child: new ListBody(
  //             children: <Widget>[
  //               new Text(message),
  //               content,
  //             ],
  //           ),
  //         ),
  //         actions: actions,
  //       );
  //     },
  //   );
  // } // show Dialog

  // static Future<bool> defaultAlertDialog({
  //   BuildContext? context,
  //   String? confirmButtonLable,
  //   String? cancelButtonLable,
  //   required String title,
  //   required String middleText,
  //   bool barrierDismissible = true,
  //   bool showCancelButton = true,
  // }) async {
  //   String _confirmButtonLable = confirmButtonLable ?? 'نعم';
  //   String _cancelButtonLable = cancelButtonLable ?? 'إلغاء';
  //   BuildContext _context = context ?? locator<NavigationService>().context;

  //   bool ok = await showDialog<bool>(
  //           context: _context,
  //           barrierDismissible: barrierDismissible,
  //           builder: (ctx) {
  //             return WillPopScope(
  //               onWillPop: () async => barrierDismissible,
  //               child: AlertDialog(
  //                 title: Text(
  //                   title,
  //                   // style: AppTextStyle.medium16,
  //                 ),
  //                 titleTextStyle: AppTextStyle.medium16,
  //                 content: Text(
  //                   middleText,
  //                   style: AppTextStyle.medium14,
  //                 ),
  //                 actions: <Widget>[
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: CustomButton(
  //                           onPressed: () => Navigator.of(_context).pop(true),
  //                           label: _confirmButtonLable,
  //                           buttonColor: AppColors.primaryColor,
  //                           sizeType: CustomButtonSizeType.height46,
  //                         ),
  //                       ),
  //                       if (showCancelButton) 11.w.sizedBoxW,
  //                       if (showCancelButton)
  //                         Expanded(
  //                           child: CustomButton(
  //                             onPressed: () => Navigator.of(_context).pop(false),
  //                             label: _cancelButtonLable,
  //                             type: CustomButtonType.secondary,
  //                             sizeType: CustomButtonSizeType.height46,
  //                           ),
  //                         ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             );
  //           }) ??
  //       false;

  //   return ok;
  // }

  static Future<bool> defaultAlertDialog({
    BuildContext? context,
    String? confirmButtonLable,
    String? cancelButtonLable,
    required String title,
    required String middleText,
    bool barrierDismissible = true,
    bool showCancelButton = true,
  }) async {
    String _confirmButtonLable = confirmButtonLable ?? "confirm";
    String _cancelButtonLable = cancelButtonLable ?? "cancel";
    BuildContext _context = context ?? NavigationService.instance.currentContext;
    bool ok = await showDialog<bool>(
            context: _context,
            barrierDismissible: barrierDismissible,
            builder: (ctx) {
              return WillPopScope(
                onWillPop: () async => barrierDismissible,
                child: AlertDialog(
                  title: Text(
                    title,
                    // style: AppTextStyle.medium16,
                  ),
                  titleTextStyle: AppTextStyle.medium16,
                  content: Text(
                    middleText,
                    style: AppTextStyle.medium14,
                  ),
                  actions: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextButton(
                            onPressed: () => Navigator.of(_context).pop(true),
                            label: _confirmButtonLable,
                            // buttonColor: AppColors.primaryColor,
                            colorLabel: AppColors.thirdColor,
                            // sizeType: CustomButtonSizeType.height46,
                          ),
                        ),
                        if (showCancelButton) 11.horizontalSpace,
                        if (showCancelButton)
                          Expanded(
                            child: CustomTextButton(
                              onPressed: () =>
                                  Navigator.of(_context).pop(false),
                              label: _cancelButtonLable,
                              colorLabel: AppColors.fontSecondaryColor,
                              // type: CustomButtonType.secondary,
                              // sizeType: CustomButtonSizeType.height46,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            }) ??
        false;

    return ok;
  }
}
