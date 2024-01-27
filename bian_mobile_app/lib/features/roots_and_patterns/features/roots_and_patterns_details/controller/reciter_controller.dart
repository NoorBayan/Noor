import 'package:bian_mobile_app/core/general/helpers/base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final reciterControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return ReciterController();
});

class ReciterController extends BaseChangeNotifier {
  Map<String, String> reciterToAudioFile = {};
  String currentReciter = "Abdul Basit Abdul Samad";
  ReciterController() {
    updateRecitersMap();
  }

  void updateReciter(String reciter) {
    currentReciter = reciter;
    notifyListeners();
  }

  String get getAudioFile => reciterToAudioFile[currentReciter] ?? "https://everyayah.com/data/AbdulSamad_64kbps_QuranExplorer.Com/";
  void updateRecitersMap() {
    reciterToAudioFile = {
      "Abdul Basit Abdul Samad":
          "https://everyayah.com/data/AbdulSamad_64kbps_QuranExplorer.Com/",
      "Abdul Basit Mujawwad":
          "https://everyayah.com/data/Abdul_Basit_Mujawwad_128kbps/",
      "Abdurrahmaan As-Sudais":
          "https://everyayah.com/data/Abdurrahmaan_As-Sudais_64kbps/",
      "Abu Bakr Ash-Shaatree":
          "https://everyayah.com/data/Abu_Bakr_Ash-Shaatree_128kbps/",
      "Abu Bakr_Ash-Shaatree":
          "https://everyayah.com/data/Abu_Bakr_Ash-Shaatree_64kbps/",
      "Ahmed Neana": "https://everyayah.com/data/Ahmed_Neana_128kbps/",
      "Ahmed Ibn Ali Al-Ajamy":
          "https://everyayah.com/data/Ahmed_ibn_Ali_al-Ajamy_128kbps_ketaballah.net/",
      "Akram AlAlaqimy": "https://everyayah.com/data/Akram_AlAlaqimy_128kbps/",
      "Alafasy": "https://everyayah.com/data/Alafasy_128kbps/",
      "Ali Hajjaj AlSuesy":
          "https://everyayah.com/data/Ali_Hajjaj_AlSuesy_128kbps/",
      "Abdul Basit Murattal":
          "https://everyayah.com/data/Abdul_Basit_Murattal_192kbps/",
      "Ali Jaber": "https://everyayah.com/data/Ali_Jaber_64kbps/",
      "Ayman Sowaid": "https://everyayah.com/data/Ayman_Sowaid_64kbps/",
      "Sahih Ibrahim":
          "https://everyayah.com/data/English/Sahih_Intnl_Ibrahim_Walk_192kbps/",
      "Fares Abbad": "https://everyayah.com/data/Fares_Abbad_64kbps/",
      "Ghamadi": "https://everyayah.com/data/Ghamadi_40kbps/",
      "Hani Rifai": "https://everyayah.com/data/Hani_Rifai_192kbps/",
      "Hudhaify": "https://everyayah.com/data/Hudhaify_128kbps/",
      "Al Husary": "https://everyayah.com/data/Husary_128kbps/",
      "Al Husary - Mujawwad":
          "https://everyayah.com/data/Husary_128kbps_Mujawwad/",
      "Al Husary - Muallim":
          "https://everyayah.com/data/Husary_Muallim_128kbps/",
      "Ibrahim Akhdar": "https://everyayah.com/data/Ibrahim_Akhdar_32kbps/",
      "Karim Mansoori": "https://everyayah.com/data/Karim_Mansoori_40kbps/",
      "Khaalid Abdullaah Al-Qahtaanee":
          "https://everyayah.com/data/Khaalid_Abdullaah_al-Qahtaanee_192kbps/",
      "Maher AlMuaiqly": "https://everyayah.com/data/MaherAlMuaiqly128kbps/",
      "Abdullaah Awaad Al-Juhaynee":
          "https://everyayah.com/data/Abdullaah_3awwaad_Al-Juhaynee_128kbps/",
      "Al Menshawi": "https://everyayah.com/data/Menshawi_16kbps/",
      "Al Minshawy - Mujawwad":
          "https://everyayah.com/data/Minshawy_Mujawwad_192kbps/",
      "Al Minshawy - Murattal":
          "https://everyayah.com/data/Minshawy_Murattal_128kbps/",
      "Mohammad Al Tablaway":
          "https://everyayah.com/data/Mohammad_al_Tablaway_128kbps/",
      "Muhammad AbdulKareem":
          "https://everyayah.com/data/Muhammad_AbdulKareem_128kbps/",
      "Muhammad Ayyoub": "https://everyayah.com/data/Muhammad_Ayyoub_128kbps/",
      "Abdullah Basfar": "https://everyayah.com/data/Abdullah_Basfar_192kbps/",
      "Muhammad Jibreel":
          "https://everyayah.com/data/Muhammad_Jibreel_128kbps/",
      "Muhsin Al Qasim": "https://everyayah.com/data/Muhsin_Al_Qasim_192kbps/",
      "Basfar - MultiLanguage":
          "https://everyayah.com/data/MultiLanguage/Basfar_Walk_192kbps/",
      "Mustafa Ismail": "https://everyayah.com/data/Mustafa_Ismail_48kbps/",
      "Nabil Rifa3i": "https://everyayah.com/data/Nabil_Rifa3i_48kbps/",
      "Nasser Alqatami": "https://everyayah.com/data/Nasser_Alqatami_128kbps/",
      "Parhizgar": "https://everyayah.com/data/Parhizgar_48kbps/",
      "Sahl Yassin": "https://everyayah.com/data/Sahl_Yassin_128kbps/",
      "Salaah AbdulRahman Bukhatir":
          "https://everyayah.com/data/Salaah_AbdulRahman_Bukhatir_128kbps/",
      "Salah Al Budair": "https://everyayah.com/data/Salah_Al_Budair_128kbps/",
      "Saood Ash-Shuraym": "https://everyayah.com/data/Shuraym_128kbps/",
      "Yaser Salamah": "https://everyayah.com/data/Yaser_Salamah_128kbps/",
      "Yasser Ad-Dussary": "https://everyayah.com/data/Dussary_128kbps/",
      "Aziz Alili": "https://everyayah.com/data/aziz_alili_128kbps/",
      "Khalefa Al Tunaiji":
          "https://everyayah.com/data/khalefa_al_tunaiji_64kbps/",
      "Mahmoud Ali Al Banna":
          "https://everyayah.com/data/mahmoud_ali_al_banna_32kbps/",
      "Hedayatfar - with translations by Fooladvand":
          "https://everyayah.com/data/translations/Fooladvand_Hedayatfar_40Kbps/",
      "Makarem Kabiri - with translations":
          "https://everyayah.com/data/translations/Makarem_Kabiri_16Kbps/",
      "Balayev - with azerbaijani translations":
          "https://everyayah.com/data/translations/azerbaijani/balayev/",
      "Besim Korkut - with translations":
          "https://everyayah.com/data/translations/besim_korkut_ajet_po_ajet/",
      "Farhat Hashmi - with Urdu translations":
          "https://everyayah.com/data/translations/urdu_farhat_hashmi/",
      "Shamshad Ali Khan - with Urdu translations":
          "https://everyayah.com/data/translations/urdu_shamshad_ali_khan_46kbps/",
      "Abdul Basit - warsh":
          "https://everyayah.com/data/warsh/warsh_Abdul_Basit_128kbps/",
      "Ibrahim Al Dosary - warsh":
          "https://everyayah.com/data/warsh/warsh_ibrahim_aldosary_128kbps/",
      "Yassin Al Jazaery - warsh":
          "https://everyayah.com/data/warsh/warsh_yassin_al_jazaery_64kbps/",
      "Abdullah Matroud": "https://everyayah.com/data/Abdullah_Matroud_128kbps/"
    };
  }
}
