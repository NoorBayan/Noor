import 'package:bian_mobile_app/features/lemma/model/lemmas.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/model/roots.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general/helpers/base_change_notifier.dart';
import '../repository/lemma_repo.dart';

final selectedLemmaProvider = StateProvider<String?>((ref) {
  return;
});

final lemmaListControllerProvider = ChangeNotifierProvider.autoDispose
    .family<LemmaListController, String?>((ref, model) {
  return LemmaListController(model, ref);
});

class LemmaListController extends BaseChangeNotifier {
  List<LemmasModel> lemmaList = [];
  late LemmaRepo lemmaRepo;
  final String? abjd;
  final Ref ref;
  LemmaListController(this.abjd, this.ref) {
    lemmaRepo = LemmaRepo();
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
    final result = await lemmaRepo.customQuery(abjd: abjd!);
    lemmaList = List<LemmasModel>.from(result);
    if (lemmaList.isNotEmpty) {
      ref.read(selectedLemmaProvider.notifier).state = lemmaList.first.lemma;
    }
  }
}
