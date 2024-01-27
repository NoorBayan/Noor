import 'package:bian_mobile_app/core/general/models/abjd.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/general/theme/theme.dart';

class AbjdItemWidget extends StatelessWidget {
  const AbjdItemWidget(
      {super.key, required this.abjdModel, required this.isActive});
  final AbjdModel abjdModel;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.r,
      height: 29.r,
      decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColors : AppColors.secondaryColors,
          boxShadow: AppTheme.primaryShadow,
          borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Text(
          abjdModel.abjd,
          style: AppTextStyle.bold16.copyWith(
            color: isActive
                ? AppColors.secondaryColors
                : AppColors.fontPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
