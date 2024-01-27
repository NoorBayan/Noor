import 'package:bian_mobile_app/common/app/repository/quran_repo.dart';
import 'package:bian_mobile_app/features/phrase_structure/controller/relation_label_list_controller.dart';
import 'package:bian_mobile_app/features/phrase_structure/models/phrase_structure_repo.dart';
import 'package:bian_mobile_app/features/phrase_structure/models/relation_label_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app/models/main_quran.dart';
import '../../../core/general/helpers/base_change_notifier.dart';
import '../../../core/general/helpers/base_list_change_notifier.dart';
import '../../../core/general/models/quran.dart';
import '../../../core/general/util/result_state.dart';
import '../models/phrase_structure_model.dart';

final phraseStructureControllerProvider =
    ChangeNotifierProvider.autoDispose((ref) {
  return PhraseStructureController(ref.watch(selectedRelationLabelProvider));
});

class PhraseStructureController extends BaseListChangeNotifier<QuranModel> {
  late QuranRepo repo;
  final RelationLabelModel? relationModel;
  QuranModel? phraseModel;
  PhraseStructureController(this.relationModel) {
    repo = QuranRepo();
    repo.mainQuran = QuranModel(vid: 0, senId: 1, chapterId: 1, verseId: 1);
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
    final result = await repo.getPhraseFromRelationLabel(
        relationLabel: relationModel?.relLabelStem ?? "",
        limit: paginationParamsModel.limit,
        offset: paginationParamsModel.page > 1
            ? (paginationParamsModel.page - 1) * paginationParamsModel.limit
            : paginationParamsModel.offset);
    return ResultState.success(data: result);
  }
}
