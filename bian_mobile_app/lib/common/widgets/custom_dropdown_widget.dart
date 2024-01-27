import 'dart:math';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/general/theme/theme.dart';
import 'widgets.dart';

class CustomDropdownWidget<T> extends StatelessWidget {
  const CustomDropdownWidget(
      {super.key,
      required this.items,
      this.alignment,
      this.value,
      this.autofocus = false,
      this.borderRadius,
      this.decoration,
      this.icon,
      this.disableHint,
      this.dropdownColor,
      this.elevation,
      this.enableFeedback,
      this.focusColor,
      this.focusNode,
      this.fieldTitle,
      this.formControl,
      this.hint,
      this.iconDisabledColor,
      this.iconEnabledColor,
      this.iconSize,
      this.onTap,
      this.validationMessages,
      this.prefix,
      this.prefixIcon,
      this.setPrefixIconToTopStart = false,
      this.prefixIconSize,
      this.prefixText,
      this.prefixStyle,
      this.prefixIconColor,
      this.suffixText,
      this.suffixStyle,
      this.hintText,
      this.helperText,
      this.suffix,
      this.suffixIcon,
      this.suffixIconWidget,
      this.suffixIconSize,
      this.suffixIconColor,
      this.onPressedSuffixIcon,
      this.border,
      this.selectedItemBuilder,
      this.showLoadingOnPendingValidator = true,
      this.onChanged,
      this.fillColor});
  final String? fieldTitle;
  final List<DropdownMenuItem<T>> items;
  final AlignmentGeometry? alignment;
  final bool autofocus;
  final BorderRadius? borderRadius;
  final InputDecoration? decoration;
  final Widget? icon;
  final Widget? disableHint;
  final Color? dropdownColor;
  final int? elevation;
  final bool? enableFeedback;
  final Color? focusColor;
  final Color? fillColor;
  final FocusNode? focusNode;
  final FormControl<T>? formControl;
  final Widget? hint;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double? iconSize;
  final Function()? onTap;
  final Map<String, String Function(Object)>? validationMessages;
  final Widget? prefix;
  final String? prefixIcon;
  final bool setPrefixIconToTopStart;
  final Size? prefixIconSize;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Color? prefixIconColor;
  final String? suffixText;
  final InputBorder? border;
  final TextStyle? suffixStyle;
  final String? hintText;
  final String? helperText;
  final Widget? suffix;
  final T? value;
  final String? suffixIcon;
  final Widget? suffixIconWidget;
  final Size? suffixIconSize;
  final Color? suffixIconColor;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final VoidCallback? onPressedSuffixIcon;
  final bool showLoadingOnPendingValidator;
  final void Function(T?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ClipSmoothRect(
      radius: SmoothBorderRadius(cornerRadius: 7),
      child: DropdownButtonFormField<T>(
        items: items,
        alignment: alignment ?? AlignmentDirectional.centerStart,
        autofocus: autofocus,
        borderRadius: borderRadius,
        decoration: decoration ?? _buildInputDecoration(),
        icon: icon,
        // isDense: true,
        isExpanded: true,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        style: AppTextStyle.bold16.copyWith(color: AppColors.fontPrimaryColor),
        onChanged: onChanged,
        disabledHint: disableHint,
        dropdownColor: dropdownColor,
        elevation: elevation ?? 8,
        enableFeedback: enableFeedback,
        focusColor: focusColor,

        focusNode: focusNode,
        hint: hint,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor ?? AppColors.secondaryColors,
        iconSize: iconSize ?? 24,
        onTap: onTap,
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      contentPadding: AppTextFieldStyle.contentPadding,
      fillColor: fillColor ?? AppColors.primaryColors,
      filled: true,
      prefix: prefix,
      prefixIcon: prefixIcon == null
          ? null
          : (setPrefixIconToTopStart
              ? Container(
                  margin: EdgeInsetsDirectional.only(
                    start: 12.w,
                    end: 8.w,
                    // top: 8.h,
                    // bottom: 8.h,
                  ),
                  height: 20.r,
                  width: 20.r,
                )
              : _buildPrefixIcon()),
      prefixIconConstraints: BoxConstraints(
        maxWidth: 45.w,
        maxHeight: 45.h,
      ),
      prefixText: prefixText,
      prefixStyle: prefixStyle ?? AppTextFieldStyle.textStyle,
      border: border ?? AppTextFieldStyle.border,
      disabledBorder: AppTextFieldStyle.border,
      focusedBorder: border ??AppTextFieldStyle.focusedBorder,
      enabledBorder: border?? AppTextFieldStyle.enabledBorder,
      errorBorder: AppTextFieldStyle.errorBorder,
      focusedErrorBorder: AppTextFieldStyle.focusedErrorBorder,

      hintText: hintText,
      hintStyle: AppTextFieldStyle.hintTextStyle.copyWith(letterSpacing: 0),

      errorStyle: AppTextFieldStyle.errorTextStyle,

      helperText: helperText,
      suffix: suffix,

      // suffixIcon: suffixIconWidget ??
      //     (showLoadingOnPendingValidator
      //         ? _buildLoading()
      //         : suffixIcon == null
      //             ? null
      //             : _buildsuffixIcon()),

      suffixText: suffixText,
      suffixStyle: suffixStyle,
    );
  }

  Widget _buildPrefixIcon() {
    return Container(
      // color: AppColors.testDesginColor,
      // constraints: BoxConstraints(
      //   maxWidth: 45.w,
      //   maxHeight: 34.h,
      // ),
      // alignment: AlignmentDirectional.centerStart,
      margin: EdgeInsetsDirectional.only(
        start: 12.w,
        end: 8.w,
        // top: 8.h,
        // bottom: 8.h,
      ),
      child: CustomIcon(
        iconPath: prefixIcon!,
        height: prefixIconSize?.height ?? 8.r,
        width: prefixIconSize?.width ?? 13.r,
        iconColor: prefixIconColor,
      ),
    );
  }

  Widget _buildsuffixIcon() {
    return GestureDetector(
      onTap: onPressedSuffixIcon,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // direction: Axis.horizontal,
          // crossAxisAlignment: WrapCrossAlignment.center,
          // alignment: WrapAlignment.center,
          children: [
            // Container(
            //   height: 31,
            //   width: 2.w,
            //   color: AppColors.deactivatedButtonsColor,
            // ),
            // SizedBox(
            //   width: 12.w,
            // ),
            CustomIcon(
              iconPath: suffixIcon!,
              height: suffixIconSize?.height ?? 8.r,
              width: suffixIconSize?.width ?? 13.r,
              iconColor: suffixIconColor,
            ),
          ],
        ),
      ),
    );
  }
}
