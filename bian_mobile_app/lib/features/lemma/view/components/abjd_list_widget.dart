import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/app/widgets/abjd_list_core_widget.dart';
import '../../../../common/widgets/main_data_states_widget.dart';
import '../../../../core/general/models/abjd.dart';
import '../../controller/abjd_list_controller.dart';

final _abjItemProvider =
    Provider.autoDispose<AbjdModel>((ref) => throw UnimplementedError());

class AbjdListWidget extends ConsumerWidget {
  const AbjdListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abjdProvider = ref.watch(abjdListControllerProvider);
    final selectedAbjd = ref.watch(selectedAbjdProvider);
    return MainDataStatesWidget(
        baseNotifier: abjdProvider,
        dataWidget: AbjdListCoreWidget(
          abjdList: abjdProvider.abjdList,
          currentCharacter: selectedAbjd ?? "",
          onItemTap: (abjdModel) {
            ref.read(selectedAbjdProvider.notifier).state = abjdModel.abjd;
          },
        ));
  }
}
