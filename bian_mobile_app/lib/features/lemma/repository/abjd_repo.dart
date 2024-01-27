import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/abjd.dart';
import '../../../core/general/models/dao_abstract.dart';
import '../model/lemmas.dart';
import '../../roots_and_patterns/model/roots.dart';

class AbjdRepo implements SqlRepository {
  late BaseDatabase _databaseInterface;
  AbjdModel? data;

  AbjdRepo() {
    _databaseInterface = SQLDatabase.instance;
  }

  @override
  Future<int> delete() {
    return _databaseInterface.delete(
        RootsAbjdTableColumns.tableName, data!, RootsAbjdTableColumns.abjdId);
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
  Future<List<AbjdModel>> getList() async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    const statement = '''
SELECT ${LemmasAbjdTableColumns.abjdId},
       ${LemmasAbjdTableColumns.abjd}
  FROM ${LemmasAbjdTableColumns.tableName};
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    final list = List<AbjdModel>.generate(maps.length, (i) {
      final map = {
        LemmasAbjdTableColumns.tableName: {
          LemmasAbjdTableColumns.abjdId: maps[i][LemmasAbjdTableColumns.abjdId],
          LemmasAbjdTableColumns.abjd: maps[i][LemmasAbjdTableColumns.abjd],
        }
      };
      return AbjdModel.fromMap(map[LemmasAbjdTableColumns.tableName]!);
    });

    list.removeAt(22);
    return list;
  }

  @override
  Future<Dao> getOne(String id) async {
    throw UnimplementedError();
  }

  // Future<List<Dao>> rawQuery(String query) {
  //   return _databaseInterface.rawQuery(query, sajeaQuestion);
  // }
}
