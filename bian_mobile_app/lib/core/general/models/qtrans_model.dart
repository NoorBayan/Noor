import 'dart:convert';

import 'package:bian_mobile_app/core/general/models/dao_abstract.dart';
import 'package:equatable/equatable.dart';

abstract class QtransTabelColumns {
  static String language = "Language";
  static String name = "Name";
  static String translator = "Translator";
  static String download = "download";
  static String tname = "tname";
}

class QtransModel extends Equatable implements Dao<QtransModel>{
  final String language;
  final String name;
  final String translator;
  final String download;
  final String tname;
  const QtransModel({
    required this.language,
    required this.name,
    required this.translator,
    required this.download,
    required this.tname,
  });

  QtransModel copyWith({
    String? language,
    String? name,
    String? translator,
    String? download,
    String? tname,
  }) {
    return QtransModel(
      language: language ?? this.language,
      name: name ?? this.name,
      translator: translator ?? this.translator,
      download: download ?? this.download,
      tname: tname ?? this.tname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Language': language,
      'Name': name,
      'Translator': translator,
      'download': download,
      'tname': tname,
    };
  }

  factory QtransModel.fromMap(Map<String, dynamic> map) {
    return QtransModel(
      language: map['Language'] ?? '',
      name: map['Name'] ?? '',
      translator: map['Translator'] ?? '',
      download: map['download'] ?? '',
      tname: map['tname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QtransModel.fromJson(String source) =>
      QtransModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QtransModel(language: $language, name: $name, translator: $translator, download: $download, tname: $tname)';
  }

  @override
  List<Object> get props {
    return [
      language,
      name,
      translator,
      download,
      tname,
    ];
  }
  
  
  @override
  QtransModel fromMap(Map<String, dynamic> map) {
    return QtransModel(
      language: map['Language'] ?? '',
      name: map['Name'] ?? '',
      translator: map['Translator'] ?? '',
      download: map['download'] ?? '',
      tname: map['tname'] ?? '',
    );
  }
  
  @override
  List<QtransModel> fromMapList(List<Map<String, dynamic>> mapList) {
    final List<QtransModel> dataList = <QtransModel>[];

    for (final dynamic dynamicData in mapList) {
      if (dynamicData != null) {
        dataList.add(fromMap(dynamicData));
      }
    }
    return dataList;
  }

  @override
  List<Map<String, dynamic>> toMapList(List<QtransModel>? objectList) {
    final List<Map<String, dynamic>> mapList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (final QtransModel? data in objectList) {
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
  int get id => 1;
}
