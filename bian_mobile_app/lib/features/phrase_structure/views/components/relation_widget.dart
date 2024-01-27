import 'package:bian_mobile_app/core/general/asset_path/app_fonts.dart';
import 'package:bian_mobile_app/features/phrase_structure/controller/relation_label_list_controller.dart';
import 'package:bian_mobile_app/features/phrase_structure/models/relation_label_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/custom_dropdown_widget.dart';
import '../../../../core/general/theme/theme.dart';

class RelationWidget extends ConsumerWidget {
  const RelationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(relationLabelListControllerProvider);
    final selectedRelation = ref.watch(selectedRelationLabelProvider);
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Dependency Relations",
              style: AppTextStyle.bold16.copyWith(color: AppColors.fontThirdColor),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        10.verticalSpace,
        CustomDropdownWidget<RelationLabelModel>(
          onChanged: (value) {
            ref.read(selectedRelationLabelProvider.notifier).state = value;
          },
          iconEnabledColor: AppColors.primaryColors,
          fillColor: AppColors.secondaryColors,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColors),
            borderRadius: BorderRadius.circular(12.r),
          ),
          value: selectedRelation,
          selectedItemBuilder: (context) => controller.relationLabelList
              .map((e) => DropdownMenuItem<RelationLabelModel>(
                    value: e,
                    child: Text(
                      e.relLabelStem,
                      style: AppTextStyle.bold16.copyWith(
                          color: AppColors.primaryColors,
                          fontFamily: AppFonts.gabarito),
                    ),
                  ))
              .toList(),
          items: controller.relationLabelList
              .map((e) => DropdownMenuItem<RelationLabelModel>(
                    value: e,
                    child: Text(
                      e.relLabelStem,
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.fontPrimaryColor),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
