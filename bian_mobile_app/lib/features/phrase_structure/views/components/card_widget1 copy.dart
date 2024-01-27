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
              color: AppColors.primaryColors,
            ),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: _BuildLabel(
              title: title1,
              subtitle: subtitle1,
              subtitle2: subtitle2,
            )),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxHeight,
                  height: constraints.maxWidth,
                  child: _BuildSeparatingArrow(
                    arrow: arrow,
                  ),
                );
              }),
            ),
            Expanded(
                child: _BuildLabel(
              title: title2,
              subtitle: subtitle3,
              subtitle2: subtitle4,
            )),
          ]),
        ),
        if (arrowLabel != null) ...[
          3.7.verticalSpace,
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
      ],
    );
  }
}

class _BuildSeparatingArrow extends StatelessWidget {
  const _BuildSeparatingArrow({super.key, this.arrow});
  final String? arrow;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        VerticalDivider(
          color: AppColors.primaryColors,
          thickness: 2,
        ),
        Center(
          child: _BuildArrowIfNotNull(arrow: arrow),
        )
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
    return RotatedBox(
      quarterTurns: arrow == ">" ? 2 : 0,
      child: CustomIcon(
        iconPath: AppIcons.relationArrow,
        width: 27.98.r,
        height: 27.19,
      ),
    );
  }
}
