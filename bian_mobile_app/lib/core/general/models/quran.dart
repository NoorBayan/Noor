import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'dao_abstract.dart';

abstract class QuranTableColumns {
  static const tableName = "quran";
  static const vid = "vid";
  static const senId = "sen_id";
  static const chapterId = "chapter_id";
  static const verseId = "verse_id";
  static const uthmani = "uthmani";
  static const imlaai = "imlaai";
  static const phone = "phone";
  static const tran = "tran";
  static const prifx = "prifx";
  static const prefixPos = "prefix_pos";
  static const prefixes = "prefixes";
  static const stem = "stem";
  static const stemPos = "stem_pos";
  static const suffix = "suffix";
  static const suffixPos = "suffix_pos";
  static const suffixes = "suffixes";
  static const lemma = "lemma";
  static const root = "root";
  static const verbForms = "Verb_forms";
  static const verbTimes = "verb_times";
  static const verbMoods = "verb_moods";
  static const verbVoices = "verb_voices";
  static const nominalStates = "nominal_states";
  static const derivedNouns = "derived_nouns";
  static const nominalCases = "nominal_cases";
  static const specialGroups = "special_groups";
  static const gender = "gender";
  static const persons = "persons";
  static const numbers = "numbers";
  static const relStemToken = "rel_stem_token";
  static const relLabelStem = "rel_label_stem";
  static const relStemDir = "rel_stem_dir";
  static const relStemRef = "rel_stem_ref";
  static const stemRefPos = "stem_ref_pos";
  // static const relLabelPrifx = "rel_label_prifx";
  // static const relPrifxDir = "rel_prifx_dir";
  // static const relPrifxRef = "rel_prifx_ref";
  // static const relSuffixToken = "rel_suffix_token";
  // static const relLabelSuffix = "rel_label_suffix";
  // static const relSuffixDir = "rel_suffix_dir";
  // static const relSuffixRef = "rel_suffix_ref";
}

// SELECT vid,
//        uthmani,
//        imlaai,
//        phone,
//        tran,
//        prifx,
//        prefix_pos,
//        prefixes,
//        stem,
//        stem_pos,
//        suffix,
//        suffix_pos,
//        suffixes,
//        lemma,
//        root,
//        Verb_forms,
//        verb_times,
//        verb_moods,
//        verb_voices,
//        nominal_states,
//        derived_nouns,
//        nominal_cases,
//        special_groups,
//        gender,
//        persons,
//        numbers,
//        rel_stem_token,
//        rel_label_stem,
//        rel_stem_dir,
//        rel_stem_ref,
//        rel_prifx_token,
//        rel_label_prifx,
//        rel_prifx_dir,
//        rel_prifx_ref,
//        rel_suffix_token,
//        rel_label_suffix,
//        rel_suffix_dir,
//        rel_suffix_ref
//   FROM quran;
class QuranModel extends Equatable implements Dao<QuranModel> {
  final int senId;
  final int chapterId;
  final int verseId;
  final int vid;
  final String? uthmani;
  // final String? imlaai;
  final String? phone;
  final String? tran;
  final String? prifx;
  final String? prefixPos;
  final String? prefixes;
  final String? stem;
  final String? stemPos;
  final String? suffix;
  final String? suffixPos;
  final String? suffixes;
  final String? lemma;
  final String? root;
  final String? verbForms;
  final String? verbTimes;
  final String? verbMoods;
  final String? verbVoices;
  final String? nominalStates;
  final String? derivedNouns;
  final String? nominalCases;
  final String? specialGroups;
  final String? gender;
  final String? persons;
  final String? numbers;
  final String? relStemToken;
  final String? relLabelStem;
  final String? relStemDir;
  final String? relStemRef;
  final String? stemRefPos;
  final String? relPrifxToken;
  // final String? relLabelPrifx;
  // final String? relPrifxDir;
  // final String? relPrifxRef;
  // final String? relSuffixToken;
  // final String? relLabelSuffix;
  // final String? relSuffixDir;
  // final String? relSuffixRef;
  QuranModel({
    required this.vid,
    required this.senId,
    required this.chapterId,
    required this.verseId,
    this.uthmani,
    // this.imlaai,
    this.phone,
    this.tran,
    this.prifx,
    this.prefixPos,
    this.prefixes,
    this.stem,
    this.stemPos,
    this.suffix,
    this.suffixPos,
    this.suffixes,
    this.lemma,
    this.root,
    this.verbForms,
    this.verbTimes,
    this.verbMoods,
    this.verbVoices,
    this.nominalStates,
    this.derivedNouns,
    this.nominalCases,
    this.specialGroups,
    this.gender,
    this.persons,
    this.numbers,
    this.relStemToken,
    this.relLabelStem,
    this.relStemDir,
    this.relStemRef,
    this.stemRefPos,
    this.relPrifxToken,
    // this.relLabelPrifx,
    // this.relPrifxDir,
    // this.relPrifxRef,
    // this.relSuffixToken,
    // this.relLabelSuffix,
    // this.relSuffixDir,
    // this.relSuffixRef,
  });

