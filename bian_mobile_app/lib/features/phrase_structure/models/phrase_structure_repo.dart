import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/dao_abstract.dart';
import 'phrase_structure_model.dart';
import 'relation_label_model.dart';

class PhraseStructureRepo implements SqlRepository {
  late BaseDatabase _databaseInterface;
  PhraseStructureModel? data;

  PhraseStructureRepo() {
    _databaseInterface = SQLDatabase.instance;
  }

  @override
  Future<int> delete() {
    return _databaseInterface.delete(PhraseStructureTableColumns.tableName,
        data!, PhraseStructureTableColumns.vid);
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
  Future<List<PhraseStructureModel>> getList() async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    const statement = '''
SELECT ${PhraseStructureTableColumns.vid},
       ${PhraseStructureTableColumns.relStemDir},
       ${PhraseStructureTableColumns.relStemRef},
       ${PhraseStructureTableColumns.relStemToken},
       ${PhraseStructureTableColumns.stemRefPos}
  FROM ${PhraseStructureTableColumns.tableName};
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List<PhraseStructureModel>.generate(maps.length, (i) {
      final map = {
        PhraseStructureTableColumns.tableName: {
          PhraseStructureTableColumns.vid: maps[i]
              [PhraseStructureTableColumns.vid],
          PhraseStructureTableColumns.relStemDir: maps[i]
              [PhraseStructureTableColumns.relStemDir],
          PhraseStructureTableColumns.relStemRef: maps[i]
              [PhraseStructureTableColumns.relStemRef],
          PhraseStructureTableColumns.relStemToken: maps[i]
              [PhraseStructureTableColumns.relStemToken],
          PhraseStructureTableColumns.stemRefPos: maps[i]
              [PhraseStructureTableColumns.stemRefPos],
        }
      };
      return PhraseStructureModel.fromMap(
          map[PhraseStructureTableColumns.tableName]!);
    });
  }

  Future<List<PhraseStructureModel>> getPhraseFromRelationLabel(
      {required String relationLabel,
      required int limit,
      required offset}) async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
//     final statement = '''
// SELECT ${PhraseStructureTableColumns.vid},
//        ${PhraseStructureTableColumns.relStemDir},
//        ${PhraseStructureTableColumns.relStemRef},
//        ${PhraseStructureTableColumns.relStemToken},
//        ${PhraseStructureTableColumns.stemRefPos}
//   FROM ${PhraseStructureTableColumns.tableName}
//   WHERE ${RelationLabelTableColumns.relLabelStem} = "$relationLabel";
// ''';

    final List<Dao<dynamic>> maps = await sqlDatabase.queryCursor(
        PhraseStructureTableColumns.tableName,
        data: data!,
        offset: offset,
        columns: [
          PhraseStructureTableColumns.vid,
          PhraseStructureTableColumns.stemPos,
          PhraseStructureTableColumns.relStemDir,
          PhraseStructureTableColumns.relStemRef,
          PhraseStructureTableColumns.relStemToken,
          PhraseStructureTableColumns.stemRefPos
        ],
        where:
            '${RelationLabelTableColumns.relLabelStem} = ?',
        whereArgs: [relationLabel],
        limit: limit);
    return maps as List<PhraseStructureModel>;
    
  }

  @override
  Future<Dao> getOne(String id) async {
    throw UnimplementedError();
  }

  // Future<List<Dao>> rawQuery(String query) {
  //   return _databaseInterface.rawQuery(query, sajeaQuestion);
  // }
}
