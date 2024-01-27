import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../core/general/models/dao_abstract.dart';

abstract class RootsAbjdTableColumns {
  static const tableName = "roots_abjd";
  static const abjdId = "abjd_id";
  static const abjd = "abjd";
}

abstract class RootsTableColumns {
  static const tableName = "roots";
  static const rootId = "root_id";
  static const abjd = "abjd";
  static const root = "root";
}

// SELECT abjd_id,
//  abjd
// FROM roots_abjd;

// SELECT root_id,
//        abjd,
//        root
//   FROM roots;

// SELECT root_id,
//        abjd,
//        root
//   FROM roots where abjd = "ا";

class RootsModel extends Equatable implements Dao<RootsModel> {
  final String root;
  int rootId;
  final String abjd;
  RootsModel({
    required this.root,
    required this.rootId,
    required this.abjd,
  });

  RootsModel copyWith({
    String? root,
    int? rootId,
    String? abjd,
  }) {
    return RootsModel(
      root: root ?? this.root,
      rootId: rootId ?? this.rootId,
      abjd: abjd ?? this.abjd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'root': root,
      'root_id': rootId,
      'abjd': abjd,
    };
  }

  factory RootsModel.fromMap(Map<String, dynamic> map) {
    return RootsModel(
      root: map['root'] ?? '',
      rootId: map['root_id']?.toInt() ?? 0,
      abjd: map['abjd'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RootsModel.fromJson(String source) =>
      RootsModel.fromMap(json.decode(source));

  @override
  String toString() => root;

  @override
  fromMap(map) {
    return RootsModel(
      root: map['root'] ?? '',
      rootId: map['root_id']?.toInt() ?? 0,
      abjd: map['abjd'] ?? '',
    );
  }

  @override
  List<RootsModel> fromMapList(List<Map<String, dynamic>> dynamicDataList) {
    final List<RootsModel> dataList = <RootsModel>[];

    for (final dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<RootsModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final RootsModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  RootsModel copy({required int id}) {
    return copyWith(rootId: id);
  }

  @override
  set id(int _id) {
    rootId = id;
  }

  @override
  // TODO: implement id
  int get id => rootId;

  @override
  List<Object> get props => [rootId];
}
