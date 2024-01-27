import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../core/general/asset_path/app_fonts.dart';
import '../../core/general/asset_path/app_icons.dart';
import '../../core/general/theme/theme.dart';
import 'widgets.dart';

enum CustomAppBarType {
  primary,
  secondary,
  white,
  transparent,
}

/// This widget is used to show custom app bar with custom title and custom actions.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.trailing,
    this.titleWidget,
    this.onBackButtonPress,
    this.height,
    this.hideArrowBackNavigator = false,
    this.backgroundColor,
    this.titleColor,
    this.type = CustomAppBarType.primary,
    this.subtitle,
    this.subtitleWidget,
    this.disableChangeBritness = false,
    this.leading,
    this.showPrimaryBackgroud = false,
    this.alignTitleToStartIfNoLeading = true,
    this.topMargin,
    this.enableTopMarginSafeArea = true,
  }) : super(key: key);

  final CustomAppBarType type;
  final String? title;
  final Widget? titleWidget;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onBackButtonPress;
  final double? height;
  final bool hideArrowBackNavigator;
  final Color? backgroundColor;
  final Color? titleColor;
  final String? subtitle;
  final Widget? subtitleWidget;
  final bool disableChangeBritness;
  final bool showPrimaryBackgroud;
  final bool alignTitleToStartIfNoLeading;
  final double? topMargin;
  final bool enableTopMarginSafeArea;

  static double get defaultHeight =>
      49.h + AppDimensions.statusBarHeight; // 38.h  ;
  static double get defaultHeight2 =>
      70.h + AppDimensions.statusBarHeight; // 38.h  ;

  static EdgeInsetsGeometry get defaultHorizontalMargin =>
      EdgeInsets.symmetric(horizontal: 18.w);
  static EdgeInsetsGeometry get defaultTopMargin => EdgeInsets.only(top: 12.h);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // this for britness of icons status bar
        if (!disableChangeBritness)
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              // height: AppDimensions.statusBarHeight,
              width: 1.sw,
              child: EmptyAppBar(_backgroundColor),
            ),
          ),

        //
        Positioned.fill(
          child: showPrimaryBackgroud
              ? SizedBox(
                  width: 1.sw,
                  child: CustomImage(
                    imagePath: "AppImages.appBarBackgroundTop",
                    fit: BoxFit.fill,
                  ),
                )
              : Container(
                  decoration:
                      BoxDecoration(color: _backgroundColor, boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0.01),
                      color: _backgroundColor,
                    ),
                  ]),
                ),
        ),

        //
        Positioned.fill(
          child: SafeArea(
            top: enableTopMarginSafeArea,
            bottom: false,
            left: false,
            right: false,
            child: Container(
              margin: defaultHorizontalMargin,
              // .add(
                // topMargin != null
                //     ? EdgeInsets.only(top: topMargin!)
                //     : defaultTopMargin,
              // ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  //
                  Positioned.fill(
                    child: _buildTitleAndSubtitle(context),
                  ),

                  //
                  _buildLeading(context),

                  //
                  _buildTrailing(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color get _backgroundColor {
    if (backgroundColor != null) return backgroundColor!;
    Color color;
    switch (type) {
      case CustomAppBarType.primary:
        color = AppColors.primaryColors;
        break;
      case CustomAppBarType.secondary:
        color = AppColors.backgroundColor;
        break;
      case CustomAppBarType.white:
        color = Colors.white;
        break;
      case CustomAppBarType.transparent:
        color = Colors.transparent;
        break;
    }

    return color;
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    // final canPop = context.canPop();
    final bool showArrowBack = !hideArrowBackNavigator;
    final bool isNoLeading = leading == null && !showArrowBack;
    bool hasSubtitle = subtitle != null || subtitleWidget != null;
    return Align(
      alignment: (isNoLeading && alignTitleToStartIfNoLeading)
          ? AlignmentDirectional.centerStart
          : AlignmentDirectional.center,
      child: Container(
        margin: const EdgeInsetsDirectional.only(
            // start: isNoLeading ? 0 : 44.r,
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasSubtitle) 11.verticalSpace,

            _buildTitle(),

            //
            if (hasSubtitle) _buildSubTitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    Color titleColor = this.titleColor ?? AppColors.secondaryColors;
    if (type == CustomAppBarType.secondary) {
      titleColor = AppColors.greyColors;
    } else if (type == CustomAppBarType.white) {
      titleColor = AppColors.greyColors;
    }
    return titleWidget != null
        ? titleWidget!
        : Container(
          alignment: Alignment.center,
            // margin: EdgeInsets.only(top: 8.h),
            child: Visibility(
              visible: title != null,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 240.w,
                ),
                child: Text(
                  title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: AppTextStyle.bold30.copyWith(
                    color: titleColor,
                    fontFamily: AppFonts.gabarito,
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildSubTitle() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 230.w,
      ),
      child: subtitleWidget != null
          ? subtitleWidget!
          : subtitle == null
              ? const SizedBox.shrink()
              : Text(
                  '$subtitle',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regular12.copyWith(
                    color: AppColors.greyColors,
                  ),
                ),
    );
  }

  Widget _buildTrailing() {
    return trailing != null
        ? Align(alignment: AlignmentDirectional.topEnd, child: trailing!)
        : const SizedBox.shrink();
  }

  Widget _buildLeading(BuildContext context) {
    final canPop = ModalRoute.of(context)!.canPop;
    final bool showArrowBack = !hideArrowBackNavigator && canPop;

    if (!showArrowBack) {
      return const SizedBox.shrink();
    }

    if (leading != null) {
      return Align(
        alignment: AlignmentDirectional.topStart,
        child: leading!,
      );
    }

    Color arrowColor = AppColors.greyColors.c800;
    Color arrowBackgroundColor;
    if (type == CustomAppBarType.primary) {
      arrowBackgroundColor = AppColors.whiteColor.withOpacity(0.1);
      arrowColor = AppColors.whiteColor;
    } else if (type == CustomAppBarType.secondary) {
      arrowBackgroundColor = AppColors.whiteColor;
    } else if (type == CustomAppBarType.white) {
      arrowBackgroundColor = AppColors.disabledColor;
    } else if (type == CustomAppBarType.transparent) {
      arrowBackgroundColor = AppColors.whiteColor;
    } else {
      arrowBackgroundColor = AppColors.whiteColor;
    }
    return ArrowBackNavigator(
      alignment: AlignmentDirectional.centerStart,
      onPressed: onBackButtonPress,
      backgroundColor: arrowBackgroundColor,
      arrowColor: arrowColor,
    );
  }

  double get _defaultHeight {
    double value = defaultHeight;
    // if (type == CustomAppBarType.primary) {
    //   value += 100.h;
    // }
    return value;
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? (_defaultHeight));
}

class ArrowBackNavigator extends StatelessWidget {
  const ArrowBackNavigator({
    Key? key,
    this.arrowColor,
    this.backgroundColor,
    this.onPressed,
    this.alignment = AlignmentDirectional.centerStart,
    this.showIfOnlyCanPop = true,
    this.backgroudColorAnimationDuration = const Duration(milliseconds: 0),
    this.iconClose = false,
  }) : super(key: key);

  final Color? arrowColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final AlignmentGeometry alignment;
  final bool showIfOnlyCanPop;
  final Duration backgroudColorAnimationDuration;
  final bool iconClose;

  @override
  Widget build(BuildContext context) {
    if (showIfOnlyCanPop) {
      final canPop = context.canPop();
      if (!canPop) {
        return const SizedBox.shrink();
      }
    }

    return Align(
      alignment: alignment,
      child: InkWell(
        onTap: () => onPressed != null ? onPressed?.call() : context.pop(),
        child: CustomIcon(
          // isWithDirectionality: true,
          iconPath: AppIcons.backArrow,
          // iconColor: arrowColor ?? AppColors.whiteColor,
          width: 24.r,
          height: 24.r,
        ),
      ),
    );
  }
}

// class IconCloseNavigatorWidget extends StatelessWidget {
//   const IconCloseNavigatorWidget(
//       {Key? key, this.iconColor, this.backgroundColor, this.onPressed})
//       : super(key: key);

//   final Color? iconColor;
//   final Color? backgroundColor;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () =>
//           // onPressed != null ? onPressed?.call() : Navigator.of(context).pop(),
//           onPressed != null ? onPressed?.call() : context.pop(),
//       child: Container(
//         width: 36.r,
//         height: 36.r,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: backgroundColor ?? AppColors.whiteColor.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(8.0.r),
//         ),
//         child: CustomIcon(
//           icon: Icons.close_rounded,
//           width: 21.r,
//           height: 21.r,
//           color: iconColor ?? AppColors.whiteColor,
//         ),
//       ),
//     );
//   }
// }

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar2({
    Key? key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.subtitleWidget,
    this.leading,
    this.trailing,
    this.hideArrowBackNavigator = false,
    this.height,
    this.onPressedArrowBack,
  }) : super(key: key);

  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Widget? leading;
  final Widget? trailing;
  final bool hideArrowBackNavigator;
  final double? height;
  final VoidCallback? onPressedArrowBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: kToolbarHeight,
              width: 1.sw,
              child: const EmptyAppBar(AppColors.primaryColors),
            ),
          ),
          // CustomImage(
          //   imagePath: AppImages.appBarBackground,
          //   // fit: BoxFit.cover,
          //   // alignment: Alignment.topCenter,
          //   height: _height,
          //   width: 1.sw,
          // ),
          Positioned.fill(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 30.h.sizedBoxH,
                const SizedBox(
                  height: kToolbarHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (leading != null)
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: leading!,
                      ),
                    if (leading == null && !hideArrowBackNavigator)
                      ArrowBackNavigator(
                        alignment: AlignmentDirectional.topStart,
                        arrowColor: AppColors.greyColors,
                        backgroundColor: AppColors.whiteColor,
                        onPressed: onPressedArrowBack ?? () => context.pop(),
                      ),
                    if (trailing != null)
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: trailing!,
                      ),
                  ],
                ),
                18.verticalSpace,
                if (titleWidget == null)
                  Text(
                    title ?? '',
                    style: AppTextStyle.medium18.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                if (titleWidget != null) titleWidget!,
                12.verticalSpace,
                if (subtitleWidget == null)
                  Text(
                    subtitle ?? '',
                    style: AppTextStyle.regular14.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                if (subtitleWidget != null) subtitleWidget!,
              ],
            ),
          )),
        ],
      ),
    );
  }

  double get _height => height ?? defaultHeight;

  static double get defaultHeight => 157.h + AppDimensions.statusBarHeight;

  @override
  Size get preferredSize => Size.fromHeight(_height);
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar(this.backgroundColor, {Key? key}) : super(key: key);

  final Color backgroundColor;
  // static const double _defaultElevation = 4.0;
  @override
  Widget build(BuildContext context) {
    // return Semantics(
    //   container: true,
    //   child: Material(
    //     color: backgroundColor,
    //     child: Semantics(
    //       explicitChildNodes: true,
    //       child: Container(),
    //     ),
    //   ),
    // );

    return AppBar(
      backgroundColor: backgroundColor,
      leading: Container(),
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}

class EmptyAppBarWrapWidget extends StatelessWidget {
  const EmptyAppBarWrapWidget(
      {required this.child,
      this.backgroundColor,
      Key? key,
      this.withEmptyBottomNavigationBar = false,
      this.bottomNavigationBarBackgroundColor,
      this.returnNavigationBarToPreviousStyleAfterPop = true,
      this.withoutBottomPadding = false})
      : super(key: key);

  final Widget child;
  final Color? backgroundColor;
  final bool withEmptyBottomNavigationBar;
  final Color? bottomNavigationBarBackgroundColor;
  final bool returnNavigationBarToPreviousStyleAfterPop;
  final bool withoutBottomPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(backgroundColor ?? AppColors.primaryColors),
      body: withEmptyBottomNavigationBar
          ? SystemNavigationBarWarpWidget(
              backgroundColor: bottomNavigationBarBackgroundColor,
              returnToPreviousStyleAfterPop:
                  returnNavigationBarToPreviousStyleAfterPop,
              withoutBottomPadding: withoutBottomPadding,
              child: child,
            )
          : child,
    );
  }
}

