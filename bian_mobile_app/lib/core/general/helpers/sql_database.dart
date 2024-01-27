import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/dao_abstract.dart';
import '../../../features/lemma/model/lemmas.dart';
import '../models/quran.dart';
import '../../../features/phrase_structure/models/relation_label_model.dart';
import '../../../features/roots_and_patterns/model/roots.dart';
import 'base_database.dart';
import 'custom_logger.dart';
import 'database_columns.dart';

class SQLDatabase implements BaseDatabase {
  SQLDatabase._init();
  static final SQLDatabase instance = SQLDatabase._init();
  static Database? _database;

  // Future<Database> get database async {
  //   if (_database != null) return _database!;

  //   return
  // }

  Future initialize() async {
    await initDatabase();
  }

  Database get database {
    return _database!;
  }

  @override
  Future initDatabase() async {
    // Construct a file path to copy database to
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =
        join(documentsDirectory.path, "database", "asset_database.db");

    // Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('assets', 'quran.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      Directory databaseDir =
          Directory(join(documentsDirectory.path, "database"));
      if (databaseDir.existsSync()) {
        await databaseDir.delete(recursive: true);
      } 
        await databaseDir.create();

      // Save copied asset to documents
      await File(path).writeAsBytes(
        bytes,
      );
    }

    // open copied database
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String databasePath = join(appDocDir.path, 'asset_database.db');
    _database = await openDatabase(
      path,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const String statement1 = '''
    CREATE TABLE ${QuranTableColumns.tableName}  (
   ${QuranTableColumns.vid} $integerType,
   ${QuranTableColumns.uthmani} $textType,
  //  ${QuranTableColumns.imlaai} $textType,
   ${QuranTableColumns.phone} $textType,
   ${QuranTableColumns.tran} $textType,
   ${QuranTableColumns.prifx} $textType,
   ${QuranTableColumns.prefixPos} $textType,
   ${QuranTableColumns.prefixes} $textType,
   ${QuranTableColumns.stem} $textType,
   ${QuranTableColumns.stemPos} $textType,
   ${QuranTableColumns.suffix} $textType,
   ${QuranTableColumns.suffixPos} $textType,
   ${QuranTableColumns.suffixes} $textType,
   ${QuranTableColumns.lemma} $textType,
   ${QuranTableColumns.root} $textType,
   ${QuranTableColumns.verbForms} $textType,
   ${QuranTableColumns.verbTimes} $textType,
   ${QuranTableColumns.verbMoods} $textType,
   ${QuranTableColumns.verbVoices} $textType,
   ${QuranTableColumns.nominalStates} $textType,
   ${QuranTableColumns.derivedNouns} $textType,
   ${QuranTableColumns.nominalCases} $textType,
   ${QuranTableColumns.specialGroups} $textType,
   ${QuranTableColumns.gender} $textType,
   ${QuranTableColumns.persons} $textType,
   ${QuranTableColumns.numbers} $textType,
   ${QuranTableColumns.relStemToken} $textType,
   ${QuranTableColumns.relLabelStem} $textType,
   ${QuranTableColumns.relStemDir} $textType,
   ${QuranTableColumns.relStemRef} $textType,
   ${QuranTableColumns.stemRefPos} $textType
)
''';

    const statement2 = '''
  CREATE TABLE ${RootsAbjdTableColumns.tableName} (
    ${RootsAbjdTableColumns.abjdId} $integerType,
    ${RootsAbjdTableColumns.abjd} $textType
    )
  ''';

    const statement3 = '''
  CREATE TABLE ${RootsTableColumns.tableName} (
    ${RootsTableColumns.rootId} $integerType,
    ${RootsTableColumns.abjd} $textType,
    ${RootsTableColumns.root} $textType
    )
  ''';

    const statement4 = '''
  CREATE TABLE ${LemmasAbjdTableColumns.tableName} (
    ${LemmasAbjdTableColumns.abjdId} $integerType,
    ${LemmasAbjdTableColumns.abjd} $textType
    )
  ''';

    const statement5 = '''
  CREATE TABLE ${LemmasTableColumns.tableName} (
    ${LemmasTableColumns.lemmaId} $integerType,
    ${LemmasTableColumns.abjd} $textType,
    ${LemmasTableColumns.lemma} $textType
    )
  ''';

    const statement6 = '''
  CREATE TABLE ${RelationLabelTableColumns.tableName} (
    ${RelationLabelTableColumns.id} $idType,
    ${RelationLabelTableColumns.tableName} $textType[]
    )
  ''';

    logger.d(statement1);
    logger.d(statement2);
    logger.d(statement3);
    logger.d(statement4);
    logger.d(statement5);
    logger.d(statement6);
    final batch = db.batch();
    batch.execute(statement1);
    batch.execute(statement2);
    batch.execute(statement3);
    batch.execute(statement4);
    batch.execute(statement5);
    batch.execute(statement6);
    await batch.commit();
//     print('''
// CREATE TABLE ${SajeaQuestion.tableName} (
//   ${SajeaQuestionFields.id} $idType,
//   ${SajeaQuestionFields.questionText1} $textType,
//   ${SajeaQuestionFields.questionText2} $textType,
//   ${SajeaQuestionFields.level} $textType,
//   ${SajeaQuestionFields.qgroup} $textType
//   )
// '''
// );
//     await db.execute('''
// CREATE TABLE ${SajeaAnswer.tableName} (
//   ${SajeaQuestionFields.id} $idType,
//   ${SajeaQuestionFields.questionText1} $textType,
//   ${SajeaQuestionFields.questionText2} $textType,
//   ${SajeaQuestionFields.level} $textType,
//   ${SajeaQuestionFields.qgroup} $textType
//   )
// ''');
  }

