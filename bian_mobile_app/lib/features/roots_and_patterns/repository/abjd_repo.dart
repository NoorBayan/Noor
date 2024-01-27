import 'package:bian_mobile_app/core/general/models/abjd.dart';
import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/model/roots.dart';

import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/dao_abstract.dart';

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
SELECT ${RootsAbjdTableColumns.abjdId},
       ${RootsAbjdTableColumns.abjd}
  FROM ${RootsAbjdTableColumns.tableName};
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    final list = List<AbjdModel>.generate(maps.length, (i) {
      final map = {
        RootsAbjdTableColumns.tableName: {
          RootsAbjdTableColumns.abjdId: maps[i][RootsAbjdTableColumns.abjdId],
          RootsAbjdTableColumns.abjd: maps[i][RootsAbjdTableColumns.abjd],
        }
      };
      return AbjdModel.fromMap(map[RootsAbjdTableColumns.tableName]!);
    });
    list.removeAt(19);
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
