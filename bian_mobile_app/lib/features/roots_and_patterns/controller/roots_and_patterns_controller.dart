import 'package:bian_mobile_app/core/general/util/result_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app/models/main_quran.dart';
import '../../../common/app/repository/quran_repo.dart';
import '../../../core/general/helpers/base_change_notifier.dart';
import '../../../core/general/helpers/base_list_change_notifier.dart';
import '../../../core/general/models/quran.dart';

final rootsAndPatternsProvider = ChangeNotifierProvider.autoDispose
    .family<RootsAndPatternsController, String?>((ref, root) {
  return RootsAndPatternsController(root);
});


class RootsAndPatternsController extends BaseListChangeNotifier<QuranModel> {

  late QuranRepo repo;
  final String? root;
  RootsAndPatternsController(this.root) {
    repo = QuranRepo();
    repo.mainQuran = QuranModel(vid: 0, senId: 0, chapterId: 0, verseId: 0);
    _init();
  }

  _init() async {
    isLoading = true;
    await getData();
    isLoading = false;
  }

  // Future getData() async {
  //   if (root == null) {
  //     return;
  //   }
  //   final result = await repo.customQuery(root: root!);
  //   wordsInfoList = List<MainQuran>.from(result);
  // }

  @override
  Future<ResultState<List <QuranModel>>> getDataResult(bool shouldIncreasePageNumber) async {
    if (shouldIncreasePageNumber) {
      paginationParamsModel.page++;
    }
    final result = await repo.customCursorQuery(
      root: root,
        limit: paginationParamsModel.limit,
        offset: paginationParamsModel.page > 1
            ? (paginationParamsModel.page - 1) * paginationParamsModel.limit
            : paginationParamsModel.offset);

    return ResultState.success(data: result);
  }
}
