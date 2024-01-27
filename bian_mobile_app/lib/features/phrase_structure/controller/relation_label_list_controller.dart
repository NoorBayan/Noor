import '../models/relation_label_model.dart';
import '../repository/relation_label_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general/helpers/base_change_notifier.dart';

final selectedRelationLabelProvider = StateProvider<RelationLabelModel?>((ref) {
  return;
});

final relationLabelListControllerProvider =
    ChangeNotifierProvider.autoDispose((ref) {
  return RelationLabelListController(ref);
});

class RelationLabelListController extends BaseChangeNotifier {
  List<RelationLabelModel> relationLabelList = [];
  late RelationLabelRepo relationLabelRepo;
  final Ref ref;
  RelationLabelListController(this.ref) {
    relationLabelRepo = RelationLabelRepo();
    _init();
  }
  _init() async {
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData() async {
    final result = await relationLabelRepo.getList();
    relationLabelList = List<RelationLabelModel>.from(result);
    if (relationLabelList.isNotEmpty) {
      ref.read(selectedRelationLabelProvider.notifier).state =
          relationLabelList.first;
    }
  }
}
