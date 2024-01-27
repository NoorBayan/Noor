import 'package:figma_squircle/figma_squircle.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'custom_button.dart';
import 'no_glow_scroll_behavior_wrapper.dart';
import '../../core/general/util/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/general/routes/navigator_service.dart';
import '../../core/general/theme/theme.dart';
import 'custom_icon.dart';

typedef FutureCallback = Future Function();

/// This widget is used to wrap a widget with a default style of bottom sheet.
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.child,
    this.isChildExpanded = false,
    this.maxHeight,
    this.topPadding,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;

  /// If true, the child will not be expanded.
  /// The default value is false.
  final bool isChildExpanded;

  /// The max height of the bottom sheet.
  final double? maxHeight;

  /// The top padding of the bottom sheet.
  final double? topPadding;

  /// The background color of the bottom sheet.
  /// The default value is [AppColors.whiteColor].
  final Color? backgroundColor;

  /// The default of height of the bottom sheet.
  double get maxSheetHeight => 0.85.sh;

  /// The default of height of the bottom sheet when keyboard is open.
  double get maxSheetHeightWithKeyboard => 0.92.sh;

  /// Get the max height of the bottom sheet.
  double getMaxHeight(BuildContext context) {
    if (maxHeight != null) return maxHeight!;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return keyboardIsOpen ? maxSheetHeightWithKeyboard : maxSheetHeight;
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    // debugModePrint('keyboardPadding = $keyboardIsOpen');

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: getMaxHeight(context),
            minWidth: double.infinity,
          ),
          // padding: EdgeInsets.only(top: 20.h),
          // decoration: BoxDecoration(
          //   color: backgroundColor ?? AppColors.whiteColor,
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(20.r),
          //     topRight: Radius.circular(20.r),
          //   ),
          // ),
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: AppDimensions.smoothBorderRadius.copyWith(
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
            ),
            color: backgroundColor ?? AppColors.whiteColor,
          ),
          padding: EdgeInsets.only(
            bottom:
                keyboardIsOpen ? MediaQuery.of(context).viewInsets.bottom : 0.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: topPadding ?? 20.h,
              ),
              if (!isChildExpanded) child,
              if (isChildExpanded)
                Expanded(
                  child: child,
                ),
            ],
          ),
        ),
      ],
    );
  }

  /// Show the bottom sheet.
  ///
  /// [context] is the context of the widget.
  ///
  /// [builder] is the builder of the bottom sheet.
  ///
  /// [isScrollControlled] is if true, the bottom sheet will be scrollable.
  ///
  /// [backgroundColor] is the background color of the bottom sheet.
  ///
  /// [bodyBackgroundColor] is the background color of the body of the bottom sheet.
  ///
  /// [routeSettings] is the route settings of the bottom sheet.
  ///
  /// [isChildExpanded] is if true, the child will not be expanded.
  ///
  /// [maxHeight] is the max height of the bottom sheet.
  ///
  /// [topPadding] is the top padding of the bottom sheet.
  ///
  /// [isDismissible] is if true, the bottom sheet will be dismissible.
  ///
  /// [canPop] is if true, the bottom sheet can be popped.
  ///
  /// Note: don't forget to add [ModalScrollController.of(context)] to the controller of the scrollable widget,
  /// if you want to pop the bottom sheet by scrolling.
  ///
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? bodyBackgroundColor,
    RouteSettings? routeSettings,
    bool isChildExpanded = true,
    double? maxHeight,
    double? topPadding,
    bool isDismissible = true,
    bool canPop = true,
  }) {
    // final BottomSheetThemeData sheetTheme = Theme.of(context).bottomSheetTheme;

    /// This is just to prevent the bottom sheet from being rebuilt
    /// after closing it by tapping back button on Android devices.
    Widget? child;

    /// if context doesn't have navigator, use the navigator from NavigationService
    if (Navigator.maybeOf(context) == null) {
      context = NavigationService.instance.currentContext;
    }

    return showMaterialModalBottomSheet<T>(
      context: context,
      backgroundColor: backgroundColor ?? Colors.transparent,
      settings: routeSettings,
      isDismissible: isDismissible,
      useRootNavigator: true,
      builder: (context) {
        return child ??= WillPopScope(
          onWillPop: () async {
            if (canPop) {
              return true;
            }
            return false;
          },
          child: NoGlowScrollBehaviorWrapper(
            child: CustomBottomSheet(
              backgroundColor: bodyBackgroundColor,
              isChildExpanded: isChildExpanded,
              maxHeight: maxHeight,
              topPadding: topPadding,
              child: builder(context),
            ),
          ),
        );
      },
    );
  }

  static Future<T?> showConfirmation<T>(
      {Color? iconBackgroundColor,
      required String iconPath,
      required String title,
      required String subTitle,
      FutureCallback? onMainButtonTap,
      CustomButtonType? mainButtonType,
      required BuildContext context,
      required String mainButtonLabel}) {
    return show(
        context: context,
        isChildExpanded: false,
        builder: (context) => _BuildConfirmationBottomSheet(
              context: context,
              iconPath: iconPath,
              mainButtonType: mainButtonType,
              mainButtonLabel: mainButtonLabel,
              onMainButtonTap: onMainButtonTap,
              iconBackgroundColor: iconBackgroundColor,
              subTitle: subTitle,
              title: title,
            ));
  }
}

