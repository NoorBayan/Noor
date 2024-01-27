import 'package:flutter/material.dart';

import '../../core/general/theme/theme.dart';
import 'custom_shimmer.dart';

class LazyLoadingCardWidget extends StatelessWidget {
  const LazyLoadingCardWidget({Key? key, this.count = 1, this.enabled = true})
      : super(key: key);
  final int count;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 30.h),
      child: templateShimmer,
    );
  }

  Widget get templateShimmer => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i <= count; i++) ...[
              _item(enabled: enabled),
              // SizedBox(
              //   height: 24.h,
              // ),
            ],
          ],
        ),
      );
}

class _item extends StatelessWidget {
  const _item({
    Key? key,
    required this.enabled,
  }) : super(key: key);

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: AppTheme.primaryShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.square(
                size: 42.r,
                borderRadius: 8.r,
                enabled: enabled,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: 18.h,
                    width: 200.w,
                    enabled: enabled,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  ShimmerWidget.rectangular(
                    height: 12.h,
                    width: 200.w,
                    enabled: enabled,
                  ),
                ],
              ),
              Expanded(
                child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: ShimmerWidget.rectangular(
                      height: 8.h,
                      width: 40.w,
                      enabled: enabled,
                    )),
              ),
            ],
          ),
          14.verticalSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(
                height: 18.h,
                // width: 200.w,
                enabled: enabled,
              ),
              SizedBox(
                height: 6.h,
              ),
              ShimmerWidget.rectangular(
                height: 12.h,
                // width: 200.w,
                enabled: enabled,
              ),
            ],
          ),
          14.verticalSpace,
          const Divider(
            color: AppColors.disabledColor,
            thickness: 1,
          ),
          Center(
            child: ShimmerWidget.rectangular(
              height: 12.h,
              width: 74.w,
              enabled: enabled,
            ),
          ),
        ],
      ),
    );
  }
}
