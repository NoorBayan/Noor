import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/general/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key, this.height, this.width, this.color})
      : super(key: key);

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.disabledColor,
      height: height ?? 1.h,
      width: width ?? double.infinity,
    );
  }
}
