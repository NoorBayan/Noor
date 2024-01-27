import 'package:bian_mobile_app/core/general/helpers/base_database.dart';

import '../../core/general/models/dao_abstract.dart';

abstract class SqlRepository {
  BaseDatabase? _databaseInterface;

  Future<Dao> insert();

  Future<int> update();

  Future<int> delete();

  Future<Dao> getOne(String id);

  Future<List<Dao>> getList();
}
