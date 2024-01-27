import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'dao_abstract.dart';

abstract class TransTableColumns {
  static const tableName = "trans";
  static const senId = "sen_id";
  static const chapterId = "chapter_id";
  static const verseId = "verse_id";
  static const ayah = "ayah";
  static const amSadiq = "am_sadiq";
  static const arJalalayn = "ar_jalalayn";
  static const arMuyassar = "ar_muyassar";
  static const azMammadaliyev = "az_mammadaliyev";
  static const berMensur = "ber_mensur";
  static const bgTheophanov = "bg_theophanov";
  static const bnBengali = "bn_bengali";
  static const bsKorkut = "bs_korkut";
  static const csHrbek = "cs_hrbek";
  static const deAburida = "de_aburida";
  static const dvDivehi = "dv_divehi";
  static const enSahih = "en_sahih";
  static const enTransliteration = "en_transliteration";
  static const esBornez = "es_bornez";
  static const faAnsarian = "fa_ansarian";
  static const frHamidullah = "fr_hamidullah";
  static const haGumi = "ha_gumi";
  static const hiFarooq = "hi_farooq";
  static const idIndonesian = "id_indonesian";
  static const itPiccardo = "it_piccardo";
  static const jaJapanese = "ja_japanese";
  static const koKorean = "ko_korean";
  static const kuAsan = "ku_asan";
  static const mlAbdulhameed = "ml_abdulhameed";
  static const msBasmeih = "ms_basmeih";
  static const nlKeyzer = "nl_keyzer";
  static const noBerg = "no_berg";
  static const plBielawskiego = "pl_bielawskiego";
  static const psAbdulwali = "ps_abdulwali";
  static const ptElhayek = "pt_elhayek";
  static const roGrigore = "ro_grigore";
  static const ruAbuadel = "ru_abuadel";
  static const ruKrachkovsky = "ru_krachkovsky";
  static const sdAmroti = "sd_amroti";
  static const soAbduh = "so_abduh";
  static const sqAhmeti = "sq_ahmeti";
  static const svBernstrom = "sv_bernstrom";
  static const swBarwani = "sw_barwani";
  static const taTamil = "ta_tamil";
  static const tgAyati = "tg_ayati";
  static const thThai = "th_thai";
  static const trAtes = "tr_ates";
  static const trTransliteration = "tr_transliteration";
  static const ttNugman = "tt_nugman";
  static const ugSaleh = "ug_saleh";
  static const urAhmedali = "ur_ahmedali";
  static const uzSodik = "uz_sodik";
  static const zhMajian = "zh_majian";
}

class TransModel extends Equatable implements Dao<TransModel> {
  final int senId;
  final int chapterId;
  final int verseId;
  final String? ayah;
  final String? amSadiq;
  final String? arJalalayn;
  final String? arMuyassar;
  final String? azMammadaliyev;
  final String? berMensur;
  final String? bgTheophanov;
  final String? bnBengali;
  final String? bsKorkut;
  final String? csHrbek;
  final String? deAburida;
  final String? dvDivehi;
  final String? enSahih;
  final String? enTransliteration;
  final String? esBornez;
  final String? faAnsarian;
  final String? frHamidullah;
  final String? haGumi;
  final String? hiFarooq;
  final String? idIndonesian;
  final String? itPiccardo;
  final String? jaJapanese;
  final String? koKorean;
  final String? kuAsan;
  final String? mlAbdulhameed;
  final String? msBasmeih;
  final String? nlKeyzer;
  final String? noBerg;
  final String? plBielawskiego;
  final String? psAbdulwali;
  final String? ptElhayek;
  final String? roGrigore;
  final String? ruAbuadel;
  final String? ruKrachkovsky;
  final String? sdAmroti;
  final String? soAbduh;
  final String? sqAhmeti;
  final String? svBernstrom;
  final String? swBarwani;
  final String? taTamil;
  final String? tgAyati;
  final String? thThai;
  final String? trAtes;
  final String? trTransliteration;
  final String? ttNugman;
  final String? ugSaleh;
  final String? urAhmedali;
  final String? uzSodik;
  final String? zhMajian;
  TransModel({
    required this.senId,
    required this.chapterId,
    required this.verseId,
    this.ayah,
    this.amSadiq,
    this.arJalalayn,
    this.arMuyassar,
    this.azMammadaliyev,
    this.berMensur,
    this.bgTheophanov,
    this.bnBengali,
    this.bsKorkut,
    this.csHrbek,
    this.deAburida,
    this.dvDivehi,
    this.enSahih,
    this.enTransliteration,
    this.esBornez,
    this.faAnsarian,
    this.frHamidullah,
    this.haGumi,
    this.hiFarooq,
    this.idIndonesian,
    this.itPiccardo,
    this.jaJapanese,
    this.koKorean,
    this.kuAsan,
    this.mlAbdulhameed,
    this.msBasmeih,
    this.nlKeyzer,
    this.noBerg,
    this.plBielawskiego,
    this.psAbdulwali,
    this.ptElhayek,
    this.roGrigore,
    this.ruAbuadel,
    this.ruKrachkovsky,
    this.sdAmroti,
    this.soAbduh,
    this.sqAhmeti,
    this.svBernstrom,
    this.swBarwani,
    this.taTamil,
    this.tgAyati,
    this.thThai,
    this.trAtes,
    this.trTransliteration,
    this.ttNugman,
    this.ugSaleh,
    this.urAhmedali,
    this.uzSodik,
    this.zhMajian,
  });

