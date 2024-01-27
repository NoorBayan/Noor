import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../common/widgets/custom_icon.dart';
import '../../../../core/general/asset_path/app_fonts.dart';
import '../../../../core/general/asset_path/app_icons.dart';
import '../../../../core/general/theme/theme.dart';

class CardWidget2 extends StatelessWidget {
  const CardWidget2({
    super.key,
    this.title,
    this.subtitle,
  });
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    if (title == null && subtitle == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.secondaryColors,
        border: Border.all(
          width: 2,
          color: AppColors.primaryColors,
        ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            child: _BuildLabel(
          title: title,
          subtitle: subtitle,
        )),
      ]),
    );
  }
}

class _BuildLabel extends StatelessWidget {
  const _BuildLabel({this.title, this.subtitle});
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(
            title!,
            style: AppTextStyle.bold18
                .copyWith(color: AppColors.fontSecondaryColor, height: 1.3),
            textAlign: subtitle == null ? TextAlign.center : TextAlign.end,
          ),
        if (subtitle != null) ...[
          3.verticalSpace,
          Row(
            children: [
              Flexible(
                child: HtmlWidget(
                  // textDirection: TextDirection.ltr,
                  subtitle!,
                  textStyle: AppTextStyle.bold14.copyWith(
                      color: AppColors.fontPrimaryColor,
                      height: 1.3,
                      fontFamily: AppFonts.gabarito),
                  // textAlign: TextAlign.center,
                ),
              ),
            ],
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
