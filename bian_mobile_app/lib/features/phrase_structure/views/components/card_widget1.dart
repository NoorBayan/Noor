import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_icon.dart';
import '../../../../core/general/asset_path/app_fonts.dart';
import '../../../../core/general/asset_path/app_icons.dart';
import '../../../../core/general/theme/theme.dart';

class CardWidget1 extends StatelessWidget {
  const CardWidget1(
      {super.key,
      this.title1,
      this.subtitle1,
      this.title2,
      this.subtitle2,
      this.arrow,
      this.arrowLabel,
      this.subtitle3,
      this.subtitle4});
  final String? title1;
  final String? subtitle1;
  final String? subtitle2;
  final String? title2;
  final String? subtitle3;
  final String? subtitle4;
  final String? arrow;
  final String? arrowLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.secondaryColors,
            border: Border.all(
              width: 2,
              color: AppColors.primaryColors,
            ),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: _BuildLabel(
              title: title1,
              subtitle: subtitle1,
              subtitle2: subtitle2,
            )),
            _BuildSeparatingArrowAndLabel(
              arrow: arrow,
              arrowLabel: arrowLabel,
            ),
            Expanded(
                child: _BuildLabel(
              title: title2,
              subtitle: subtitle3,
              subtitle2: subtitle4,
            )),
          ]),
        ),
      ],
    );
  }
}

class _BuildLabel extends StatelessWidget {
  const _BuildLabel({this.title, this.subtitle, this.subtitle2});
  final String? title;
  final String? subtitle;
  final String? subtitle2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        15.6.verticalSpace,
        if (title != null)
          Text(
            title!,
            style: AppTextStyle.bold20
                .copyWith(color: AppColors.fontSecondaryColor, height: 1.3),
            textAlign: TextAlign.center,
          ),
        if (subtitle != null) ...[
          3.verticalSpace,
          Text(
            textDirection: TextDirection.ltr,
            subtitle!,
            style: AppTextStyle.bold14.copyWith(
                color: AppColors.fontPrimaryColor,
                height: 1.3,
                fontFamily: AppFonts.gabarito),
            textAlign: TextAlign.center,
          ),
        ],
        if (subtitle2 != null) ...[
          3.verticalSpace,
          Text(
            textDirection: TextDirection.ltr,
            subtitle2!,
            style: AppTextStyle.bold14.copyWith(
                color: AppColors.fontPrimaryColor,
                height: 1.3,
                fontFamily: AppFonts.gabarito),
            textAlign: TextAlign.center,
          ),
        ],
        11.4.verticalSpace,
      ],
    );
  }
}

class _BuildSeparatingArrowAndLabel extends StatelessWidget {
  const _BuildSeparatingArrowAndLabel({super.key, this.arrow, this.arrowLabel});
  final String? arrow;
  final String? arrowLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BuildArrowIfNotNull(arrow: arrow),
        if (arrowLabel != null) ...[
          // 10.7.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                arrowLabel!,
                style: AppTextStyle.bold12.copyWith(
                    color: AppColors.primaryColors,
                    fontFamily: AppFonts.gabarito),
              )
            ],
          )
        ]
      ],
    );
  }
}

class _BuildArrowIfNotNull extends StatelessWidget {
  const _BuildArrowIfNotNull({super.key, this.arrow});
  final String? arrow;
  @override
  Widget build(BuildContext context) {
    if (arrow == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 9).h,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: arrow == ">"
            ? CustomIcon(
                iconPath: AppIcons.arrowRight,
                width: 130.42.r,
                height: 29.46.r,
              )
            : CustomIcon(
                iconPath: AppIcons.arrowLeft,
                width: 130.42.r,
                height: 29.46.r,
              ),
      ),
    );
  }
}
