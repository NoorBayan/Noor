import 'package:bian_mobile_app/common/app/repository/trans_repo.dart';
import 'package:bian_mobile_app/core/general/models/trans_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/general/helpers/base_change_notifier.dart';

final translationControllerProvider = ChangeNotifierProvider.autoDispose
    .family<TranslationController, int>((ref, id) {
  return TranslationController(senId: id);
});

class TranslationController extends BaseChangeNotifier {
  final int senId;
  Map<String, String> languageToTranslationMapping = {};
  TransModel? transModel;
  late TransRepo repo;
  String? currentTranslation;
  String? selectedLanguage;

  TranslationController({required this.senId}) {
    repo = TransRepo();
    repo.model = TransModel(senId: senId, chapterId: 0, verseId: 0);
    getData();
  }

  void getData() async {
    isLoading = true;
    final result = await repo.customQuery(senId: senId);
    transModel = result.firstOrNull;
    updateTranslation();
    isLoading = false;
  }

  void updateTranslation() {
    if (transModel == null) {
      return;
    }
    currentTranslation = transModel!.enSahih;
    notifyListeners();
    final model = transModel!;
    languageToTranslationMapping = {
      "Amharic": model.amSadiq ?? "",
      "Arabic": model.arJalalayn ?? "",
      "Azerbaijani": model.azMammadaliyev ?? "",
      "Amazigh": model.berMensur ?? "",
      "Bulgarian": model.bgTheophanov ?? "",
      "Bengali": model.bnBengali ?? "",
      "Bosnian": model.bsKorkut ?? "",
      "Czech": model.csHrbek ?? "",
      "German": model.deAburida ?? "",
      "Divehi": model.dvDivehi ?? "",
      "English": model.enSahih ?? "",
      "Spanish": model.esBornez ?? "",
      "Persian": model.faAnsarian ?? "",
      "French": model.frHamidullah ?? "",
      "Hausa": model.haGumi ?? "",
      "Hindi": model.hiFarooq ?? "",
      "Indonesian": model.idIndonesian ?? "",
      "Italian": model.itPiccardo ?? "",
      "Japanese": model.jaJapanese ?? "",
      "Korean": model.koKorean ?? "",
      "Kurdish": model.kuAsan ?? "",
      "Malayalam": model.mlAbdulhameed ?? "",
      "Malay": model.msBasmeih ?? "",
      "Dutch": model.nlKeyzer ?? "",
      "Norwegian": model.noBerg ?? "",
      "Polish": model.plBielawskiego ?? "",
      "Pashto": model.psAbdulwali ?? "",
      "Portuguese": model.ptElhayek ?? "",
      "Romanian": model.roGrigore ?? "",
      "Russian": model.ruAbuadel ?? "",
      "Sindhi": model.sdAmroti ?? "",
      "Somali": model.soAbduh ?? "",
      "Albanian": model.sqAhmeti ?? "",
      "Swedish": model.svBernstrom ?? "",
      "Swahili": model.swBarwani ?? "",
      "Tamil": model.taTamil ?? "",
      "Tajik": model.tgAyati ?? "",
      "Thai": model.thThai ?? "",
      "Turkish": model.trAtes ?? "",
      "Tatar": model.ttNugman ?? "",
      "Uyghur": model.ugSaleh ?? "",
      "Urdu": model.urAhmedali ?? "",
      "Uzbek": model.uzSodik ?? "",
      "Chinese": model.zhMajian ?? "",
    };
  }

  String getTranslation() {
    return languageToTranslationMapping[selectedLanguage] ?? "";
  }

  void updateLanguage(String key) {
    selectedLanguage = key;
    currentTranslation = languageToTranslationMapping[key];
    notifyListeners();
  }
}
