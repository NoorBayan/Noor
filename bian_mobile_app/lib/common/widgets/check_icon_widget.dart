import '../../core/general/theme/theme.dart';
import 'package:flutter/material.dart';

import 'custom_animated_icon_check.dart';

class CheckIconWidget extends StatelessWidget {
  const CheckIconWidget({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 24.r,
      height: 24.r,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColors : AppColors.transparent,
          shape: BoxShape.circle,
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.disabledColor,
                )),
      child: isSelected
          ? CustomAnimatedIconCheckWidget(
              size: 21.r,
              color: AppColors.whiteColor,
              duration: const Duration(milliseconds: 300),
            )
          : const SizedBox.shrink(),
    );
  }
}
