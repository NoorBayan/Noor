import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../../core/general/theme/theme.dart';
import 'disable_widget.dart';
import 'widgets.dart';

enum CustomButtonType { primary, secondary, third, error, success }

enum CustomButtonSizeType {
  height60,
  height48,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.errorMode = false,
    this.disable = false,
    this.height,
    this.type = CustomButtonType.primary,
    this.textColor,
    this.buttonColor,
    this.sizeType = CustomButtonSizeType.height60,
    this.colorLoading,
    this.showNextIcon = false,
    this.nextIcon,
    this.labelTextStyle,
    this.isWithBorder = false,
    this.icon,
  }) : super(key: key);

  final CustomButtonType type;
  final CustomButtonSizeType sizeType;
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;
  final bool errorMode;
  final bool disable;
  final double? height;
  final Color? textColor;
  final Color? buttonColor;
  final Color? colorLoading;
  final bool showNextIcon;
  final Widget? nextIcon;
  final Widget? icon;
  final bool isWithBorder;
  final TextStyle? labelTextStyle;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = labelTextStyle ?? getTextStyle(type);
    double height = this.height ??
        (sizeType == CustomButtonSizeType.height48 ? 48.h : 60.h);
    double fontSize =
        (sizeType == CustomButtonSizeType.height48 ? 12.sp : 16.sp);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipSmoothRect(
        radius: AppDimensions.smoothBorderRadius,
        child: DisableWidget(
          condition: disable || errorMode,
          opacity: 0.4,
          child: ElevatedButton(
            onPressed: onPressed,
            style: errorMode
                ? AppButtonStyle.primaryErrorButtonStyle
                : getButtonStyle(type),
            child: _ButtonContent(
                isLoading: isLoading,
                errorMode: errorMode,
                showNextIcon: showNextIcon,
                label: label,
                nextIcon: nextIcon,
                textStyle: textStyle),
          ),
        ),
      ),
    );
  }

  ButtonStyle getButtonStyle(CustomButtonType buttonType) {
    switch (buttonType) {
      case CustomButtonType.primary:
        return AppButtonStyle.primaryButtonStyle(
            withOutElevation: true,
            primaryColor: AppColors.primaryColors,
            isWithBorder: isWithBorder);
      case CustomButtonType.secondary:
        return AppButtonStyle.primaryButtonStyle(
            withOutElevation: true,
            primaryColor: AppColors.greyColors.c100,
            isWithBorder: isWithBorder);
      case CustomButtonType.third:
        return AppButtonStyle.primaryButtonStyle(
            withOutElevation: true,
            primaryColor: AppColors.secondaryColors.c500,
            isWithBorder: isWithBorder);
      case CustomButtonType.error:
        return AppButtonStyle.primaryButtonStyle(
            withOutElevation: true,
            primaryColor: AppColors.errorColors.c600,
            isWithBorder: isWithBorder);
      case CustomButtonType.success:
        return AppButtonStyle.primaryButtonStyle(
            withOutElevation: true,
            primaryColor: AppColors.successColors,
            isWithBorder: isWithBorder);
      default:
        return AppButtonStyle.primaryButtonStyle(
            withOutElevation: true,
            primaryColor: AppColors.thirdColor,
            isWithBorder: isWithBorder);
    }
  }

  TextStyle getTextStyle(CustomButtonType type) {
    switch (type) {
      case CustomButtonType.primary:
        return AppButtonStyle.defaultTextStyle;
      case CustomButtonType.secondary:
        return AppButtonStyle.secondaryTextStyle;
      case CustomButtonType.third:
        return AppButtonStyle.thirdTextStyle;
      case CustomButtonType.error:
        return AppButtonStyle.defaultTextStyle;
      case CustomButtonType.success:
        return AppButtonStyle.secondaryTextStyle;
    }
  }
}

class _BuildLabel extends StatelessWidget {
  const _BuildLabel({
    Key? key,
    required this.label,
    required this.textStyle,
    this.overflow,
  }) : super(key: key);

