import 'dart:convert';

import 'package:bian_mobile_app/core/general/models/dao_abstract.dart';
import 'package:equatable/equatable.dart';

abstract class MokrianTableColumns {
  static const mid = "mid";
  static const mname = "mname";
  static const link = "link";
}

class MokrianModel extends Equatable implements Dao<MokrianModel> {
  final int mid;
  final String? mname;
  final String? link;
  MokrianModel({
    required this.mid,
    this.mname,
    this.link,
  });

  MokrianModel copyWith({
    int? mid,
    String? mname,
    String? link,
  }) {
    return MokrianModel(
      mid: mid ?? this.mid,
      mname: mname ?? this.mname,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mid': mid,
      'mname': mname,
      'link': link,
    };
  }

  factory MokrianModel.fromMap(Map<String, dynamic> map) {
    return MokrianModel(
      mid: map['mid']?.toInt() ?? 0,
      mname: map['mname'],
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MokrianModel.fromJson(String source) =>
      MokrianModel.fromMap(json.decode(source));

  @override
  String toString() => 'MokrianModel(mid: $mid, mname: $mname, link: $link)';

  @override
  List<Object?> get props => [mid, mname, link];

  @override
  int get id => mid;

  @override
  Dao copy({required int id}) {
    // TODO: implement copy
    throw UnimplementedError();
  }

  @override
  MokrianModel fromMap(Map<String, dynamic> map) {
    return MokrianModel(
      mid: map['mid']?.toInt() ?? 0,
      mname: map['mname'],
      link: map['link'],
    );
  }

  @override
  List<MokrianModel> fromMapList(List<Map<String, dynamic>> mapList) {
    final List<MokrianModel> dataList = <MokrianModel>[];

    for (final dynamic dynamicData in mapList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<MokrianModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final MokrianModel? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  set id(int _id) {
    // TODO: implement id
  }
}
