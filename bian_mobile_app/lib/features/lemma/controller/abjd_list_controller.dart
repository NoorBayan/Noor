import 'package:bian_mobile_app/core/general/models/abjd.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general/helpers/base_change_notifier.dart';
import '../repository/abjd_repo.dart';


final selectedAbjdProvider = StateProvider<String?>((ref) {
  return;
});

final abjdListControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return AbjdListController(ref);
});

class AbjdListController extends BaseChangeNotifier {
  List<AbjdModel> abjdList = [];
  late AbjdRepo abjdRepo;
  final Ref ref;
  AbjdListController(this.ref) {
    abjdRepo = AbjdRepo();
    _init();
  }
  _init() async {
    isLoading = true;
    await getData();
    isLoading = false;
  }

  Future getData() async {
    final result = await abjdRepo.getList();
    abjdList = List<AbjdModel>.from(result);
    if (abjdList.isNotEmpty) {
      ref.read(selectedAbjdProvider.notifier).state = abjdList.first.abjd;
    }
  }
}
