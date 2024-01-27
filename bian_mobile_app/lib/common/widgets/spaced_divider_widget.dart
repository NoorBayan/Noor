import 'package:flutter/material.dart';
import '../../core/general/theme/theme.dart';

class SpacedDividerWidget extends StatelessWidget {
  const SpacedDividerWidget({Key? key, this.addedSpace, this.isWithAddedSpace = true}) : super(key: key);
  final double? addedSpace;
  final bool isWithAddedSpace;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(isWithAddedSpace)
        (addedSpace ?? 14).verticalSpace,
        const Divider(
          color: AppColors.disabledColor,
          thickness: 1,
        ),
        if(isWithAddedSpace)
        (addedSpace ?? 14).verticalSpace,
      ],
    );
  }
}
