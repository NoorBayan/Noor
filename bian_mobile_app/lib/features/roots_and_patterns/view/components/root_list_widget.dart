import 'package:bian_mobile_app/core/general/theme/text_style.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/controller/abjd_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/app/widgets/word_list_widget.dart';
import '../../../../common/widgets/custom_dropdown_widget.dart';
import '../../model/roots.dart';
import '../../../../core/general/theme/app_colors.dart';
import '../../controller/roots_list_controller.dart';

class RootListWidget extends ConsumerWidget {
  const RootListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? abjd = ref.watch(selectedAbjdProvider);
    final rootProvider = ref.watch(rootListControllerProvider(abjd));
    return WordListWidget<RootsModel>(
      initialValue:
          rootProvider.rootList.isNotEmpty ? rootProvider.rootList.first : null,
      wordList: rootProvider.rootList,
      onChanged: (value) {
        ref.read(selectedRootProvider.notifier).state = value?.root;
      },
    );
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 129.w,
        child: CustomDropdownWidget<RootsModel>(
          onChanged: (value) {
            ref.read(selectedRootProvider.notifier).state = value?.root;
          },
          value: rootProvider.rootList.isNotEmpty
              ? rootProvider.rootList.first
              : null,
          selectedItemBuilder: (context) => rootProvider.rootList
              .map((e) => DropdownMenuItem<RootsModel>(
                    value: e,
                    child: Text(
                      e.root,
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.secondaryColors),
                    ),
                  ))
              .toList(),
          items: rootProvider.rootList
              .map((e) => DropdownMenuItem<RootsModel>(
                    value: e,
                    child: Text(
                      e.root,
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.fontPrimaryColor),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
