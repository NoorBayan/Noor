import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/general/helpers/base_change_notifier.dart';

final rootsAndPatternsDetailsControllerProvider = ChangeNotifierProvider
    .autoDispose
    .family<RootsAndPatternsDetailsController, QuranModel>((ref, quranModel) {
  return RootsAndPatternsDetailsController(quranModel: quranModel);
});

class RootsAndPatternsDetailsController extends BaseChangeNotifier {
  final QuranModel quranModel;

  RootsAndPatternsDetailsController({required this.quranModel});
}
