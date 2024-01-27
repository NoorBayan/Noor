import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../core/general/models/dao_abstract.dart';

abstract class PhraseStructureTableColumns {
  static const tableName = "quran";
  static const vid = "vid";
  static const stemPos = "stem_pos";
  static const relStemToken = "rel_stem_token";
  static const relStemRef = "rel_stem_ref";
  static const relStemDir = "rel_stem_dir";
  static const stemRefPos = "stem_ref_pos";
}

class PhraseStructureModel extends Equatable
    implements Dao<PhraseStructureModel> {
  int vid;
  final String? stemPos;
  final String? relStemToken;
  final String? relStemRef;
  final String? relStemDir;
  final String? stemRefPos;
  final String? relation;
  PhraseStructureModel({
    required this.vid,
    this.stemPos,
    this.relStemToken,
    this.relStemRef,
    this.relStemDir,
    this.stemRefPos,
    this.relation,
  });

  PhraseStructureModel copyWith({
    String? stemPos,
    String? relStemToken,
    String? relStemRef,
    String? relStemDir,
    String? stemRefPos,
    String? relation,
    int? vid,
  }) {
    return PhraseStructureModel(
      stemPos: stemPos ?? this.stemPos,
      relStemToken: relStemToken ?? this.relStemToken,
      relStemRef: relStemRef ?? this.relStemRef,
      relStemDir: relStemDir ?? this.relStemDir,
      stemRefPos: stemRefPos ?? this.stemRefPos,
      vid: vid ?? this.vid,
      relation: relation ?? this.relation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stem_pos': stemPos,
      'rel_stem_token': relStemToken,
      'rel_stem_ref': relStemRef,
      'stem_ref_pos': stemRefPos,
      'rel_stem_dir': relStemDir,
      'relation': relation,
      'vid': vid,
    };
  }

  factory PhraseStructureModel.fromMap(Map<String, dynamic> map) {
    return PhraseStructureModel(
      stemPos: map['stem_pos'],
      relStemToken: map['rel_stem_token'],
      relStemRef: map['rel_stem_ref'],
      relStemDir: map['rel_stem_dir'],
      stemRefPos: map['stem_ref_pos'],
      relation: map['relation'],
      vid: map['vid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhraseStructureModel.fromJson(String source) =>
      PhraseStructureModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PhraseStructureModel(relStemToken: $relStemToken, relStemRef: $relStemRef, relStemDir: $relStemDir)';

  @override
  List<Object?> get props => [relStemToken, relStemRef, relStemDir];
  @override
  fromMap(map) {
    return PhraseStructureModel(
      stemPos: map['stem_pos'],
      relStemToken: map['rel_stem_token'],
      relStemRef: map['rel_stem_ref'],
      relStemDir: map['rel_stem_dir'],
      stemRefPos: map['stem_ref_pos'],
      vid: map['vid'],
    );
  }

  @override
  List<PhraseStructureModel> fromMapList(
      List<Map<String, dynamic>> dynamicDataList) {
    final List<PhraseStructureModel> dataList = <PhraseStructureModel>[];

    for (final dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        dataList.add(PhraseStructureModel.fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<PhraseStructureModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final PhraseStructureModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  PhraseStructureModel copy({required int id}) {
    return copyWith(vid: id);
  }

  @override
  set id(int _id) {
    vid = id;
  }

  @override
  int get id => vid;
}
