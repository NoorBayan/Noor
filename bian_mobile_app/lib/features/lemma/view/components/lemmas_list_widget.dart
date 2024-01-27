import 'package:bian_mobile_app/features/lemma/model/lemmas.dart';
import 'package:bian_mobile_app/core/general/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/app/widgets/word_list_widget.dart';
import '../../../../common/widgets/custom_dropdown_widget.dart';
import '../../../../core/general/theme/app_colors.dart';
import '../../controller/abjd_list_controller.dart';
import '../../controller/lemmas_list_controller.dart';

class LemmasListWidget extends ConsumerWidget {
  const LemmasListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? abjd = ref.watch(selectedAbjdProvider);
    final lemmaProvider = ref.watch(lemmaListControllerProvider(abjd));
    return WordListWidget<LemmasModel>(
      initialValue: lemmaProvider.lemmaList.isNotEmpty
          ? lemmaProvider.lemmaList.first
          : null,
      wordList: lemmaProvider.lemmaList,
      onChanged: (value) {
        ref.read(selectedLemmaProvider.notifier).state = value?.lemma;
      },
    );
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 129.w,
        child: CustomDropdownWidget<LemmasModel>(
          onChanged: (value) {
            ref.read(selectedLemmaProvider.notifier).state = value?.lemma;
          },
          value: lemmaProvider.lemmaList.isNotEmpty
              ? lemmaProvider.lemmaList.first
              : null,
          selectedItemBuilder: (context) => lemmaProvider.lemmaList
              .map((e) => DropdownMenuItem<LemmasModel>(
                    value: e,
                    child: Text(
                      e.lemma,
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.secondaryColors),
                    ),
                  ))
              .toList(),
          items: lemmaProvider.lemmaList
              .map((e) => DropdownMenuItem<LemmasModel>(
                    value: e,
                    child: Text(
                      e.lemma,
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
