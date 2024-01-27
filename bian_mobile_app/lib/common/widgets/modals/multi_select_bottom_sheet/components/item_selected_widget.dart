
import 'package:flutter/material.dart';

import '../../../../../core/general/theme/app_colors.dart';
import '../../../custom_icon.dart';
import '../multi_select_bottom_sheet_view.dart';
import 'item_widget.dart';

class ItemSelectedWidget extends ItemWidget {
  ItemSelectedWidget({
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
    double? itemSpacing,
  }) : super(
            key: key,
            colorLabel:
                colorLabel ?? MultiSelectBottomSheetView.itemTextSelectColor,
            itemSpacing: itemSpacing,
            iconItemColor: iconItemColor,
            iconItemSize: iconItemSize,
            buttonHeight: buttonHeight,
            backGroundColor: AppColors.primaryColors.withOpacity(.3),
            border: BorderSide(
              color: MultiSelectBottomSheetView.itemSelectColor,
              width: MultiSelectBottomSheetView.itemBorderWidth,
            ),
            isItemSelectedWidgetType: true,
            label: label,
            labelWidgetBuilder: labelWidgetBuilder,
            onPressed: onPressed,
            prefixIcon: prefixIcon,
            prefixIconType: prefixIconType);
}
