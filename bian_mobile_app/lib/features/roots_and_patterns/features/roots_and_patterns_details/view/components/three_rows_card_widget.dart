import 'package:flutter/material.dart';

import '../../../../../../core/general/asset_path/app_fonts.dart';
import '../../../../../../core/general/theme/theme.dart';

class ThreeRowsCardWidget extends StatelessWidget {
  const ThreeRowsCardWidget({
    super.key,
    required this.mainTitle,
    this.word1,
    this.word2,
    this.word3,
    this.word4,
    this.isOneRowOnly = false,
    this.isTwoRowsOnly = false,
  });
  final bool isOneRowOnly;
  final bool isTwoRowsOnly;
  final String mainTitle;
  final WordColumn? word1;
  final WordColumn? word2;
  final WordColumn? word3;
  final WordColumn? word4;
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
        children: [
          Row(
            children: [
              Text(
                mainTitle,
                textDirection: TextDirection.ltr,
                style: AppTextStyle.bold20.copyWith(
                    color: AppColors.fontSecondaryColor,
                    fontFamily: AppFonts.gabarito,
                    height: 1.3),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          18.verticalSpace,
          SizedBox(
            width: 1.sw - 32.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (word1 != null)
                  _BuiltItem(
                    word: word1!,
                    isOneRowsOnly: isOneRowOnly,
                    isTwoRowsOnly: isTwoRowsOnly,
                  ),
                if (word2 != null)
                  _BuiltItem(
                    word: word2!,
                    isOneRowsOnly: isOneRowOnly,
                    isTwoRowsOnly: isTwoRowsOnly,
                  ),
                if (word3 != null)
                  _BuiltItem(
                    word: word3!,
                    isOneRowsOnly: isOneRowOnly,
                    isTwoRowsOnly: isTwoRowsOnly,
                  ),
                if (word4 != null)
                  _BuiltItem(
                    word: word4!,
                    isOneRowsOnly: isOneRowOnly,
                    isTwoRowsOnly: isTwoRowsOnly,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BuiltItem extends StatelessWidget {
  const _BuiltItem(
      {super.key,
      required this.word,
      required this.isTwoRowsOnly,
      required this.isOneRowsOnly});
  final WordColumn word;
  final bool isOneRowsOnly;
  final bool isTwoRowsOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (word.title != null) ...[
          Text(
            word.title!,
            textDirection: TextDirection.ltr,
            style: AppTextStyle.bold16.copyWith(
                color: AppColors.fontForthColor,
                fontFamily: AppFonts.gabarito,
                height: 1.3),
            textAlign: TextAlign.center,
          ),
          8.verticalSpace,
        ],
        Text(
          word.subtitle1 ?? "-",
          style: AppTextStyle.bold14
              .copyWith(color: AppColors.fontForthColor, height: 1.3),
          textAlign: TextAlign.center,
        ),
        if (!isOneRowsOnly) ...[
          8.verticalSpace,
          Text(
            word.subtitle2 ?? "-",
            style: AppTextStyle.bold16
                .copyWith(color: AppColors.fontForthColor, height: 1.3),
            textAlign: TextAlign.center,
          ),
        ],
        if (!isTwoRowsOnly && !isOneRowsOnly) ...[
          8.verticalSpace,
          Text(
            word.subtitle3 ?? "-",
            style: AppTextStyle.bold16
                .copyWith(color: AppColors.fontForthColor, height: 1.3),
            textAlign: TextAlign.center,
          ),
        ]
      ],
    );
  }
}

class WordColumn {
  final String? title;
  final String? subtitle1;
  final String? subtitle2;
  final String? subtitle3;
  WordColumn({
    this.title,
    required this.subtitle1,
    required this.subtitle2,
    this.subtitle3,
  });
}
