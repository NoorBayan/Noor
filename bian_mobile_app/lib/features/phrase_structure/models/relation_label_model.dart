import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../core/general/models/dao_abstract.dart';

abstract class RelationLabelTableColumns {
  static const tableName = "relation_label";
  static const id = "id";
  static const relLabelStem = "rel_label_stem";
}

class RelationLabelModel extends Equatable implements Dao<RelationLabelModel> {
  final String relLabelStem;
  int id;
  RelationLabelModel({
    required this.relLabelStem,
    required this.id,
  });

  RelationLabelModel copyWith({
    String? relLabelStem,
    int? id,
  }) {
    return RelationLabelModel(
      relLabelStem: relLabelStem ?? this.relLabelStem,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rel_label_stem': relLabelStem,
      'id': id,
    };
  }

  factory RelationLabelModel.fromMap(Map<String, dynamic> map) {
    return RelationLabelModel(
      relLabelStem: map['rel_label_stem'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RelationLabelModel.fromJson(String source) =>
      RelationLabelModel.fromMap(json.decode(source));

  @override
  String toString() => 'RelationLabel(relLabelStem: $relLabelStem, id: $id)';

  @override
  List<Object> get props => [relLabelStem, id];

  @override
  fromMap(map) {
    return RelationLabelModel(
      relLabelStem: map['rel_label_stem'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  @override
  List<RelationLabelModel> fromMapList(
      List<Map<String, dynamic>> dynamicDataList) {
    final List<RelationLabelModel> dataList = <RelationLabelModel>[];

    for (final dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<RelationLabelModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final RelationLabelModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  RelationLabelModel copy({required int id}) {
    return copyWith(id: id);
  }
}
