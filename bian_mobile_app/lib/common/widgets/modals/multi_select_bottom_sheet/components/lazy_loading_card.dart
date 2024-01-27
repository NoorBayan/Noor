import 'package:flutter/material.dart';
import '../../../../../core/general/theme/theme.dart';

import '../../../custom_shimmer.dart';

class LazyLoadingCard extends StatelessWidget {
  const LazyLoadingCard({
    Key? key,
    this.countCard = 7,
  }) : super(key: key);

  final int countCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: templateShimmer,
    );
  }

  Widget get templateShimmer => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i <= countCard; i++)
              Container(
                margin: EdgeInsets.only(bottom: 12.h),
                child: ShimmerWidget.rectangular(
                  height: 56.h,
                  borderRadius: 8.r,
                  baseColor: AppColors.inputFormColor,
                ),
              ),
          ],
        ),
      );
}
