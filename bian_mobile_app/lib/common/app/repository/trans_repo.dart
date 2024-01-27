import 'package:bian_mobile_app/core/general/models/quran.dart';
import 'package:bian_mobile_app/core/general/models/trans_model.dart';

import '../../../common/widgets/sql_repository.dart';
import '../../../core/general/helpers/base_database.dart';
import '../../../core/general/helpers/sql_database.dart';
import '../../../core/general/models/dao_abstract.dart';

class TransRepo implements SqlRepository {
  late BaseDatabase _databaseInterface;
  TransModel? model;

  TransRepo() {
    _databaseInterface = SQLDatabase.instance;
  }

  @override
  Future<int> delete() {
    return _databaseInterface.delete(
        TransTableColumns.tableName, model!, TransTableColumns.senId);
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
  Future<List<Dao>> getList() async {
    throw UnimplementedError();
  }

  @override
  Future<Dao> getOne(String id) async {
    throw UnimplementedError();
  }

  Future<List<TransModel>> customQuery({
    int? senId,
  }) async {
    SQLDatabase sqlDatabase = _databaseInterface as SQLDatabase;
    late String statement;
    if (senId != null) {
      statement = '''
SELECT 
${TransTableColumns.senId},
${TransTableColumns.chapterId},
${TransTableColumns.verseId},
${TransTableColumns.ayah},
${TransTableColumns.amSadiq},
${TransTableColumns.arJalalayn},
${TransTableColumns.arMuyassar},
${TransTableColumns.azMammadaliyev},
${TransTableColumns.berMensur},
${TransTableColumns.bgTheophanov},
${TransTableColumns.bnBengali},
${TransTableColumns.bsKorkut},
${TransTableColumns.csHrbek},
${TransTableColumns.deAburida},
${TransTableColumns.dvDivehi},
${TransTableColumns.enSahih},
${TransTableColumns.enTransliteration},
${TransTableColumns.esBornez},
${TransTableColumns.faAnsarian},
${TransTableColumns.frHamidullah},
${TransTableColumns.haGumi},
${TransTableColumns.hiFarooq},
${TransTableColumns.idIndonesian},
${TransTableColumns.itPiccardo},
${TransTableColumns.jaJapanese},
${TransTableColumns.koKorean},
${TransTableColumns.kuAsan},
${TransTableColumns.mlAbdulhameed},
${TransTableColumns.msBasmeih},
${TransTableColumns.nlKeyzer},
${TransTableColumns.noBerg},
${TransTableColumns.plBielawskiego},
${TransTableColumns.psAbdulwali},
${TransTableColumns.ptElhayek},
${TransTableColumns.roGrigore},
${TransTableColumns.ruAbuadel},
${TransTableColumns.ruKrachkovsky},
${TransTableColumns.sdAmroti},
${TransTableColumns.soAbduh},
${TransTableColumns.sqAhmeti},
${TransTableColumns.svBernstrom},
${TransTableColumns.swBarwani},
${TransTableColumns.taTamil},
${TransTableColumns.tgAyati},
${TransTableColumns.thThai},
${TransTableColumns.trAtes},
${TransTableColumns.trTransliteration},
${TransTableColumns.ttNugman},
${TransTableColumns.ugSaleh},
${TransTableColumns.urAhmedali},
${TransTableColumns.uzSodik},
${TransTableColumns.zhMajian}
  FROM ${TransTableColumns.tableName}
  WHERE ${TransTableColumns.senId} = "$senId";
''';
    }
    final List<Map<String, dynamic>> maps =
        await sqlDatabase.customQuery(statement);
    return model!.fromMapList(maps.toList());
    // return List.generate(maps.length, (i) {
    //   final map = {
    //     TransTableColumns.tableName: {
    //       TransTableColumns.vid: maps[i][TransTableColumns.vid],
    //       TransTableColumns.senId: maps[i][TransTableColumns.senId],
    //       TransTableColumns.chapterId: maps[i][TransTableColumns.chapterId],
    //       TransTableColumns.verseId: maps[i][TransTableColumns.verseId],
    //       // TransTableColumns.imlaai: maps[i][TransTableColumns.imlaai],
    //     }
    //   };
    //   return TransModel.fromMap(map[TransTableColumns.tableName]!);
    // });
  }
}