  @override
  Future<Dao> insert(String table, Dao data) async {
    final db = instance.database;
    final id = await db.insert(table, data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort);
    return data.copy(id: id);
  }

  @override
  Future<int> update(String table, Dao data, dynamic whereColumn) async {
    final db = instance.database;
    return db.update(
      table,
      data.toMap(),
      where: '$whereColumn = ?',
      whereArgs: [data.id],
    );
  }

  @override
  Future<int> delete(String table, Dao data, dynamic whereColumn) async {
    final db = instance.database;

    return db.delete(
      table,
      where: '${whereColumn.id} = ?',
      whereArgs: [data.id],
    );
  }

  @override
  Future<Dao> query(
      {required String table,
      required Dao data,
      required DatabaseColumns columns,
      dynamic whereColumn,
      required String whereValue}) async {
    final db = instance.database;
    final maps = await db.query(
      table,
      columns: columns.values,
      where: '$whereColumn = ?',
      whereArgs: [whereValue],
    );
    if (maps.isNotEmpty) {
      return data.fromMap(maps.first) as Dao<dynamic>;
    } else {
      throw Exception('ID $whereValue not found');
    }
  }

  Future<List<Map<String, dynamic>>> customQuery(String query) async {
    final db = instance.database;
    final maps = await db.rawQuery(query);
    return maps;
    // if (maps.isNotEmpty) {
    //   return data.fromMap(maps.first) as Dao<dynamic>;
    // } else {
    //   throw Exception('ID $whereField not found');
    // }
  }

  @override
  Future<List<Dao>> queryList(
      {required String table,
      required Dao data,
      required String orderBy}) async {
    final db = instance.database;

    final result = await db.query(table, orderBy: orderBy);

    return data.fromMapList(result.toList()) as List<Dao<dynamic>>;
  }

  Future<List<Dao>> rawQuery(String query, Dao data) async {
    final db = instance.database;
    final result = await db.rawQuery(query);
    return data.fromMapList(result.toList()) as List<Dao>;
  }

  @override
  Future<List<Dao>> queryCursor(String table,
      {required Dao data,
      bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset,
      int? bufferSize}) async {
    final db = instance.database;

    final result = await db.queryCursor(table,
        where: where,
        bufferSize: bufferSize,
        limit: limit,
        columns: columns,
        distinct: distinct,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        offset: offset,
        orderBy: orderBy);
    List<Map<String, dynamic>> mapList = [];
    try {
      while (await result.moveNext()) {
        var row = result.current;
        mapList.add(row);
      }
    } finally {
      // Important don't forget to close the cursor in case any exception is thrown before
      await result.close();
    }
    return data.fromMapList(mapList.toList()) as List<Dao<dynamic>>;
  }

  // Future<List<Dao>> rawInsert(String query, Dao data) async {
  //   final db = await instance.database;
  //   final result = await db.rawInsert(query);
  //   return data.fromMapList(result.toList()) as List<Dao<dynamic>>;
  // }

  // Future<List<Dao>> customRawQuery(String query, Dao data) async {
  //   final db = await instance.database;
  //   final result = await db.rawQuery(query);
  //   return data.fromMapList(result.toList()) as List<Dao<dynamic>>;
  // }
}