  final String label;
  final TextStyle textStyle;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: textStyle,
      overflow: overflow,
    );
  }
}

class _BuildNextIconAndText extends StatelessWidget {
  const _BuildNextIconAndText({
    Key? key,
    required this.label,
    required this.textStyle,
    required this.nextIcon,
    required this.textColor,
  }) : super(key: key);

  final String label;
  final TextStyle textStyle;
  final Widget? nextIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _BuildLabel(
            label: label,
            textStyle: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: nextIcon ??
              _BuildIconIfNotNull(
                iconPath: 'AppIcons.next', //TODO: add actual icon
                iconWidth: 27.r,
                iconHeight: 27.r,
                iconColor: textColor,
              ),
        ),
        14.horizontalSpace,
      ],
    );
  }
}

class _BuildLoading extends StatelessWidget {
  const _BuildLoading({
    Key? key,
    required this.colorLoading,
  }) : super(key: key);

  final Color? colorLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26.r,
      width: 26.r,
      alignment: Alignment.center,
      child: Loading2(
        valueColor: colorLoading ?? AppColors.whiteColor,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      this.onPressed,
      required this.label,
      this.disable = false,
      this.colorLabel,
      this.iconColor,
      this.iconPath,
      this.iconSize,
      this.hide = false,
      this.addLineThroughLabel = false,
      this.backgroundColor,
      this.height,
      this.isDisableWithOpacity = true,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.iconHeight,
      this.iconWidth})
      : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final bool disable;
  final Color? colorLabel;
  final Color? iconColor;
  final String? iconPath;
  final double? iconSize;
  final double? iconWidth;
  final double? iconHeight;
  final bool hide;
  final bool addLineThroughLabel;
  final MainAxisAlignment mainAxisAlignment;
  final double? height;
  final bool isDisableWithOpacity;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !hide,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: height ?? 35.h,
        // width: double.infinity,
        child: DisableWidget(
            condition: disable,
            withOpacity: isDisableWithOpacity,
            child: InkWell(
              onTap: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  _BuildIconIfNotNull(
                      iconPath: iconPath,
                      iconSize: iconSize,
                      iconHeight: iconHeight,
                      iconWidth: iconWidth,
                      iconColor: iconColor),
                  SizedBox(
                    width: 6.w,
                  ),
                  _BuildLabel(
                    label: label,
                    textStyle: AppTextStyle.medium16.copyWith(
                        color: colorLabel,
                        decoration: addLineThroughLabel
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class _BuildIconIfNotNull extends StatelessWidget {
  const _BuildIconIfNotNull({
    Key? key,
    required this.iconPath,
    this.iconSize,
    required this.iconHeight,
    required this.iconWidth,
    required this.iconColor,
  }) : super(key: key);

  final String? iconPath;
  final double? iconSize;
  final double? iconHeight;
  final double? iconWidth;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    if (iconPath == null) {
      return Container();
    }
    return CustomIcon(
      iconPath: iconPath!,
      size: iconSize,
      height: iconHeight,
      width: iconWidth,
      iconColor: iconColor ?? AppColors.thirdColor,
    );
  }
}

// custom button outline with icon and text label

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.disable = false,
    this.labelColor,
    this.prefixIconColor,
    this.prefixIcon,
    this.prefixIconSize,
    this.hide = false,
    this.alignmentLabel = Alignment.center,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconSize,
    this.backgroundColor,
    this.showBorder = false,
    this.borderColor,
    this.buttonHeight,
    this.padding,
    this.isMainAlignmentCenter = false,
    this.paddingBetweenPrefixIconAndLabel,
    this.suffixIconWidget,
    this.labelStyle,
    this.borderRadius,
    this.prefixIconWidget,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final bool disable;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? prefixIconColor;
  final String? prefixIcon;
  final Widget? prefixIconWidget;
  final Size? prefixIconSize;
  final Widget? suffixIconWidget;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final Size? suffixIconSize;
  final bool hide;
  final AlignmentGeometry alignmentLabel;
  final bool showBorder;
  final Color? borderColor;
  final double? buttonHeight;
  final EdgeInsets? padding;
  final bool isMainAlignmentCenter;
  final double? paddingBetweenPrefixIconAndLabel;
  final TextStyle? labelStyle;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !hide,
      child: SizedBox(
        height: buttonHeight ?? 54.h,
        width: double.infinity,
        child: DisableWidget(
            condition: disable,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () => onPressed.call(),
              child: _buildButton(),
            )),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      width: 1.sw,
      padding: padding ??
          EdgeInsets.only(
            left: 10.w,
            right: 10.w,
          ),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: AppDimensions.smoothBorderRadius,
          side: showBorder
              ? BorderSide(
                  color: borderColor ?? AppColors.whiteColor,
                  // width: 1.r,
                )
              : BorderSide.none,
        ),
        color: backgroundColor ?? AppColors.whiteColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: isMainAlignmentCenter
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefixIconWidget != null) ...[
            prefixIconWidget!
          ] else if (prefixIcon != null)
            CustomIcon(
              iconPath: prefixIcon!,
              height: prefixIconSize?.height ?? 25.r,
              width: prefixIconSize?.width ?? 25.r,
              iconColor: prefixIconColor,
            ),
          SizedBox(
            width: paddingBetweenPrefixIconAndLabel ?? 6.w,
          ),
          isMainAlignmentCenter
              ? _BuildButtonText(
                  alignmentLabel: alignmentLabel,
                  isMainAlignmentCenter: isMainAlignmentCenter,
                  label: label,
                  labelStyle: labelStyle,
                  labelColor: labelColor)
              : Expanded(
                  child: _BuildButtonText(
                      alignmentLabel: alignmentLabel,
                      isMainAlignmentCenter: isMainAlignmentCenter,
                      label: label,
                      labelStyle: labelStyle,
                      labelColor: labelColor),
                ),
          if (suffixIcon != null || suffixIconWidget != null)
            Align(
              alignment: Alignment.centerLeft,
              child: suffixIconWidget ??
                  CustomIcon(
                    iconPath: suffixIcon!,
                    height: suffixIconSize?.height ?? 25.r,
                    width: suffixIconSize?.width ?? 25.r,
                    iconColor: suffixIconColor ?? AppColors.thirdColor,
                  ),
            ),
        ],
      ),
    );
  }
}

