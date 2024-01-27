abstract class Dao<T> {
  Dao(this.id);
  int id;
  static String? tableName;

  T fromMap(Map<String, dynamic> map);

  Map<String, dynamic> toMap( );

  List<T> fromMapList(List<Map<String, dynamic>> mapList);

  List<Map<String, dynamic>> toMapList(List<T> objectList);

  Dao copy({required int id});
}
