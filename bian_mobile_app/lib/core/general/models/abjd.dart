import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'dao_abstract.dart';

class AbjdModel implements Dao<AbjdModel> {
  int abjdId;
  final String abjd;
  AbjdModel({
    required this.abjdId,
    required this.abjd,
  });

  @override
  int get id => abjdId;

  AbjdModel copyWith({
    int? abjdId,
    String? abjd,
  }) {
    return AbjdModel(
      abjdId: abjdId ?? this.abjdId,
      abjd: abjd ?? this.abjd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abjd_id': abjdId,
      'abjd': abjd,
    };
  }

  factory AbjdModel.fromMap(Map<String, dynamic> map) {
    return AbjdModel(
      abjdId: map['abjd_id']?.toInt() ?? 0,
      abjd: map['abjd'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AbjdModel.fromJson(String source) =>
      AbjdModel.fromMap(json.decode(source));

  @override
  String toString() => 'RootsAbjdModel(abjdId: $abjdId, abjd: $abjd)';

  @override
  fromMap(map) {
    return AbjdModel(
      abjdId: map['abjd_id']?.toInt() ?? 0,
      abjd: map['abjd'] ?? '',
    );
  }

  @override
  List<AbjdModel> fromMapList(List<Map<String, dynamic>> dynamicDataList) {
    final List<AbjdModel> dataList = <AbjdModel>[];

    for (final dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<AbjdModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final AbjdModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  AbjdModel copy({required int id}) {
    return copyWith(abjdId: id);
  }

  @override
  set id(int _id) {
    abjdId = id;
  }
}
