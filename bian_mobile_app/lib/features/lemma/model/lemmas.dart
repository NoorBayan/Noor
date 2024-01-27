import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../core/general/models/dao_abstract.dart';

abstract class LemmasAbjdTableColumns {
  static const tableName = "lemmas_abjd";
  static const abjdId = "abjd_id";
  static const abjd = "abjd";
}
// SELECT lemma_id,
//      abjd,
//     lemma
// FROM lemmas;

abstract class LemmasTableColumns {
  static const tableName = "lemmas";
  static const lemmaId = "lemma_id";
  static const abjd = "abjd";
  static const lemma = "lemma";
}

class LemmasModel extends Equatable implements Dao<LemmasModel> {
  int lemmaId;
  final String lemma;
  final String abjd;
  LemmasModel({
    required this.lemmaId,
    required this.lemma,
    required this.abjd,
  });

  LemmasModel copyWith({
    int? lemmaId,
    String? lemma,
    String? abjd,
  }) {
    return LemmasModel(
      lemmaId: lemmaId ?? this.lemmaId,
      lemma: lemma ?? this.lemma,
      abjd: abjd ?? this.abjd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lemma_id': lemmaId,
      'lemma': lemma,
      'abjd': abjd,
    };
  }

  factory LemmasModel.fromMap(Map<String, dynamic> map) {
    return LemmasModel(
      lemmaId: map['lemma_id']?.toInt() ?? 0,
      lemma: map['lemma'] ?? '',
      abjd: map['abjd'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LemmasModel.fromJson(String source) =>
      LemmasModel.fromMap(json.decode(source));

  @override
  String toString() => lemma;

  @override
  List<Object> get props => [
        lemmaId,
      ];

  @override
  fromMap(map) {
    return LemmasModel(
      lemma: map['lemma'] ?? '',
      lemmaId: map['lemma_id']?.toInt() ?? 0,
      abjd: map['abjd'] ?? '',
    );
  }

  @override
  List<LemmasModel> fromMapList(List<Map<String, dynamic>> dynamicDataList) {
    final List<LemmasModel> dataList = <LemmasModel>[];

    for (final dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<LemmasModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final LemmasModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  LemmasModel copy({required int id}) {
    return copyWith(lemmaId: id);
  }

  @override
  set id(int _id) {
    lemmaId = id;
  }

  @override
  // TODO: implement id
  int get id => lemmaId;
}
