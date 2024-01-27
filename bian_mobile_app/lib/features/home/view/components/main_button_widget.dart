import 'package:bian_mobile_app/common/widgets/custom_button.dart';
import 'package:bian_mobile_app/core/general/asset_path/app_fonts.dart';
import 'package:bian_mobile_app/core/general/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({super.key, required this.onTap, required this.label});
  final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: AppDimensions.borderRadius,
          boxShadow: AppTheme.primaryShadow),
      child: CustomButton(
          onPressed: onTap,
          label: label,
          height: 72.h,
          labelTextStyle: AppTextStyle.bold24.copyWith(
              fontFamily: AppFonts.gabarito, color: AppColors.secondaryColors)),
    );
  }
}