  QuranModel copyWith({
    int? senId,
    int? chapterId,
    int? verseId,
    int? vid,
    String? uthmani,
    String? imlaai,
    String? phone,
    String? tran,
    String? prifx,
    String? prefixPos,
    String? prefixes,
    String? stem,
    String? stemPos,
    String? suffix,
    String? suffixPos,
    String? suffixes,
    String? lemma,
    String? root,
    String? verbForms,
    String? verbTimes,
    String? verbMoods,
    String? verbVoices,
    String? nominalStates,
    String? derivedNouns,
    String? nominalCases,
    String? specialGroups,
    String? gender,
    String? persons,
    String? numbers,
    String? relStemToken,
    String? relLabelStem,
    String? relStemDir,
    String? relStemRef,
    String? stemRefPos,
    String? relPrifxToken,
    String? relLabelPrifx,
    String? relPrifxDir,
    String? relPrifxRef,
    String? relSuffixToken,
    String? relLabelSuffix,
    String? relSuffixDir,
    String? relSuffixRef,
  }) {
    return QuranModel(
      senId: senId ?? this.senId,
      chapterId: chapterId ?? this.chapterId,
      verseId: verseId ?? this.verseId,
      vid: vid ?? this.vid,
      uthmani: uthmani ?? this.uthmani,
      // imlaai: imlaai ?? this.imlaai,
      phone: phone ?? this.phone,
      tran: tran ?? this.tran,
      prifx: prifx ?? this.prifx,
      prefixPos: prefixPos ?? this.prefixPos,
      prefixes: prefixes ?? this.prefixes,
      stem: stem ?? this.stem,
      stemPos: stemPos ?? this.stemPos,
      suffix: suffix ?? this.suffix,
      suffixPos: suffixPos ?? this.suffixPos,
      suffixes: suffixes ?? this.suffixes,
      lemma: lemma ?? this.lemma,
      root: root ?? this.root,
      verbForms: verbForms ?? this.verbForms,
      verbTimes: verbTimes ?? this.verbTimes,
      verbMoods: verbMoods ?? this.verbMoods,
      verbVoices: verbVoices ?? this.verbVoices,
      nominalStates: nominalStates ?? this.nominalStates,
      derivedNouns: derivedNouns ?? this.derivedNouns,
      nominalCases: nominalCases ?? this.nominalCases,
      specialGroups: specialGroups ?? this.specialGroups,
      gender: gender ?? this.gender,
      persons: persons ?? this.persons,
      numbers: numbers ?? this.numbers,
      relStemToken: relStemToken ?? this.relStemToken,
      relLabelStem: relLabelStem ?? this.relLabelStem,
      relStemDir: relStemDir ?? this.relStemDir,
      relStemRef: relStemRef ?? this.relStemRef,
      stemRefPos: stemRefPos ?? this.stemRefPos,
      relPrifxToken: relPrifxToken ?? this.relPrifxToken,
      // relLabelPrifx: relLabelPrifx ?? this.relLabelPrifx,
      // relPrifxDir: relPrifxDir ?? this.relPrifxDir,
      // relPrifxRef: relPrifxRef ?? this.relPrifxRef,
      // relSuffixToken: relSuffixToken ?? this.relSuffixToken,
      // relLabelSuffix: relLabelSuffix ?? this.relLabelSuffix,
      // relSuffixDir: relSuffixDir ?? this.relSuffixDir,
      // relSuffixRef: relSuffixRef ?? this.relSuffixRef,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sen_id': senId,
      'chapter_id': chapterId,
      'verse_id': verseId,
      'vid': vid,
      'uthmani': uthmani,
      // 'imlaai': imlaai,
      'phone': phone,
      'tran': tran,
      'prifx': prifx,
      'prefix_pos': prefixPos,
      'prefixes': prefixes,
      'stem': stem,
      'stem_pos': stemPos,
      'suffix': suffix,
      'suffix_pos': suffixPos,
      'suffixes': suffixes,
      'lemma': lemma,
      'root': root,
      'verb_forms': verbForms,
      'verb_times': verbTimes,
      'verb_moods': verbMoods,
      'verb_voices': verbVoices,
      'nominal_states': nominalStates,
      'derived_nouns': derivedNouns,
      'nominal_cases': nominalCases,
      'special_groups': specialGroups,
      'gender': gender,
      'persons': persons,
      'numbers': numbers,
      'rel_stem_token': relStemToken,
      'rel_label_stem': relLabelStem,
      'rel_stem_dir': relStemDir,
      'rel_stem_ref': relStemRef,
      'rel_prifx_token': relPrifxToken,
      'stem_ref_pos': stemRefPos,
      // 'rel_label_prifx': relLabelPrifx,
      // 'rel_prifx_dir': relPrifxDir,
      // 'rel_prifx_ref': relPrifxRef,
      // 'rel_suffix_token': relSuffixToken,
      // 'rel_label_suffix': relLabelSuffix,
      // 'rel_suffix_dir': relSuffixDir,
      // 'rel_suffix_ref': relSuffixRef,
    };
  }