class _BuildButtonText extends StatelessWidget {
  const _BuildButtonText({
    super.key,
    required this.alignmentLabel,
    required this.isMainAlignmentCenter,
    required this.label,
    required this.labelStyle,
    required this.labelColor,
  });

  final AlignmentGeometry alignmentLabel;
  final bool isMainAlignmentCenter;
  final String label;
  final TextStyle? labelStyle;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentLabel,
      child: Row(
        mainAxisAlignment: isMainAlignmentCenter
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: labelStyle ??
                  AppTextStyle.regular16.copyWith(
                    color: labelColor ?? AppColors.greyColors.c800,
                    height: 1,
                    fontFeatures: [
                      const FontFeature
                          .tabularFigures(), //  to disable text stretching
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent(
      {super.key,
      required this.isLoading,
      required this.errorMode,
      this.colorLoading,
      required this.showNextIcon,
      required this.label,
      required this.textStyle,
      this.nextIcon,
      this.textColor,
      this.icon});
  final bool isLoading;
  final bool errorMode;
  final Color? colorLoading;
  final bool showNextIcon;
  final String label;
  final TextStyle textStyle;
  final Widget? nextIcon;
  final Color? textColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    if (isLoading && !errorMode) {
      return _BuildLoading(colorLoading: colorLoading);
    } else if (showNextIcon) {
      return _BuildNextIconAndText(
          label: label,
          textStyle: textStyle,
          nextIcon: nextIcon,
          textColor: textColor);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          _BuildLabel(
            label: label,
            textStyle: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }
  }
}
