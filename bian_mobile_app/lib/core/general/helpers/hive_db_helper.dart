import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

/// HiveDbHelper is used to handle the hive database.
/// it is used to init hive, delete all box, and open secure box.
class HiveDbHelper {
  final String _dbAppName = "dbApp";
  Future init() async {
    // await Hive.initFlutter(_dbAppName);
    final directory = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = directory.path;
    // Hive.registerAdapter(
    //     CurrencyModel.modelName, (json) => CurrencyModel.fromJson);
    // Hive.registerAdapter(
    //     CountryModel.modelName, (json) => CountryModel.fromJson);
    // var path = Directory.current.path;
    // Hive..init(path);
  }

  // static Future<Box<dynamic>> openSecureBox(String boxName) async {
  //   const _sKey = '0y*@#%';
  //   final SecureStorage secureStorage = locator<SecureStorage>();
  //   // var containsEncryptionKey = await secureStorage.containsKey(_sKey); // not working on iOS
  //   var _key = await secureStorage.getData(_sKey);
  //   if (_key == null) {
  //     var hiveKey = Hive.generateSecureKey();
  //     var hiveKeyString = base64UrlEncode(hiveKey);
  //     await secureStorage.setData(key: _sKey, data: hiveKeyString);
  //     _key = hiveKeyString;
  //   }
  //   var encryptionKey = base64Url.decode(_key);
  //
  //   return await Hive.openBox(boxName,
  //       encryptionCipher: HiveAesCipher(encryptionKey));
  // }
  //
  // delet() async {
  //   await Hive.deleteFromDisk();
  // }
}