  TransModel copyWith({
    int? senId,
    int? chapterId,
    int? verseId,
    String? ayah,
    String? amSadiq,
    String? arJalalayn,
    String? arMuyassar,
    String? azMammadaliyev,
    String? berMensur,
    String? bgTheophanov,
    String? bnBengali,
    String? bsKorkut,
    String? csHrbek,
    String? deAburida,
    String? dvDivehi,
    String? enSahih,
    String? enTransliteration,
    String? esBornez,
    String? faAnsarian,
    String? frHamidullah,
    String? haGumi,
    String? hiFarooq,
    String? idIndonesian,
    String? itPiccardo,
    String? jaJapanese,
    String? koKorean,
    String? kuAsan,
    String? mlAbdulhameed,
    String? msBasmeih,
    String? nlKeyzer,
    String? noBerg,
    String? plBielawskiego,
    String? psAbdulwali,
    String? ptElhayek,
    String? roGrigore,
    String? ruAbuadel,
    String? ruKrachkovsky,
    String? sdAmroti,
    String? soAbduh,
    String? sqAhmeti,
    String? svBernstrom,
    String? swBarwani,
    String? taTamil,
    String? tgAyati,
    String? thThai,
    String? trAtes,
    String? trTransliteration,
    String? ttNugman,
    String? ugSaleh,
    String? urAhmedali,
    String? uzSodik,
    String? zhMajian,
  }) {
    return TransModel(
      senId: senId ?? this.senId,
      chapterId: chapterId ?? this.chapterId,
      verseId: verseId ?? this.verseId,
      ayah: ayah ?? this.ayah,
      amSadiq: amSadiq ?? this.amSadiq,
      arJalalayn: arJalalayn ?? this.arJalalayn,
      arMuyassar: arMuyassar ?? this.arMuyassar,
      azMammadaliyev: azMammadaliyev ?? this.azMammadaliyev,
      berMensur: berMensur ?? this.berMensur,
      bgTheophanov: bgTheophanov ?? this.bgTheophanov,
      bnBengali: bnBengali ?? this.bnBengali,
      bsKorkut: bsKorkut ?? this.bsKorkut,
      csHrbek: csHrbek ?? this.csHrbek,
      deAburida: deAburida ?? this.deAburida,
      dvDivehi: dvDivehi ?? this.dvDivehi,
      enSahih: enSahih ?? this.enSahih,
      enTransliteration: enTransliteration ?? this.enTransliteration,
      esBornez: esBornez ?? this.esBornez,
      faAnsarian: faAnsarian ?? this.faAnsarian,
      frHamidullah: frHamidullah ?? this.frHamidullah,
      haGumi: haGumi ?? this.haGumi,
      hiFarooq: hiFarooq ?? this.hiFarooq,
      idIndonesian: idIndonesian ?? this.idIndonesian,
      itPiccardo: itPiccardo ?? this.itPiccardo,
      jaJapanese: jaJapanese ?? this.jaJapanese,
      koKorean: koKorean ?? this.koKorean,
      kuAsan: kuAsan ?? this.kuAsan,
      mlAbdulhameed: mlAbdulhameed ?? this.mlAbdulhameed,
      msBasmeih: msBasmeih ?? this.msBasmeih,
      nlKeyzer: nlKeyzer ?? this.nlKeyzer,
      noBerg: noBerg ?? this.noBerg,
      plBielawskiego: plBielawskiego ?? this.plBielawskiego,
      psAbdulwali: psAbdulwali ?? this.psAbdulwali,
      ptElhayek: ptElhayek ?? this.ptElhayek,
      roGrigore: roGrigore ?? this.roGrigore,
      ruAbuadel: ruAbuadel ?? this.ruAbuadel,
      ruKrachkovsky: ruKrachkovsky ?? this.ruKrachkovsky,
      sdAmroti: sdAmroti ?? this.sdAmroti,
      soAbduh: soAbduh ?? this.soAbduh,
      sqAhmeti: sqAhmeti ?? this.sqAhmeti,
      svBernstrom: svBernstrom ?? this.svBernstrom,
      swBarwani: swBarwani ?? this.swBarwani,
      taTamil: taTamil ?? this.taTamil,
      tgAyati: tgAyati ?? this.tgAyati,
      thThai: thThai ?? this.thThai,
      trAtes: trAtes ?? this.trAtes,
      trTransliteration: trTransliteration ?? this.trTransliteration,
      ttNugman: ttNugman ?? this.ttNugman,
      ugSaleh: ugSaleh ?? this.ugSaleh,
      urAhmedali: urAhmedali ?? this.urAhmedali,
      uzSodik: uzSodik ?? this.uzSodik,
      zhMajian: zhMajian ?? this.zhMajian,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sen_id': senId,
      'chapter_id': chapterId,
      'verse_id': verseId,
      'ayah': ayah,
      'am_sadiq': amSadiq,
      'ar_jalalayn': arJalalayn,
      'ar_muyassar': arMuyassar,
      'az_mammadaliyev': azMammadaliyev,
      'ber_mensur': berMensur,
      'bg_theophanov': bgTheophanov,
      'bn_bengali': bnBengali,
      'bs_korkut': bsKorkut,
      'cs_hrbek': csHrbek,
      'de_aburida': deAburida,
      'dv_divehi': dvDivehi,
      'en_sahih': enSahih,
      'en_transliteration': enTransliteration,
      'es_bornez': esBornez,
      'fa_ansarian': faAnsarian,
      'fr_hamidullah': frHamidullah,
      'ha_gumi': haGumi,
      'hi_farooq': hiFarooq,
      'id_indonesian': idIndonesian,
      'it_piccardo': itPiccardo,
      'ja_japanese': jaJapanese,
      'ko_korean': koKorean,
      'ku_asan': kuAsan,
      'ml_abdulhameed': mlAbdulhameed,
      'ms_basmeih': msBasmeih,
      'nl_keyzer': nlKeyzer,
      'no_berg': noBerg,
      'pl_bielawskiego': plBielawskiego,
      'ps_abdulwali': psAbdulwali,
      'pt_elhayek': ptElhayek,
      'ro_grigore': roGrigore,
      'ru_abuadel': ruAbuadel,
      'ru_krachkovsky': ruKrachkovsky,
      'sd_amroti': sdAmroti,
      'so_abduh': soAbduh,
      'sq_ahmeti': sqAhmeti,
      'sv_bernstrom': svBernstrom,
      'sw_barwani': swBarwani,
      'ta_tamil': taTamil,
      'tg_ayati': tgAyati,
      'th_thai': thThai,
      'tr_ates': trAtes,
      'tr_transliteration': trTransliteration,
      'tt_nugman': ttNugman,
      'ug_saleh': ugSaleh,
      'ur_ahmedali': urAhmedali,
      'uz_sodik': uzSodik,
      'zh_majian': zhMajian,
    };
  }