// class EmptyBottomNavigationBarWrapWidget extends StatelessWidget {
//   const EmptyBottomNavigationBarWrapWidget(
//       {required this.child,
//       this.backgroundColor,
//       Key? key,
//       this.hideIfKeyboardIsOpen = true})
//       : super(key: key);

//   final Widget child;
//   final Color? backgroundColor;
//   final bool hideIfKeyboardIsOpen;

//   @override
//   Widget build(BuildContext context) {
//     double bottomPadding = MediaQuery.of(context).padding.bottom;
//     print('bottomPadding: $bottomPadding');

//     return Container(
//       color: backgroundColor ?? AppColors.whiteColor,
//       child: SafeArea(
//         child: child,
//         bottom: true,
//         top: false,
//         left: false,
//         right: false,
//       ),
//     );
//   }
// }

class SystemNavigationBarWarpWidget extends StatefulWidget {
  const SystemNavigationBarWarpWidget({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.returnToPreviousStyleAfterPop = true,
    this.withoutBottomPadding = false,
  }) : super(key: key);

  final Widget child;
  final Color? backgroundColor;
  final bool returnToPreviousStyleAfterPop;
  final bool withoutBottomPadding;

  @override
  State<SystemNavigationBarWarpWidget> createState() =>
      _SystemNavigationBarWarpWidgetState();
}

