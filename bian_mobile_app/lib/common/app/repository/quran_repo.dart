import 'package:bian_mobile_app/core/general/models/quran.dart';

import '../../../common/app/models/main_quran.dart';
import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/dao_abstract.dart';

class QuranRepo implements SqlRepository {
  late BaseDatabase _databaseInterface;
  QuranModel? mainQuran;

  QuranRepo() {
    _databaseInterface = SQLDatabase.instance;
  }

  @override
  Future<int> delete() {
    return _databaseInterface.delete(
        QuranTableColumns.tableName, mainQuran!, QuranTableColumns.vid);
  }

  @override
  Future<Dao> insert() {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> update() {
    // TODO: implement update
    throw UnimplementedError();
  }

  // Future<List<Dao>> getListWithLevel(String level, String group) async {

  // }

  @override
  Future<List<Dao>> getList() async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    final statement = '''
SELECT ${QuranTableColumns.vid},
       ${QuranTableColumns.uthmani},
      //  ${QuranTableColumns.imlaai},
       ${QuranTableColumns.phone},
       ${QuranTableColumns.tran}
  FROM ${QuranTableColumns.tableName};
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List.generate(maps.length, (i) {
      final map = {
        QuranTableColumns.tableName: {
          QuranTableColumns.vid: maps[i][QuranTableColumns.vid],
          // QuranTableColumns.imlaai: maps[i][QuranTableColumns.imlaai],
          QuranTableColumns.uthmani: maps[i][QuranTableColumns.uthmani],
          QuranTableColumns.phone: maps[i][QuranTableColumns.phone],
          QuranTableColumns.tran: maps[i][QuranTableColumns.tran],
        }
      };
      return MainQuran.fromMap(map);
    });
  }

  @override
  Future<Dao> getOne(String id) async {
    throw UnimplementedError();
  }

  // Future<List<Dao>> rawQuery(String query) {
  //   return _databaseInterface.rawQuery(query, sajeaQuestion);
  // }

  Future<List<QuranModel>> customQuery({String? root, String? lemma}) async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    late String statement;
    if (root != null) {
      statement = '''
SELECT ${QuranTableColumns.vid},
       ${QuranTableColumns.uthmani},
      //  ${QuranTableColumns.imlaai},
       ${QuranTableColumns.phone},
       ${QuranTableColumns.root},
       ${QuranTableColumns.tran}
  FROM ${QuranTableColumns.tableName}
  WHERE ${QuranTableColumns.root} = "$root";
''';
    } else {
      statement = '''
SELECT ${QuranTableColumns.vid},
       ${QuranTableColumns.senId},
       ${QuranTableColumns.chapterId},
       ${QuranTableColumns.verseId},
       ${QuranTableColumns.uthmani},
      //  ${QuranTableColumns.imlaai},
       ${QuranTableColumns.phone},
       ${QuranTableColumns.lemma},
       ${QuranTableColumns.tran}
  FROM ${QuranTableColumns.tableName}
  WHERE ${QuranTableColumns.lemma} = "$lemma";
''';
    }

    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List.generate(maps.length, (i) {
      final map = {
        QuranTableColumns.tableName: {
          QuranTableColumns.vid: maps[i][QuranTableColumns.vid],
          QuranTableColumns.senId: maps[i][QuranTableColumns.senId],
          QuranTableColumns.chapterId: maps[i][QuranTableColumns.chapterId],
          QuranTableColumns.verseId: maps[i][QuranTableColumns.verseId],
          // QuranTableColumns.imlaai: maps[i][QuranTableColumns.imlaai],
          QuranTableColumns.uthmani: maps[i][QuranTableColumns.uthmani],
          QuranTableColumns.phone: maps[i][QuranTableColumns.phone],
          QuranTableColumns.tran: maps[i][QuranTableColumns.tran],
        }
      };
      return QuranModel.fromMap(map[QuranTableColumns.tableName]!);
    });
  }

  Future<List<QuranModel>> customCursorQuery(
      {String? root,
      String? lemma,
      required int limit,
      required offset}) async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;

    final List<Dao<dynamic>> maps = await sqlDatabase.queryCursor(
        QuranTableColumns.tableName,
        data: mainQuran!,
        offset: offset,
        columns: [
          QuranTableColumns.vid,
          QuranTableColumns.senId,
          QuranTableColumns.chapterId,
          QuranTableColumns.verseId,
          QuranTableColumns.uthmani,
          // QuranTableColumns.imlaai, //!Warn: my need to delete
          QuranTableColumns.phone,
          QuranTableColumns.tran,
          QuranTableColumns.prifx,
          QuranTableColumns.prefixPos,
          QuranTableColumns.prefixes,
          QuranTableColumns.stem,
          QuranTableColumns.stemPos,
          QuranTableColumns.suffix,
          QuranTableColumns.suffixPos,
          QuranTableColumns.suffixes,
          QuranTableColumns.lemma,
          QuranTableColumns.root,
          QuranTableColumns.verbForms,
          QuranTableColumns.verbTimes,
          QuranTableColumns.verbMoods,
          QuranTableColumns.verbVoices,
          QuranTableColumns.nominalStates,
          QuranTableColumns.derivedNouns,
          QuranTableColumns.specialGroups,
          QuranTableColumns.gender,
          QuranTableColumns.persons,
          QuranTableColumns.numbers,
        ],
        where:
            '${root != null ? QuranTableColumns.root : QuranTableColumns.lemma} = ?',
        whereArgs: root != null ? [root] : [lemma],
        limit: limit);
    return maps as List<QuranModel>;
  }

  Future<List<QuranModel>> getPhraseFromRelationLabel(
      {required String relationLabel,
      required int limit,
      required offset}) async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;

    final List<Dao<dynamic>> maps =
        await sqlDatabase.queryCursor(QuranTableColumns.tableName,
            data: mainQuran!,
            offset: offset,
            columns: [
              QuranTableColumns.vid,
              QuranTableColumns.senId,
              QuranTableColumns.chapterId,
              QuranTableColumns.verseId,
              QuranTableColumns.uthmani,
              // QuranTableColumns.imlaai, //!Warn: my need to delete
              QuranTableColumns.phone,
              QuranTableColumns.tran,
              QuranTableColumns.prifx,
              QuranTableColumns.prefixPos,
              QuranTableColumns.prefixes,
              QuranTableColumns.stem,
              QuranTableColumns.stemPos,
              QuranTableColumns.suffix,
              QuranTableColumns.suffixPos,
              QuranTableColumns.suffixes,
              QuranTableColumns.lemma,
              QuranTableColumns.root,
              QuranTableColumns.verbForms,
              QuranTableColumns.verbTimes,
              QuranTableColumns.verbMoods,
              QuranTableColumns.verbVoices,
              QuranTableColumns.nominalStates,
              QuranTableColumns.derivedNouns,
              QuranTableColumns.specialGroups,
              QuranTableColumns.gender,
              QuranTableColumns.persons,
              QuranTableColumns.numbers,
              QuranTableColumns.relStemToken,
              QuranTableColumns.relLabelStem,
              QuranTableColumns.relStemDir,
              QuranTableColumns.relStemRef,
              QuranTableColumns.stemRefPos,
              // QuranTableColumns.relLabelPrifx,
              // QuranTableColumns.relPrifxDir,
              // QuranTableColumns.relPrifxRef,
              // QuranTableColumns.relSuffixToken,
              // QuranTableColumns.relLabelSuffix,
              // QuranTableColumns.relSuffixDir,
              // QuranTableColumns.relSuffixRef,
            ],
            where: '${QuranTableColumns.relLabelStem} = ?',
            whereArgs: [relationLabel],
            limit: limit);
    return maps as List<QuranModel>;
  }
}
