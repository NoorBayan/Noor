import 'package:bian_mobile_app/core/general/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general/asset_path/app_icons.dart';
import '../../widgets/clickable.dart';
import '../../widgets/custom_icon.dart';

final shouldShowScrollIconProvider = StateProvider<bool>((ref) {
  return false;
});

class ScrollIconWidget extends ConsumerWidget {
  const ScrollIconWidget({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldShowIcon = ref.watch(shouldShowScrollIconProvider);
    if (shouldShowIcon) {
      return Positioned(
          right: 0,
          bottom: 77.h,
          child: Clickable(
            onTap: () => controller.animateTo(0,
                duration: Duration(
                  milliseconds: 300,
                ),
                curve: Curves.bounceIn),
            child: CustomIcon(
              iconPath: AppIcons.upArrowCircle,
              size: 34.r,
            ),
          ));
    } else {
      return const SizedBox.shrink();
    }
  }
}
