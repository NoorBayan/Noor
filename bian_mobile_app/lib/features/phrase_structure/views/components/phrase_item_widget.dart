import 'package:bian_mobile_app/core/general/models/mappings.dart';
import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:bian_mobile_app/core/general/theme/theme.dart';
import 'package:bian_mobile_app/features/phrase_structure/views/components/card_widget1.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../roots_and_patterns/features/roots_and_patterns_details/controller/translation_controller.dart';
import 'card_widget2.dart';

class PhraseItemWidget extends ConsumerWidget {
  const PhraseItemWidget({
    super.key,
    required this.phraseModel,
  });
  final QuranModel phraseModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transController =
        ref.watch(translationControllerProvider(phraseModel.senId));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
      margin: const EdgeInsets.only(bottom: 20, left: 1, right: 1).h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: AppTheme.primaryShadow,
      ),
      child: Column(
        children: [
          CardWidget1(
            title1: phraseModel.relStemToken,
            subtitle1: pos_en[phraseModel.stemPos] ,
            subtitle2:  pos_ar[phraseModel.stemPos],
            title2: phraseModel.relStemRef,
            subtitle3: pos_en[phraseModel.stemRefPos],
            subtitle4: pos_ar[phraseModel.stemRefPos],
            arrow: phraseModel.relStemDir,
            arrowLabel: phraseModel.relLabelStem,
          ),
          20.verticalSpace,
          CardWidget2(
            title: transController.transModel?.ayah,
            subtitle: transController.transModel?.enTransliteration,
          ),
          20.verticalSpace,
          CardWidget2(
            title: transController.transModel?.enSahih?.trim(),
          )
        ],
      ),
    );
  }
}
