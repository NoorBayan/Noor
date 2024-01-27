import 'package:bian_mobile_app/features/phrase_structure/models/relation_label_model.dart';

import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/dao_abstract.dart';
import '../../lemma/model/lemmas.dart';

class RelationLabelRepo implements SqlRepository {
  late BaseDatabase _databaseInterface;
  RelationLabelModel? data;

  RelationLabelRepo() {
    _databaseInterface = SQLDatabase.instance;
  }

  @override
  Future<int> delete() {
    return _databaseInterface.delete(RelationLabelTableColumns.tableName, data!,
        RelationLabelTableColumns.id);
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
  Future<List<RelationLabelModel>> getList() async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    const statement = '''
SELECT ${RelationLabelTableColumns.id},
       ${RelationLabelTableColumns.relLabelStem}
  FROM ${RelationLabelTableColumns.tableName};
''';
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);

    return List<RelationLabelModel>.generate(maps.length, (i) {
      final map = {
        RelationLabelTableColumns.tableName: {
          RelationLabelTableColumns.id: maps[i][RelationLabelTableColumns.id],
          RelationLabelTableColumns.relLabelStem: maps[i]
              [RelationLabelTableColumns.relLabelStem],
        }
      };
      return RelationLabelModel.fromMap(
          map[RelationLabelTableColumns.tableName]!);
    });
  }

  @override
  Future<Dao> getOne(String id) async {
    throw UnimplementedError();
  }

  // Future<List<Dao>> rawQuery(String query) {
  //   return _databaseInterface.rawQuery(query, sajeaQuestion);
  // }
}
