import 'package:bian_mobile_app/common/app/widgets/scroll_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app/widgets/description_text.dart';
import '../../../common/widgets/main_scaffold_widget.dart';
import '../../../core/general/theme/theme.dart';
import 'components/phrase_list_widget.dart';
import 'components/relation_widget.dart';

class PhaseStructureView extends ConsumerStatefulWidget {
  const PhaseStructureView({super.key});
  static const path = "/PhaseStructureView";
  static const routeName = "/PhaseStructureView";
  @override
  ConsumerState<PhaseStructureView> createState() => _PhaseStructureViewState();
}

class _PhaseStructureViewState extends ConsumerState<PhaseStructureView> {
  late final ScrollController controller;
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
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  40.verticalSpace,
                  const DescriptionText(
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
                  22.verticalSpace,
                  const RelationWidget(),
                  20.verticalSpace,
                  PhraseListWidget(controller)
                ],
              ),
            ),
          ),
          ScrollIconWidget(controller: controller)
        ],
      ),
    );
  }
}

class _BuildRelation extends ConsumerWidget {
  const _BuildRelation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
