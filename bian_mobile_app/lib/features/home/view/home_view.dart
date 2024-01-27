import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/custom_icon.dart';
import '../../../common/widgets/main_scaffold_widget.dart';
import '../../../core/general/asset_path/app_icons.dart';
import '../../../core/general/theme/theme.dart';
import '../controllers/home_controller.dart';
import 'components/main_button_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const path = "/HomeView";
  static const routeName = "HomeView";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider);
    return MainScaffoldWidget(
      child: ListView(
        children: [
          54.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.7).w,
            child: CustomIcon(
              iconPath: AppIcons.mainHomeLogo,
              width: 304.58.r,
              height: 281.71.r,
            ),
          ),
          33.3.verticalSpace,
          MainButtonWidget(
              onTap: () => controller.onRootsAndPatternsTap(context),
              label: "Roots and Patterns"),
          20.verticalSpace,
          MainButtonWidget(
              onTap: () => controller.onLemmasTap(context), label: "Lemmas"),
          20.verticalSpace,
          MainButtonWidget(
              onTap: () => controller.onPhraseStructureTap(context),
              label: "Phrase Structure"),
          20.verticalSpace,
          MainButtonWidget(
              onTap: (){},
              label: "Morphological Features"),
          20.verticalSpace,
          MainButtonWidget(
              onTap: () {},
              label: "Inflection and Concatenation"),
          20.verticalSpace,
        ],
      ),
    );
  }
}
