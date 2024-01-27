import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/app/models/main_quran.dart';
import '../../../../common/app/widgets/word_info_list_core_widget.dart';
import '../../../../common/widgets/main_data_states_widget.dart';
import '../../controller/roots_and_patterns_controller.dart';
import '../../controller/roots_list_controller.dart';

final _WordItemProvider =
    Provider.autoDispose<MainQuran>((_) => throw UnimplementedError());

class WordInfoListWidget extends ConsumerWidget {
  const WordInfoListWidget(this.scrollController, {super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final root = ref.watch(selectedRootProvider);
    final controller = ref.watch(rootsAndPatternsProvider(root));

    return MainDataStatesWidget(
        baseNotifier: controller,
        dataWidget: WordInfoListCoreWidget(
          baseList: controller,
          scrollController: scrollController,
        ));
  }
}
