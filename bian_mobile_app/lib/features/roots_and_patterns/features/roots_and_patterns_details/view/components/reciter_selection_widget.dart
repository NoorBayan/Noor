import 'package:bian_mobile_app/core/general/asset_path/app_fonts.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/controller/reciter_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/custom_dropdown_widget.dart';
import '../../../../../../core/general/theme/theme.dart';

class ReciterSelectionWidget extends StatelessWidget {
  const ReciterSelectionWidget(this.controller, {super.key});
  final ReciterController controller;
  @override
  Widget build(BuildContext context,) {
    return CustomDropdownWidget<String>(
      onChanged: (value) {
        if (value != null) {
          controller.updateReciter(value);
        }
      },
      iconEnabledColor: AppColors.primaryColors,
      fillColor: AppColors.secondaryColors,
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(color: AppColors.primaryColors, width: 3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      iconSize: 24.r,
      value: controller.currentReciter,
      selectedItemBuilder: (context) =>
          controller.reciterToAudioFile.keys
              .map((k) => DropdownMenuItem<String>(
                    value: k,
                    child: Text(
                      k,
                      style: AppTextStyle.bold16.copyWith(
                          color: AppColors.primaryColors,
                          fontFamily: AppFonts.gabarito),
                    ),
                  ))
              .toList(),
      items: controller.reciterToAudioFile.keys
          .map((k) => DropdownMenuItem<String>(
                value: k,
                child: Text(
                  k,
                  style: AppTextStyle.bold16.copyWith(
                      color: AppColors.primaryColors,
                      fontFamily: AppFonts.gabarito),
                ),
              ))
          .toList(),
    );
  }
}
