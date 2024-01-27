import 'package:bian_mobile_app/features/lemma/model/lemmas.dart';

import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/dao_abstract.dart';

class LemmaRepo implements SqlRepository {
  late BaseDatabase _databaseInterface;
  LemmasModel? data;

  LemmaRepo() {
    _databaseInterface = SQLDatabase.instance;
  }

  @override
  Future<int> delete() {
    return _databaseInterface.delete(
        LemmasTableColumns.tableName, data!, LemmasTableColumns.lemmaId);
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
  Future<List<LemmasModel>> getList() async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    const statement = '''
SELECT ${LemmasTableColumns.lemma},
       ${LemmasTableColumns.lemmaId},
       ${LemmasTableColumns.abjd}
  FROM ${LemmasTableColumns.tableName};
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List<LemmasModel>.generate(maps.length, (i) {
      final map = {
        LemmasTableColumns.tableName: {
          LemmasTableColumns.lemmaId: maps[i][LemmasTableColumns.lemmaId],
          LemmasTableColumns.lemma: maps[i][LemmasTableColumns.lemma],
          LemmasTableColumns.abjd: maps[i][LemmasTableColumns.abjd],
        }
      };
      return LemmasModel.fromMap(map[LemmasTableColumns.tableName]!);
    });
  }

  @override
  Future<Dao> getOne(String id) async {
    throw UnimplementedError();
  }

  // Future<List<Dao>> rawQuery(String query) {
  //   return _databaseInterface.rawQuery(query, sajeaQuestion);
  // }

  Future<List<LemmasModel>> customQuery({required String abjd}) async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    final statement = '''
SELECT DISTINCT ${LemmasTableColumns.abjd},
        ${LemmasTableColumns.lemma},
        ${LemmasTableColumns.lemmaId}
  FROM ${LemmasTableColumns.tableName}
  WHERE ${LemmasTableColumns.abjd} = "$abjd";
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List<LemmasModel>.generate(maps.length, (i) {
      final map = {
        LemmasTableColumns.tableName: {
          LemmasTableColumns.lemmaId: maps[i][LemmasTableColumns.lemmaId],
          LemmasTableColumns.lemma: maps[i][LemmasTableColumns.lemma],
          LemmasTableColumns.abjd: maps[i][LemmasTableColumns.abjd],
        }
      };
      return LemmasModel.fromMap(map[LemmasTableColumns.tableName]!);
    });
  }
}
