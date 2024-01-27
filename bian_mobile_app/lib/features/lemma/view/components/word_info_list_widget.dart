import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/app/widgets/word_info_list_core_widget.dart';
import '../../../../common/widgets/main_data_states_widget.dart';
import '../../controller/lemmas_controller.dart';
import '../../controller/lemmas_list_controller.dart';
import '../../../../common/app/models/main_quran.dart';

final _WordItemProvider =
    Provider.autoDispose<MainQuran>((_) => throw UnimplementedError());

class WordInfoListWidget extends ConsumerWidget {
  const WordInfoListWidget(this.scrollController, {super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final root = ref.watch(selectedLemmaProvider);
    final controller = ref.watch(lemmasProvider(root));

    return MainDataStatesWidget(
        baseNotifier: controller,
        dataWidget: WordInfoListCoreWidget(
          baseList: controller,
          scrollController: scrollController,
        ));
  }
}