class _BuildSubtitle extends StatelessWidget {
  const _BuildSubtitle(
    this.subTitle, {
    Key? key,
  }) : super(key: key);
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.r),
        child: Text(
          subTitle,
          style:
              AppTextStyle.medium14.copyWith(color: AppColors.greyColors.c600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

final _isLoadingState = StateProvider<bool>((ref) {
  return false;
});

class _BuildConfirmationBottomSheet extends StatelessWidget {
  const _BuildConfirmationBottomSheet(
      {super.key,
      this.iconBackgroundColor,
      required this.iconPath,
      required this.title,
      required this.subTitle,
      this.onMainButtonTap,
      required this.context,
      required this.mainButtonLabel,
      this.mainButtonType});
  final Color? iconBackgroundColor;
  final String iconPath;
  final String title;
  final String subTitle;
  final FutureCallback? onMainButtonTap;
  final CustomButtonType? mainButtonType;
  final BuildContext context;
  final String mainButtonLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      height: 20.h +
          72.r +
          24.h +
          AppTextStyle.bold16.actualHeight +
          4.h +
          AppTextStyle.medium14.actualHeight +
          24.h +
          60.h +
          24.h +
          AppDimensions.getBottomPadding(context),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BuildMainIcon(
            iconPath: iconPath,
            iconBackgroundColor: iconBackgroundColor,
          ),
          24.verticalSpace,
          _BuildTitle(title),
          4.verticalSpace,
          _BuildSubtitle(subTitle),
          24.verticalSpace,
          Row(
            children: [
              _BuildMainButton(
                  isLoadingState: _isLoadingState,
                  mainButtonLabel: mainButtonLabel,
                  mainButtonType: mainButtonType,
                  onMainButtonTap: onMainButtonTap),
              15.horizontalSpace,
              const _BuildCancelButton(),
            ],
          ),
          24.verticalSpace,
          MediaQuery.of(context).padding.bottom.verticalSpace,
        ],
      ),
    );
  }
}

class _BuildTitle extends StatelessWidget {
  const _BuildTitle(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.bold16.copyWith(color: AppColors.greyColors.c700),
      textAlign: TextAlign.center,
    );
  }
}

class _BuildMainIcon extends StatelessWidget {
  const _BuildMainIcon({
    Key? key,
    this.iconBackgroundColor,
    required this.iconPath,
  }) : super(key: key);
  final Color? iconBackgroundColor;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return CustomIcon(
      iconPath: iconPath,
      size: 72.r,
    );
  }
}

class _BuildCancelButton extends StatelessWidget {
  const _BuildCancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomButton(
      label: "cancel",
      onPressed: () => Navigator.of(context).pop(),
      type: CustomButtonType.secondary,
    ));
  }
}

class _BuildMainButton extends StatelessWidget {
  const _BuildMainButton({
    Key? key,
    required this.isLoadingState,
    required this.mainButtonLabel,
    required this.onMainButtonTap,
    required this.mainButtonType,
  }) : super(key: key);

  final StateProvider<bool> isLoadingState;
  final String mainButtonLabel;
  final FutureCallback? onMainButtonTap;
  final CustomButtonType? mainButtonType;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Consumer(builder: (context, ref, child) {
      final isLoading = ref.watch(isLoadingState);
      return CustomButton(
        label: mainButtonLabel,
        onPressed: onMainButtonTap != null
            ? () async {
                ref.read(isLoadingState.notifier).state = true;
                await onMainButtonTap!.call();
                ref.read(isLoadingState.notifier).state = false;
              }
            : () => Navigator.pop(context, true),
        // backgroundColor: AppColors.primaryColor,
        // colorLabel: AppColors.whiteColor,
        type: mainButtonType ?? CustomButtonType.secondary,
        isLoading: isLoading,
      );
    }));
  }
}
