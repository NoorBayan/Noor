import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app/models/main_quran.dart';
import '../../../common/app/repository/quran_repo.dart';
import '../../../core/general/helpers/base_change_notifier.dart';

final selectedRootProvider = StateProvider<String?>((ref) {
  return;
});


final rootsAndPatternsProvider = ChangeNotifierProvider.autoDispose
    .family<RootsAndPatternsController, String?>((ref, root) {
  return RootsAndPatternsController(root);
});

class RootsAndPatternsController extends BaseChangeNotifier {
  List<MainQuran> wordsInfoList = [];
  late QuranRepo repo;
  final String? root;
  RootsAndPatternsController(this.root) {
    repo = QuranRepo();
    _init();
  }

  _init() async {
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData() async {
    if (root == null) {
      return;
    }
    final result = await repo.customQuery(root: root!);
    wordsInfoList = List<MainQuran>.from(result);
  }
}
