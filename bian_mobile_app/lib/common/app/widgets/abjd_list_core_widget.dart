import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general/models/abjd.dart';
import '../../widgets/clickable.dart';
import 'abjd_item_widget.dart';

final _abjItemProvider =
    Provider.autoDispose<AbjdModel>((ref) => throw UnimplementedError());

class AbjdListCoreWidget extends StatelessWidget {
  const AbjdListCoreWidget(
      {super.key,
      required this.abjdList,
      required this.onItemTap,
      required this.currentCharacter});
  final List<AbjdModel> abjdList;
  final String currentCharacter;
  final Function(AbjdModel) onItemTap;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 15.h,
        spacing: 10.w,
        children: abjdList
            .map((e) => Clickable(
                  onTap: () {
                    onItemTap.call(e);
                  },
                  child: ProviderScope(overrides: [
                    _abjItemProvider.overrideWithValue(e),
                  ], child: _BuildItem(currentCharacter == e.abjd)),
                ))
            .toList(),
      ),
    );
  }
}

class _BuildItem extends ConsumerWidget {
  const _BuildItem(this.isActive, {super.key});
  final bool isActive;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.read(_abjItemProvider);
    return AbjdItemWidget(
      abjdModel: character,
      isActive: isActive,
    );
  }
}
