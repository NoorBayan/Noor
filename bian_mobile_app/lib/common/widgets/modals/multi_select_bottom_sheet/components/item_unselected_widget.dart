import 'package:flutter/material.dart';

import '../../../../../core/general/theme/app_colors.dart';
import '../../../custom_icon.dart';
import '../multi_select_bottom_sheet_view.dart';
import 'item_widget.dart';

class ItemUnSelectedWidget extends ItemWidget {
  ItemUnSelectedWidget({
    Key? key,
    String? label,
    VoidCallback? onPressed,
    String? prefixIcon,
    Color? iconItemColor,
    Color? colorLabel,
    Size? iconItemSize,
    ItemBuilderMultiSelect? labelWidgetBuilder,
    IconTypes? prefixIconType,
    double? buttonHeight,
    bool? isWithCheckButton,
    double? itemSpacing,
  }) : super(
            key: key,
            colorLabel: colorLabel ?? AppColors.greyColors.c800,
            iconItemColor: iconItemColor,
            iconItemSize: iconItemSize,
            itemSpacing: itemSpacing,
            backGroundColor: AppColors.greyColors.c50,
            border: BorderSide(
              color: Colors.transparent,
              width: MultiSelectBottomSheetView.itemBorderWidth,
            ),
            isWithCheckButton: isWithCheckButton ?? true,
            buttonHeight: buttonHeight,
            isItemSelectedWidgetType: false,
            label: label,
            labelWidgetBuilder: labelWidgetBuilder,
            onPressed: onPressed,
            prefixIcon: prefixIcon,
            prefixIconType: prefixIconType);
}
