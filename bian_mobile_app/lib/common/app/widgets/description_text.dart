import 'package:bian_mobile_app/core/general/theme/app_colors.dart';
import 'package:bian_mobile_app/core/general/theme/text_style.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: AppTextStyle.bold16.copyWith(
        color: AppColors.fontPrimaryColor,
      ),
    );
  }
}
