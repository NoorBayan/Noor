import 'package:bian_mobile_app/common/widgets/clickable.dart';
import 'package:bian_mobile_app/common/widgets/improved_custom_list_pagination_widget.dart';
import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:bian_mobile_app/features/phrase_structure/controller/phrase_structure_controller.dart';
import 'package:bian_mobile_app/features/phrase_structure/controller/relation_label_list_controller.dart';
import 'package:bian_mobile_app/features/phrase_structure/views/components/phrase_item_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/main_data_states_widget.dart';
import '../../../roots_and_patterns/features/roots_and_patterns_details/view/roots_and_patterns_details_view.dart';
import '../../models/phrase_structure_model.dart';

final _itemProvider =
    Provider<QuranModel>((_) => throw UnimplementedError());

class PhraseListWidget extends ConsumerWidget {
  const PhraseListWidget(this.scrollController, {super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(phraseStructureControllerProvider);
    final selectedRelation = ref.watch(selectedRelationLabelProvider);
    return MainDataStatesWidget(
        baseNotifier: controller,
        dataWidget: ImprovedCustomListPaginationWidget(
          baseList: controller,
          controller: scrollController,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProviderScope(overrides: [
              _itemProvider.overrideWithValue(controller.list[index].copyWith(
                relLabelStem: selectedRelation?.relLabelStem,
              ))
            ], child: const _BuildItem());
          },
        ));
  }
}

class _BuildItem extends ConsumerWidget {
  const _BuildItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.read(_itemProvider);
    return Clickable(
      onTap: () =>
            context.push(RootsAndPatternsDetailsView.path, extra: item),
      child: PhraseItemWidget(phraseModel: item));
  }
}
