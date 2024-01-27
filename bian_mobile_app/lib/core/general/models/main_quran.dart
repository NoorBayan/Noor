import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:bian_mobile_app/core/general/models/dao_abstract.dart';

class MainQuran extends Equatable implements Dao<MainQuran> {
  int vid;
  final String? uthmani;
  // final String? imlaai;
  final String? phone;
  final String? tran;
  MainQuran({
    required this.vid,
    this.uthmani,
    // this.imlaai,
    this.phone,
    this.tran,
  });

  MainQuran copyWith({
    int? vid,
    String? uthmani,
    String? imlaai,
    String? phone,
    String? tran,
  }) {
    return MainQuran(
      vid: vid ?? this.vid,
      uthmani: uthmani ?? this.uthmani,
      // imlaai: imlaai ?? this.imlaai,
      phone: phone ?? this.phone,
      tran: tran ?? this.tran,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vid'] = vid;
    data['uthmani'] = uthmani;
    // data['imlaai'] = imlaai;
    data['phone'] = phone;
    data['tran'] = tran;
    return data;
  }

  factory MainQuran.fromMap(Map<String, dynamic> map) {
    return MainQuran(
      vid: map['vid']?.toInt() ?? 0,
      uthmani: map['uthmani'],
      // imlaai: map['imlaai'],
      phone: map['phone'],
      tran: map['tran'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MainQuran.fromJson(String source) =>
      MainQuran.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MainQuran(vid: $vid, uthmani: $uthmani, phone: $phone, tran: $tran)';
  }

  @override
  List<Object?> get props {
    return [
      vid,
      uthmani,
      // imlaai,
      phone,
      tran,
    ];
  }

  @override
  int get id => vid;

  @override
  fromMap(map) {
    return MainQuran(
      vid: map['vid']?.toInt() ?? 0,
      uthmani: map['uthmani'],
      // imlaai: map['imlaai'],
      phone: map['phone'],
      tran: map['tran'],
    );
  }

  @override
  List<MainQuran> fromMapList(List<Map<String, dynamic>> dynamicDataList) {
    final List<MainQuran> dataList = <MainQuran>[];

    for (final dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<MainQuran>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final MainQuran? data in objectList) {
        if (data != null) {
          mapList.add(toMap());
        }
      }
    }

    return mapList;
  }

  @override
  MainQuran copy({required int id}) {
    return MainQuran(
        vid: vid, phone: phone, tran: tran, uthmani: uthmani);
  }

  @override
  set id(int _id) {
    vid = _id;
  }
}
