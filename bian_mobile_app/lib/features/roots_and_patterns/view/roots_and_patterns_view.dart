import 'package:bian_mobile_app/common/widgets/clickable.dart';

import '../../../common/app/widgets/scroll_icon_widget.dart';
import '../../../common/widgets/custom_icon.dart';
import '../../../core/general/asset_path/app_icons.dart';
import '../../../core/general/theme/theme.dart';
import '../controller/roots_and_patterns_controller.dart';
import '../../../common/app/widgets/description_text.dart';
import 'components/root_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/widgets/main_scaffold_widget.dart';
import 'components/abjd_list_widget.dart';
import 'components/word_info_list_widget.dart';

class RootsAndPatternsView extends ConsumerStatefulWidget {
  const RootsAndPatternsView({super.key});
  static const path = "/RootsAndPatternsView";
  static const routeName = "RootsAndPatternsView";

  @override
  ConsumerState<RootsAndPatternsView> createState() =>
      _RootsAndPatternsViewState();
}

class _RootsAndPatternsViewState extends ConsumerState<RootsAndPatternsView> {
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return MainScaffoldWidget(
      child: Stack(
        fit: StackFit.expand,
        children: [
          NotificationListener<ScrollNotification>(
            // key: ValueKey(widget.itemCount),
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels > 1.sh) {
                ref.read(shouldShowScrollIconProvider.notifier).state = true;
              } else {
                if (ref.read(shouldShowScrollIconProvider)) {
                  ref.read(shouldShowScrollIconProvider.notifier).state = false;
                }
              }

              return false;
            },

            child: SingleChildScrollView(
              controller: controller,
              child: Column(children: [
                40.verticalSpace,
                const DescriptionText(
                    description:
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."),
                20.verticalSpace,
                const AbjdListWidget(),
                20.verticalSpace,
                const RootListWidget(),
                20.verticalSpace,
                WordInfoListWidget(controller),
                20.verticalSpace,
              ]),
            ),
          ),
          ScrollIconWidget(controller: controller)
        ],
      ),
    );
  }
}
