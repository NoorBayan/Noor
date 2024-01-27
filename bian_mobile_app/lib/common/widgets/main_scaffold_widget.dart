import 'package:bian_mobile_app/core/general/theme/app_colors.dart';
import 'package:bian_mobile_app/core/general/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'custom_appbar.dart';



class MainScaffoldWidget extends StatelessWidget {
  const MainScaffoldWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "BIAN",
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding:  AppDimensions.defaultMargin,
        child: child),
    );
  }
}
