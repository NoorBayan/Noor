import 'package:bian_mobile_app/features/lemma/view/lemmas_view.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/general/helpers/base_change_notifier.dart';
import '../../phrase_structure/views/phase_structure_view.dart';
import '../../roots_and_patterns/view/roots_and_patterns_view.dart';

final homeControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeController();
});

class HomeController extends BaseChangeNotifier {
  void onRootsAndPatternsTap(BuildContext context) {
    context.push(RootsAndPatternsView.path);
  }

  void onLemmasTap(BuildContext context) {
    context.push(LemmasView.path);
  }

  void onPhraseStructureTap(BuildContext context) {
    context.push(PhaseStructureView.path);
  }

  void onMorphLogicalTap(BuildContext context) {}
  void onInflectionAndConcatenationTap(BuildContext context) {}
}
