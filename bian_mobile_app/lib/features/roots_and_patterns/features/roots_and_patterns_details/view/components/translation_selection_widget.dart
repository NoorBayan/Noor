import 'package:bian_mobile_app/core/general/asset_path/app_fonts.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/controller/translation_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/widgets/custom_dropdown_widget.dart';
import '../../../../../../core/general/theme/theme.dart';

class TranslationSelectionWidget extends StatelessWidget {
  const TranslationSelectionWidget(this.controller, {super.key});
  final TranslationController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.35.sw,
      child: CustomDropdownWidget<String>(
        onChanged: (value) {
          if (value != null) {
            controller.updateLanguage(value);
          }
        },
        iconEnabledColor: AppColors.primaryColors,
        fillColor: AppColors.secondaryColors,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColors, width: 3),
          borderRadius: BorderRadius.circular(12.r),
        ),
        value: controller.selectedLanguage ?? "English",
        selectedItemBuilder: (context) =>
            controller.languageToTranslationMapping.keys
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
        items: controller.languageToTranslationMapping.keys
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
      ),
    );
  }
}
