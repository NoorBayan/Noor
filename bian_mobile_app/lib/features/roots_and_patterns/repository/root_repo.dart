import 'package:bian_mobile_app/features/roots_and_patterns/model/roots.dart';

import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/dao_abstract.dart';

class RootRepo implements SqlRepository {
  late BaseDatabase _databaseInterface;
  RootsModel? data;

  RootRepo() {
    _databaseInterface = SQLDatabase.instance;
  }

  @override
  Future<int> delete() {
    return _databaseInterface.delete(
        RootsTableColumns.tableName, data!, RootsTableColumns.rootId);
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
  Future<List<RootsModel>> getList() async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    const statement = '''
SELECT ${RootsTableColumns.root},
       ${RootsTableColumns.rootId},
       ${RootsTableColumns.abjd}
  FROM ${RootsAbjdTableColumns.tableName};
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List<RootsModel>.generate(maps.length, (i) {
      final map = {
        RootsTableColumns.tableName: {
          RootsTableColumns.rootId: maps[i][RootsTableColumns.rootId],
          RootsTableColumns.root: maps[i][RootsTableColumns.root],
          RootsTableColumns.abjd: maps[i][RootsTableColumns.abjd],
        }
      };
      return RootsModel.fromMap(map[RootsTableColumns.tableName]!);
    });
  }

  @override
  Future<Dao> getOne(String id) async {
    throw UnimplementedError();
  }

  // Future<List<Dao>> rawQuery(String query) {
  //   return _databaseInterface.rawQuery(query, sajeaQuestion);
  // }

  Future<List<RootsModel>> customQuery({required String abjd}) async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    final statement = '''
SELECT DISTINCT ${RootsTableColumns.abjd},
        ${RootsTableColumns.root},
        ${RootsTableColumns.rootId}
  FROM ${RootsTableColumns.tableName}
  WHERE ${RootsTableColumns.abjd} = "$abjd";
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List<RootsModel>.generate(maps.length, (i) {
      final map = {
        RootsTableColumns.tableName: {
          RootsTableColumns.rootId: maps[i][RootsTableColumns.rootId],
          RootsTableColumns.root: maps[i][RootsTableColumns.root],
          RootsTableColumns.abjd: maps[i][RootsTableColumns.abjd],
        }
      };
      return RootsModel.fromMap(map[RootsTableColumns.tableName]!);
    });
  }
}
