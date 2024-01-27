import 'package:bian_mobile_app/common/widgets/clickable.dart';
import 'package:bian_mobile_app/common/widgets/default_card.dart';
import 'package:bian_mobile_app/common/widgets/main_data_states_widget.dart';
import 'package:bian_mobile_app/core/general/models/abjd.dart';
import 'package:bian_mobile_app/core/general/theme/app_colors.dart';
import 'package:bian_mobile_app/core/general/theme/text_field_style.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/controller/abjd_list_controller.dart';
import 'package:bian_mobile_app/common/app/widgets/abjd_item_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/app/widgets/abjd_list_core_widget.dart';

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
          currentCharacter: selectedAbjd ?? "",
          abjdList: abjdProvider.abjdList,
          onItemTap: (abjdModel) {
            ref.read(selectedAbjdProvider.notifier).state = abjdModel.abjd;
          },
        ));
  }
}

class _BuildItem extends ConsumerWidget {
  const _BuildItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(_abjItemProvider);
    final currentCharacter = ref.watch(selectedAbjdProvider);
    return AbjdItemWidget(
      abjdModel: character,
      isActive: currentCharacter == character.abjd,
    );
  }
}