class _SystemNavigationBarWarpWidgetState
    extends State<SystemNavigationBarWarpWidget> {
  late final SystemUiOverlayStyle _systemNavigationBar;

  Color get backgroundColor => widget.backgroundColor ?? AppColors.whiteColor;

  @override
  void initState() {
    _systemNavigationBar = AppTheme.latestSystemUiOverlayStyle;

    // SystemChrome.setSystemUIOverlayStyle(
    //   _systemNavigationBar.copyWith(
    //     systemNavigationBarColor: backgroundColor,
    //     systemNavigationBarIconBrightness:
    //         AppTheme.brightnessByColor(backgroundColor),
    //     systemNavigationBarDividerColor: backgroundColor,
    //   ),
    // );

    super.initState();
    // WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    if (widget.returnToPreviousStyleAfterPop && Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(_systemNavigationBar);
    }

    // WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
  }

  // @override
  // didPopRoute() {
  //   if (widget.returnToPreviousStyleAfterPop) {
  //     SystemChrome.setSystemUIOverlayStyle(_systemNavigationBar);
  //   }

  //   return super.didPopRoute();
  // }

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    if (bottomPadding == 0) {
      bottomPadding = 16.h;
    }

    bottomPadding = widget.withoutBottomPadding ? 0 : bottomPadding;

    if (Platform.isIOS) {
      return Container(
        padding: EdgeInsets.only(
          bottom: bottomPadding,
        ),
        color: backgroundColor,
        child: widget.child,
      );
    }

    return AnnotatedRegion(
      // android only
      value: _systemNavigationBar.copyWith(
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness:
            AppTheme.brightnessByColor(backgroundColor),
        systemNavigationBarDividerColor: backgroundColor,
      ),
      child: Container(
        color: backgroundColor, // ios only
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          bottom: !widget.withoutBottomPadding,
          child: widget.child,
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../core/general/asset_path/app_icons.dart';
// import '../../core/general/theme/theme.dart';

// import '../../core/general/providers/localization_provider.dart';
// import '../../core/general/theme/app_colors.dart';
// import '../../core/general/theme/text_style.dart';
// import 'app_bar_back_button.dart';
// import 'custom_icon.dart';

// class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
//   CustomAppBar({
//     this.onBackButtonTap,
//     Key? key,
//     this.titleText,
//     this.leadingWidget,
//     this.centeredWidget,
//     this.backgroundColor,
//     this.iconBackgroundColor,
//     this.iconColor,
//     this.titleStyle,
//     this.appBarType,
//     this.trailingWidget,
//   }) : super(key: key) {
//     if (appBarType != null && appBarType == CustomAppBarType.common) {
//       backgroundColor = AppColors.thirdColor;
//       iconBackgroundColor = Colors.white.withOpacity(.10);
//       iconColor = Colors.white;
//       titleStyle = AppTextStyle.medium20.copyWith(color: AppColors.whiteColor);
//     }
//   }
//   final Function()? onBackButtonTap;
//   final String? titleText;
//   final Widget? leadingWidget;
//   final Widget? centeredWidget;
//   final Widget? trailingWidget;
//   Color? backgroundColor;
//   Color? iconBackgroundColor;
//   Color? iconColor;
//   TextStyle? titleStyle;
//   final CustomAppBarType? appBarType;

//   static double get defaultHeight => 62.h;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//       color: backgroundColor ?? AppColors.primaryColors,
//       child: Container(
//         margin: EdgeInsets.symmetric(
//           horizontal: 20.w,
//         ),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             _BuildLeadingWidgetIfNotNullOrElseBackButton(
//                 leadingWidget: leadingWidget,
//                 onBackButtonTap: onBackButtonTap,
//                 iconBackgroundColor: iconBackgroundColor,
//                 iconColor: iconColor,
//                 context: context),
//             _BuildCenterWidget(
//                 titleText: titleText,
//                 centeredWidget: centeredWidget,
//                 ref: ref,
//                 context: context),
//             _BuildTitleText(titleText: titleText, titleStyle: titleStyle),
//             // Align(
//             //   alignment: Alignment.center,
//             //   child: centeredWidget,
//             // ),
//             _BuildTrailingWidgetIfNotNull(trailingWidget: trailingWidget),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(58.h);
// }

// class _BuildTrailingWidgetIfNotNull extends StatelessWidget {
//   const _BuildTrailingWidgetIfNotNull({
//     Key? key,
//     required this.trailingWidget,
//   }) : super(key: key);

//   final Widget? trailingWidget;

//   @override
//   Widget build(BuildContext context) {
//     if (trailingWidget == null) {
//       return const SizedBox.shrink();
//     }
//     return Align(
//       alignment: AlignmentDirectional.centerEnd,
//       child: trailingWidget,
//     );
//   }
// }

// class _BuildTitleText extends StatelessWidget {
//   const _BuildTitleText({
//     Key? key,
//     required this.titleText,
//     required this.titleStyle,
//   }) : super(key: key);

//   final String? titleText;
//   final TextStyle? titleStyle;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: AlignmentDirectional.centerStart,
//       child: Visibility(
//         visible: titleText != null,
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxWidth: 240.w,
//           ),
//           child: Container(
//             margin: EdgeInsetsDirectional.only(start: 56.r),
//             child: Text(
//               titleText ?? '',
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: titleStyle ?? AppTextStyle.bold20,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _BuildCenterWidget extends StatelessWidget {
//   const _BuildCenterWidget({
//     Key? key,
//     required this.titleText,
//     required this.centeredWidget,
//     required this.ref,
//     required this.context,
//   }) : super(key: key);

//   final String? titleText;
//   final Widget? centeredWidget;
//   final WidgetRef ref;
//   final BuildContext context;

//   @override
//   Widget build(BuildContext context) {
//     if (titleText == null && centeredWidget == null) {
//       return const SizedBox.shrink();
//     }
//     return Align(
//         alignment: AlignmentDirectional.center,
//         child: centeredWidget ??
//             GestureDetector(
//               onTap: () async {
//                 await ref
//                     .read(localizationProvider)
//                     .changeToSecondaryLanguage(context: context);
//               },
//               child: Text(
//                 titleText!,
//                 style: AppTextStyle.medium18
//                     .copyWith(color: AppColors.fontThirdColor),
//               ),
//             ));
//   }
// }

// class _BuildLeadingWidgetIfNotNullOrElseBackButton extends StatelessWidget {
//   const _BuildLeadingWidgetIfNotNullOrElseBackButton({
//     Key? key,
//     required this.leadingWidget,
//     required this.onBackButtonTap,
//     required this.iconBackgroundColor,
//     required this.iconColor,
//     required this.context,
//   }) : super(key: key);
//   final Widget? leadingWidget;
//   final Function()? onBackButtonTap;
//   final Color? iconBackgroundColor;
//   final Color? iconColor;
//   final BuildContext context;

//   @override
//   Widget build(BuildContext context) {
//     if (leadingWidget != null) {
//       return leadingWidget!;
//     }
//     return Align(
//       alignment: AlignmentDirectional.centerStart,
//       child: AppBarBackButton(
//           onTap: onBackButtonTap,
//           iconBackgroundColor: iconBackgroundColor,
//           iconColor: iconColor),
//     );
//   }
// }

// enum CustomAppBarType {
//   common,
// }

// class ArrowBackNavigator extends StatelessWidget {
//   const ArrowBackNavigator(
//       {Key? key, this.arrowColor, this.backgroundColor, this.onPressed})
//       : super(key: key);

//   final Color? arrowColor;
//   final Color? backgroundColor;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: InkWell(
//         onTap: () => Navigator.of(context).maybePop(),
//         child: Container(
//           height: 34.r,
//           width: 34.r,
//           decoration: BoxDecoration(
//             color: backgroundColor ?? Colors.white.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: Center(
//             // fit: BoxFit.scaleDown,
//             child: CustomIcon(
//               isWithDirectionality: true,
//               iconPath: AppIcons.rightArrow,
//               iconColor: arrowColor ?? Colors.white,
//               width: 5.91.r,
//               height: 13.2.r,
//               // iconWidth: 8.16.r,
//               // iconHeight: 15.18.r,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
