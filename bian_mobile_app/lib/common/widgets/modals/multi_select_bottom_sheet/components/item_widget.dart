import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/general/theme/app_colors.dart';
import '../../../../../core/general/theme/text_style.dart';
import '../../../check_icon_widget.dart';
import '../../../custom_animated_icon_check.dart';
import '../../../custom_icon.dart';
import '../multi_select_bottom_sheet_view.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    this.label,
    this.onPressed,
    this.prefixIcon,
    this.iconItemColor,
    this.colorLabel,
    this.iconItemSize,
    this.labelWidgetBuilder,
    this.prefixIconType,
    this.itemSpacing,
    this.buttonHeight,
    this.isWithCheckButton = true,
    required this.backGroundColor,
    required this.border,
    required this.isItemSelectedWidgetType,
  })  : assert(label != null || labelWidgetBuilder != null),
        super(key: key);

  final String? label;
  final VoidCallback? onPressed;
  final String? prefixIcon;
  final Color? iconItemColor;
  final Color? colorLabel;
  final Size? iconItemSize;
  final double? buttonHeight;
  final ItemBuilderMultiSelect? labelWidgetBuilder;
  final IconTypes? prefixIconType;
  final double? itemSpacing;
  final Color backGroundColor;
  final BorderSide border;
  final bool isItemSelectedWidgetType;
  final bool isWithCheckButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: DefaultTextStyle(
        style: AppTextStyle.medium16.copyWith(
          color: colorLabel ?? AppColors.greyColors.c800,
          height: 1,
        ),
        child: Container(
          height: buttonHeight ?? MultiSelectBottomSheetView.itemHeight,
          margin: const EdgeInsets.only(bottom: 12).h,
          decoration: ShapeDecoration(
              color: backGroundColor,
              shape: SmoothRectangleBorder(
                  side: border,
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: MultiSelectBottomSheetView.itemBorderRadius,
                    cornerSmoothing: 0,
                  ))),
          padding: EdgeInsets.symmetric(
            horizontal: 18.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: labelWidgetBuilder?.call(context) ??
                    Row(
                      children: [
                        if (prefixIcon != null)
                          _BuildPrefixIconIfNotNull(
                              prefixIconType: prefixIconType,
                              prefixIcon: prefixIcon,
                              itemSpacing: itemSpacing,
                              iconItemSize: iconItemSize,
                              iconItemColor: iconItemColor),
                        _BuildLabel(label: label),
                      ],
                    ),
              ),
              _BuildCheckBoxIconIfSelectedItemWidgetType(
                  isItemSelectedWidgetType),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildCheckBoxIconIfSelectedItemWidgetType extends StatelessWidget {
  const _BuildCheckBoxIconIfSelectedItemWidgetType(
    this.isItemSelectedWidgetType, {
    Key? key,
  }) : super(key: key);
  final bool isItemSelectedWidgetType;
  @override
  Widget build(BuildContext context) {
    return CheckIconWidget(isSelected: isItemSelectedWidgetType);
  }
}

class _BuildLabel extends StatelessWidget {
  const _BuildLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
    );
  }
}

class _BuildPrefixIconIfNotNull extends StatelessWidget {
  const _BuildPrefixIconIfNotNull({
    Key? key,
    required this.prefixIconType,
    required this.prefixIcon,
    required this.iconItemSize,
    required this.iconItemColor,
    required this.itemSpacing,
  }) : super(key: key);

  final IconTypes? prefixIconType;
  final String? prefixIcon;
  final Size? iconItemSize;
  final Color? iconItemColor;
  final double? itemSpacing;

  @override
  Widget build(BuildContext context) {
    if (prefixIcon == null) {
      return Container();
    }
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsetsDirectional.only(end: itemSpacing ?? 6.w),
      child: CustomIcon(
        iconType: prefixIconType ?? IconTypes.svg,
        iconPath: prefixIcon!,
        size: iconItemSize?.width ?? 25.r,
        iconColor: iconItemColor,
      ),
    );
  }
}
