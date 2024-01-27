
import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app/repository/quran_repo.dart';
import '../../../core/general/helpers/base_list_change_notifier.dart';
import '../../../core/general/util/result_state.dart';

final lemmasProvider = ChangeNotifierProvider.autoDispose
    .family<LemmasController, String?>((ref, root) {
  return LemmasController(root);
});

class LemmasController extends BaseListChangeNotifier {
  late QuranRepo repo;
  final String? lemma;
  LemmasController(this.lemma) {
    repo = QuranRepo();
    repo.mainQuran = QuranModel(
      vid: 0,
      senId: 0,
      verseId: 0,
      chapterId: 0,
    );
    _init();
  }

  _init() async {
    isLoading = true;
    await getData();
    isLoading = false;
  }

    @override
  Future<ResultState<List<QuranModel>>> getDataResult(
      bool shouldIncreasePageNumber) async {
    if (shouldIncreasePageNumber) {
      paginationParamsModel.page++;
    }
    final result = await repo.customCursorQuery(
        lemma: lemma,
        limit: paginationParamsModel.limit,
        offset: paginationParamsModel.page > 1
            ? (paginationParamsModel.page - 1) * paginationParamsModel.limit
            : paginationParamsModel.offset);

    return ResultState.success(data: result);
  }

}
