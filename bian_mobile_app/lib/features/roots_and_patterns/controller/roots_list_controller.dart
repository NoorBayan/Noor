import 'package:bian_mobile_app/features/roots_and_patterns/model/roots.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general/helpers/base_change_notifier.dart';
import '../repository/root_repo.dart';

final selectedRootProvider = StateProvider<String?>((ref) {
  return;
});

final rootListControllerProvider = ChangeNotifierProvider.autoDispose
    .family<RootListController, String?>((ref, model) {
  return RootListController(model, ref);
});

class RootListController extends BaseChangeNotifier {
  List<RootsModel> rootList = [];
  late RootRepo rootRepo;
  final String? abjd;
  final Ref ref;
  RootListController(this.abjd, this.ref) {
    rootRepo = RootRepo();
    _init();
  }
  _init() async {
    if (abjd == null) {
      return;
    }
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData() async {
    final result = await rootRepo.customQuery(abjd: abjd!);
    rootList = List<RootsModel>.from(result);
    if (rootList.isNotEmpty) {
      ref.read(selectedRootProvider.notifier).state = rootList.first.root;
    }
  }
}
