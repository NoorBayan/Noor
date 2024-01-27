import 'package:bian_mobile_app/common/widgets/main_data_states_widget.dart';
import 'package:bian_mobile_app/common/widgets/main_scaffold_widget.dart';
import 'package:bian_mobile_app/core/general/models/mappings.dart';
import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:bian_mobile_app/core/general/theme/theme.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/controller/translation_controller.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/view/components/two_side_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/example_card_widget.dart';
import 'components/three_rows_card_widget.dart';
import 'components/word_card_widget.dart';

class RootsAndPatternsDetailsView extends ConsumerWidget {
  const RootsAndPatternsDetailsView({super.key, required this.quranModel});
  static const String path = "/RootsAndPatternsDetailsView";
  static const String routeName = "RootsAndPatternsDetailsView";
  final QuranModel quranModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transController =
        ref.watch(translationControllerProvider(quranModel.senId));
    return MainScaffoldWidget(
        child: MainDataStatesWidget(
      baseNotifier: transController,
      dataWidget: ListView(
        children: [
          24.verticalSpace,
          WordCardWidget(
            title: quranModel.uthmani,
            subtitle1: quranModel.phone,
            subtitle2: quranModel.tran,
          ),
          20.verticalSpace,
          TwoSideCardWidget(
            title: "Root",
            subtitleAr: quranModel.root,
          ),
          20.verticalSpace,
          TwoSideCardWidget(
            title: "Lemma",
            subtitleAr: quranModel.lemma,
          ),
          20.verticalSpace,
          ExampleCardWidget(
            controller: transController,
          ),
          20.verticalSpace,
          ThreeRowsCardWidget(
            mainTitle: "Word Structure",
            word1: WordColumn(
                title: "Suffix",
                subtitle1: quranModel.suffix,
                subtitle2: pos_en[quranModel.suffixPos],
                subtitle3: pos_ar[quranModel.suffixPos]),
            word2: WordColumn(
                title: "Stem",
                subtitle1: quranModel.stem,
                subtitle2: pos_en[quranModel.stemPos],
                subtitle3: pos_ar[quranModel.stemPos]),
            word3: WordColumn(
                title: "Prefix",
                subtitle1: quranModel.prefixes,
                subtitle2: pos_en[quranModel.prefixPos],
                subtitle3: pos_en[quranModel.prefixPos]),
          ),
          20.verticalSpace,
          ThreeRowsCardWidget(
            mainTitle: "Verb Features",
            isTwoRowsOnly: true,
            word1: WordColumn(
                title: "Form",
                subtitle1: Verb_form_en[quranModel.verbForms],
                subtitle2: Verb_form_ar[quranModel.verbForms]),
            word2: WordColumn(
              title: "Time",
              subtitle1: verb_time_en[quranModel.verbTimes],
              subtitle2: verb_time_ar[quranModel.verbTimes],
            ),
            word3: WordColumn(
                title: "Moods",
                subtitle1: verb_mood_en[quranModel.verbMoods],
                subtitle2: verb_mood_ar[quranModel.verbMoods]),
            word4: WordColumn(
                title: "Voice",
                subtitle1: verb_voice_en[quranModel.verbVoices],
                subtitle2: verb_voice_ar[quranModel.verbVoices]),
          ),
          20.verticalSpace,
          ThreeRowsCardWidget(
            mainTitle: "Special Groups",
            isTwoRowsOnly: true,
            word1: WordColumn(
                subtitle1: special_group_en[quranModel.specialGroups],
                subtitle2: special_group_ar[quranModel.specialGroups]),
          ),
          20.verticalSpace,
          ThreeRowsCardWidget(
              mainTitle: "Special Features",
              isTwoRowsOnly: true,
              word1: WordColumn(
                  title: "Gender",
                  subtitle1: gender_en[quranModel.gender],
                  subtitle2: gender_ar[quranModel.gender]),
              word2: WordColumn(
                title: "Persons",
                subtitle1: person_en[quranModel.persons],
                subtitle2: person_ar[quranModel.persons],
              ),
              word3: WordColumn(
                  title: "Numbers",
                  subtitle1: number_en[quranModel.numbers],
                  subtitle2: number_ar[quranModel.numbers])),
          20.verticalSpace,
        ],
      ),
    ));
  }
}
