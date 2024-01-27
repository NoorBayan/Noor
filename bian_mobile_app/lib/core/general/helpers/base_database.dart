import '../models/dao_abstract.dart';
import 'database_columns.dart';

abstract class BaseDatabase {
  Future initDatabase();
  Future<Dao> insert(String table, Dao data);
  Future<int> update(String table, Dao data, dynamic whereColumn);
  Future<int> delete(String table, Dao data, dynamic whereColumn);
  Future<Dao> query(
      {required String table,
      required Dao data,
      required DatabaseColumns columns,
      dynamic whereColumn,
      required String whereValue});
   Future<List<Dao>> queryCursor(String table,
      {bool? distinct,
      required Dao data,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset,
      int? bufferSize});
  Future<List<Dao<dynamic>>> queryList({required String table, required Dao data, required String orderBy});
}