  factory TransModel.fromMap(Map<String, dynamic> map) {
    return TransModel(
      verseId: int.parse(map['verse_id'] ?? "0"),
      chapterId: int.parse(map['chapter_id'] ?? "0"),
      senId: int.parse(map['sen_id'] ?? "0"),
      ayah: map['ayah'],
      amSadiq: map['am_sadiq'],
      arJalalayn: map['ar_jalalayn'],
      arMuyassar: map['ar_muyassar'],
      azMammadaliyev: map['az_mammadaliyev'],
      berMensur: map['ber_mensur'],
      bgTheophanov: map['bg_theophanov'],
      bnBengali: map['bn_bengali'],
      bsKorkut: map['bs_korkut'],
      csHrbek: map['cs_hrbek'],
      deAburida: map['de_aburida'],
      dvDivehi: map['dv_divehi'],
      enSahih: map['en_sahih'],
      enTransliteration: map['en_transliteration'],
      esBornez: map['es_bornez'],
      faAnsarian: map['fa_ansarian'],
      frHamidullah: map['fr_hamidullah'],
      haGumi: map['ha_gumi'],
      hiFarooq: map['hi_farooq'],
      idIndonesian: map['id_indonesian'],
      itPiccardo: map['it_piccardo'],
      jaJapanese: map['ja_japanese'],
      koKorean: map['ko_korean'],
      kuAsan: map['ku_asan'],
      mlAbdulhameed: map['ml_abdulhameed'],
      msBasmeih: map['ms_basmeih'],
      nlKeyzer: map['nl_keyzer'],
      noBerg: map['no_berg'],
      plBielawskiego: map['pl_bielawskiego'],
      psAbdulwali: map['ps_abdulwali'],
      ptElhayek: map['pt_elhayek'],
      roGrigore: map['ro_grigore'],
      ruAbuadel: map['ru_abuadel'],
      ruKrachkovsky: map['ru_krachkovsky'],
      sdAmroti: map['sd_amroti'],
      soAbduh: map['so_abduh'],
      sqAhmeti: map['sq_ahmeti'],
      svBernstrom: map['sv_bernstrom'],
      swBarwani: map['sw_barwani'],
      taTamil: map['ta_tamil'],
      tgAyati: map['tg_ayati'],
      thThai: map['th_thai'],
      trAtes: map['tr_ates'],
      trTransliteration: map['tr_transliteration'],
      ttNugman: map['tt_nugman'],
      ugSaleh: map['ug_saleh'],
      urAhmedali: map['ur_ahmedali'],
      uzSodik: map['uz_sodik'],
      zhMajian: map['zh_majian'],
    );
  }
  @override
  TransModel fromMap(Map<String, dynamic> map) {
    return TransModel(
      verseId: int.parse(map['verse_id'] ?? "0"),
      chapterId: int.parse(map['chapter_id'] ?? "0"),
      senId: map['sen_id'] ,
      ayah: map['ayah'],
      amSadiq: map['am_sadiq'],
      arJalalayn: map['ar_jalalayn'],
      arMuyassar: map['ar_muyassar'],
      azMammadaliyev: map['az_mammadaliyev'],
      berMensur: map['ber_mensur'],
      bgTheophanov: map['bg_theophanov'],
      bnBengali: map['bn_bengali'],
      bsKorkut: map['bs_korkut'],
      csHrbek: map['cs_hrbek'],
      deAburida: map['de_aburida'],
      dvDivehi: map['dv_divehi'],
      enSahih: map['en_sahih'],
      enTransliteration: map['en_transliteration'],
      esBornez: map['es_bornez'],
      faAnsarian: map['fa_ansarian'],
      frHamidullah: map['fr_hamidullah'],
      haGumi: map['ha_gumi'],
      hiFarooq: map['hi_farooq'],
      idIndonesian: map['id_indonesian'],
      itPiccardo: map['it_piccardo'],
      jaJapanese: map['ja_japanese'],
      koKorean: map['ko_korean'],
      kuAsan: map['ku_asan'],
      mlAbdulhameed: map['ml_abdulhameed'],
      msBasmeih: map['ms_basmeih'],
      nlKeyzer: map['nl_keyzer'],
      noBerg: map['no_berg'],
      plBielawskiego: map['pl_bielawskiego'],
      psAbdulwali: map['ps_abdulwali'],
      ptElhayek: map['pt_elhayek'],
      roGrigore: map['ro_grigore'],
      ruAbuadel: map['ru_abuadel'],
      ruKrachkovsky: map['ru_krachkovsky'],
      sdAmroti: map['sd_amroti'],
      soAbduh: map['so_abduh'],
      sqAhmeti: map['sq_ahmeti'],
      svBernstrom: map['sv_bernstrom'],
      swBarwani: map['sw_barwani'],
      taTamil: map['ta_tamil'],
      tgAyati: map['tg_ayati'],
      thThai: map['th_thai'],
      trAtes: map['tr_ates'],
      trTransliteration: map['tr_transliteration'],
      ttNugman: map['tt_nugman'],
      ugSaleh: map['ug_saleh'],
      urAhmedali: map['ur_ahmedali'],
      uzSodik: map['uz_sodik'],
      zhMajian: map['zh_majian'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransModel.fromJson(String source) =>
      TransModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransModel(senId: $senId, chapterId: $chapterId, verseId: $verseId, ayah: $ayah, amSadiq: $amSadiq, arJalalayn: $arJalalayn, muyassar: $arMuyassar, azMammadaliyev: $azMammadaliyev, berMensur: $berMensur, bgTheophanov: $bgTheophanov, bnBengali: $bnBengali, bsKorkut: $bsKorkut, csHrbek: $csHrbek, deAburida: $deAburida, dvDivehi: $dvDivehi, enSahih: $enSahih, enTransliteration: $enTransliteration, esBornez: $esBornez, faAnsarian: $faAnsarian, frHamidullah: $frHamidullah, haGumi: $haGumi, hiFarooq: $hiFarooq, idIndonesian: $idIndonesian, itPiccardo: $itPiccardo, jaJapanese: $jaJapanese, koKorean: $koKorean, kuAsan: $kuAsan, mlAbdulhameed: $mlAbdulhameed, msBasmeih: $msBasmeih, nlKeyzer: $nlKeyzer, noBerg: $noBerg, plBielawskiego: $plBielawskiego, psAbdulwali: $psAbdulwali, ptElhayek: $ptElhayek, roGrigore: $roGrigore, ruAbuadel: $ruAbuadel, ruKrachkovsky: $ruKrachkovsky, sdAmroti: $sdAmroti, soAbduh: $soAbduh, sqAhmeti: $sqAhmeti, svBernstrom: $svBernstrom, swBarwani: $swBarwani, taTamil: $taTamil, tgAyati: $tgAyati, thThai: $thThai, trAtes: $trAtes, trTransliteration: $trTransliteration, ttNugman: $ttNugman, ugSaleh: $ugSaleh, urAhmedali: $urAhmedali, uzSodik: $uzSodik, zhMajian: $zhMajian)';
  }

  @override
  List<Object?> get props {
    return [
      senId,
      chapterId,
      verseId,
      ayah,
      amSadiq,
      arJalalayn,
      arMuyassar,
      azMammadaliyev,
      berMensur,
      bgTheophanov,
      bnBengali,
      bsKorkut,
      csHrbek,
      deAburida,
      dvDivehi,
      enSahih,
      enTransliteration,
      esBornez,
      faAnsarian,
      frHamidullah,
      haGumi,
      hiFarooq,
      idIndonesian,
      itPiccardo,
      jaJapanese,
      koKorean,
      kuAsan,
      mlAbdulhameed,
      msBasmeih,
      nlKeyzer,
      noBerg,
      plBielawskiego,
      psAbdulwali,
      ptElhayek,
      roGrigore,
      ruAbuadel,
      ruKrachkovsky,
      sdAmroti,
      soAbduh,
      sqAhmeti,
      svBernstrom,
      swBarwani,
      taTamil,
      tgAyati,
      thThai,
      trAtes,
      trTransliteration,
      ttNugman,
      ugSaleh,
      urAhmedali,
      uzSodik,
      zhMajian,
    ];
  }

  @override
  List<TransModel> fromMapList(List<Map<String, dynamic>> mapList) {
    final List<TransModel> dataList = <TransModel>[];

    for (final dynamic dynamicData in mapList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<TransModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final TransModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  set id(int _id) {}

  @override
  Dao copy({required int id}) {
    // TODO: implement copy
    throw UnimplementedError();
  }

  @override
  // TODO: implement id
  int get id => senId;
}
