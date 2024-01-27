import 'package:bian_mobile_app/core/general/util/extensions/string.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/controller/reciter_controller.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/controller/translation_controller.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/view/components/audio_widget.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/view/components/translation_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/general/asset_path/app_fonts.dart';
import '../../../../../../core/general/theme/theme.dart';
import 'reciter_selection_widget.dart';

class ExampleCardWidget extends StatelessWidget {
  const ExampleCardWidget({super.key, required this.controller});
  final TranslationController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColors,
        boxShadow: AppTheme.primaryShadow,
        borderRadius: BorderRadius.circular(26),
      ),
      width: 1.sw,
      margin: const EdgeInsets.all(1),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textDirection: TextDirection.ltr,
            "Example",
            style: AppTextStyle.bold20.copyWith(
                color: AppColors.fontSecondaryColor,
                fontFamily: AppFonts.gabarito,
                height: 1.3),
            textAlign: TextAlign.start,
          ),
          12.verticalSpace,
          _BuildReciterAndPlayButton(
              controller.transModel?.chapterId.toString(),
              controller.transModel?.verseId.toString()),
          12.verticalSpace,
          if (controller.transModel?.ayah != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12).h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      controller.transModel!.ayah!,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyle.bold18.copyWith(
                          color: AppColors.fontPrimaryColor, height: 1.5),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          if (controller.transModel?.enTransliteration != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12).h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: HtmlWidget(
                      controller.transModel!.enTransliteration!,
                      // textDirection: TextDirection.ltr,
                      textStyle: AppTextStyle.bold16.copyWith(
                          color: AppColors.fontPrimaryColor,
                          fontFamily: AppFonts.SST,
                          height: 1.3),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          TranslationSelectionWidget(controller),
          12.verticalSpace,
          if (controller.transModel?.enSahih != null ||
              controller.currentTranslation != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    controller.currentTranslation ??
                        controller.transModel!.enSahih!,
                    textDirection: TextDirection.ltr,
                    style: AppTextStyle.bold18.copyWith(
                        color: AppColors.fontPrimaryColor,
                        fontFamily: AppFonts.SST,
                        height: 1.3),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _BuildReciterAndPlayButton extends ConsumerWidget {
  const _BuildReciterAndPlayButton(this.chapterId, this.verseId, {super.key});
  final String? chapterId;
  final String? verseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (chapterId == null || verseId == null) {
      return const SizedBox.shrink();
    }
    final reciterController = ref.watch(reciterControllerProvider);
    return Row(
      children: [
        AudioWidget(
            "${reciterController.getAudioFile}${chapterId!.toTwoLeadingZeros}${verseId!.toTwoLeadingZeros}.mp3"),
        8.horizontalSpace,
        Expanded(
          child: ReciterSelectionWidget(reciterController))
      ],
    );
  }
}
