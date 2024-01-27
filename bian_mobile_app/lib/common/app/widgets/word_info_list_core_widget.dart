import 'package:bian_mobile_app/common/app/widgets/word_info_item.dart';
import 'package:bian_mobile_app/common/widgets/improved_custom_list_pagination_widget.dart';
import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/clickable.dart';
import '../../../../core/general/theme/theme.dart';
import '../../../core/general/helpers/base_list_change_notifier.dart';
import '../../../features/roots_and_patterns/features/roots_and_patterns_details/view/roots_and_patterns_details_view.dart';
import '../models/main_quran.dart';

final _WordItemProvider =
    Provider.autoDispose<QuranModel>((_) => throw UnimplementedError());

class WordInfoListCoreWidget<MainQuran> extends StatelessWidget {
  const WordInfoListCoreWidget({
    super.key,
    required this.baseList,
    required this.scrollController,
  });
  final ScrollController scrollController;
  final BaseListChangeNotifier<dynamic> baseList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3).w,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ImprovedCustomListPaginationWidget.gridView(
          baseList: baseList,
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 20.h,
            childAspectRatio: 170 / 180,
            mainAxisExtent: 170,
          ),
          // primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // itemCount: wordList.length,
          itemBuilder: (context, index) {
            final item = baseList.list[index];
            return Clickable(
              onTap: () {},
              child: ProviderScope(
                  overrides: [_WordItemProvider.overrideWithValue(item)],
                  child: const _BuildWordInfoItem()),
            );
          },
        ),
      ),
    );
  }
}

class _BuildWordInfoItem extends ConsumerWidget {
  const _BuildWordInfoItem();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(_WordItemProvider);
    return Clickable(
      onTap: ()=> context.push(RootsAndPatternsDetailsView.path, extra: data),
      child: WordInfoItem(
        title: data.uthmani,
        subtitle1: data.phone,
        subtitle2: data.tran,
      ),
    );
  }
}
