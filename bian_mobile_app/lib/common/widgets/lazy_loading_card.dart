import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_shimmer.dart';

class LazyLoadingCard extends StatelessWidget {
  const LazyLoadingCard({Key? key, this.count = 1, this.enabled = true})
      : super(key: key);
  final int count;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: templateShimmer,
    );
  }

  Widget get templateShimmer => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i <= count; i++) ...[
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
              SizedBox(
                height: 24.h,
              ),
            ],
          ],
        ),
      );
}