  factory QuranModel.fromMap(Map<String, dynamic> map) {
    return QuranModel(
      verseId: map['verse_id']?.toInt() ?? 0,
      chapterId: map['chapter_id']?.toInt() ?? 0,
      senId: map['sen_id']?.toInt() ?? 0,
      vid: map['vid']?.toInt() ?? 0,
      uthmani: map['uthmani'],
      // imlaai: map['imlaai'],
      phone: map['phone'],
      tran: map['tran'],
      prifx: map['prifx'],
      prefixPos: map['prefix_pos'],
      prefixes: map['prefixes'],
      stem: map['stem'],
      stemPos: map['stem_pos'],
      suffix: map['suffix'],
      suffixPos: map['suffix_pos'],
      suffixes: map['suffixes'],
      lemma: map['lemma'],
      root: map['root'],
      verbForms: map['verb_forms'],
      verbTimes: map['verb_times'],
      verbMoods: map['verb_moods'],
      verbVoices: map['verb_voices'],
      nominalStates: map['nominal_states'],
      derivedNouns: map['derived_nouns'],
      nominalCases: map['nominal_cases'],
      specialGroups: map['special_groups'],
      gender: map['gender'],
      persons: map['persons'],
      numbers: map['numbers'],
      relStemToken: map['rel_stem_token'],
      relLabelStem: map['rel_label_stem'],
      relStemDir: map['rel_stem_dir'],
      relStemRef: map['rel_stem_ref'],
      stemRefPos: map['stem_ref_pos'],
      // relPrifxToken: map['rel_prifx_token'],
      // relLabelPrifx: map['rel_label_prifx'],
      // relPrifxDir: map['rel_prifx_dir'],
      // relPrifxRef: map['rel_prifx_ref'],
      // relSuffixToken: map['rel_suffix_token'],
      // relLabelSuffix: map['rel_label_suffix'],
      // relSuffixDir: map['rel_suffix_dir'],
      // relSuffixRef: map['rel_suffix_ref'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuranModel.fromJson(String source) =>
      QuranModel.fromMap(json.decode(source));

  @override
  List<Object?> get props {
    return [
      vid,
      uthmani,
      // imlaai,
      phone,
      tran,
      prifx,
      prefixPos,
      prefixes,
      stem,
      stemPos,
      suffix,
      suffixPos,
      suffixes,
      lemma,
      root,
      verbForms,
      verbTimes,
      verbMoods,
      verbVoices,
      nominalStates,
      derivedNouns,
      nominalCases,
      specialGroups,
      gender,
      persons,
      numbers,
      relStemToken,
      relLabelStem,
      relStemDir,
      relStemRef,
      relPrifxToken,
      // relLabelPrifx,
      // relPrifxDir,
      // relPrifxRef,
      // relSuffixToken,
      // relLabelSuffix,
      // relSuffixDir,
      // relSuffixRef,
    ];
  }

  @override
  int get id => vid;

  @override
  Dao copy({required int id}) {
    return QuranModel(
        vid: vid, senId: senId, chapterId: chapterId, verseId: verseId);
  }

  @override
  QuranModel fromMap(Map<String, dynamic> map) {
    return QuranModel(
      verseId: int.parse(map['verse_id'] ?? "0") ,
      chapterId: int.parse(map['chapter_id'] ?? "0"),
      senId:  int.parse(map['sen_id'] ?? "0"),
      vid: map['vid']  ,
      uthmani: map['uthmani'],
      // imlaai: map['imlaai'],
      phone: map['phone'],
      tran: map['tran'],
      prifx: map['prifx'],
      prefixPos: map['prefix_pos'],
      prefixes: map['prefixes'],
      stem: map['stem'],
      stemPos: map['stem_pos'],
      suffix: map['suffix'],
      suffixPos: map['suffix_pos'],
      suffixes: map['suffixes'],
      lemma: map['lemma'],
      root: map['root'],
      verbForms: map['verb_forms'],
      verbTimes: map['verb_times'],
      verbMoods: map['verb_moods'],
      verbVoices: map['verb_voices'],
      nominalStates: map['nominal_states'],
      derivedNouns: map['derived_nouns'],
      nominalCases: map['nominal_cases'],
      specialGroups: map['special_groups'],
      gender: map['gender'],
      persons: map['persons'],
      numbers: map['numbers'],
      relStemToken: map['rel_stem_token'],
      relLabelStem: map['rel_label_stem'],
      relStemDir: map['rel_stem_dir'],
      relStemRef: map['rel_stem_ref'],
      stemRefPos: map['stem_ref_pos'],
      relPrifxToken: map['rel_prifx_token'],
      // relLabelPrifx: map['rel_label_prifx'],
      // relPrifxDir: map['rel_prifx_dir'],
      // relPrifxRef: map['rel_prifx_ref'],
      // relSuffixToken: map['rel_suffix_token'],
      // relLabelSuffix: map['rel_label_suffix'],
      // relSuffixDir: map['rel_suffix_dir'],
      // relSuffixRef: map['rel_suffix_ref'],
    );
  }

  @override
  List<QuranModel> fromMapList(List<Map<String, dynamic>> mapList) {
    final List<QuranModel> dataList = <QuranModel>[];

    for (final dynamic dynamicData in mapList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<QuranModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final QuranModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  set id(int _id) {
   
  }
}
