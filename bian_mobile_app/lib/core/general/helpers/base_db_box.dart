import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeDbProvider = Provider<BaseDbBox>((ref) {
  return BaseDbBox();
});

/// This a helper class to handle the common database (hive) functionality.
class BaseDbBox {
  /// This is the box name.
  late String _boxName;

  /// This is the box instance.
  late Box<dynamic> _box;

  /// This is a flag to check if the box is initialized or not.
  bool boxIsInitialized = false;

  /// This is the first element key in the box.
  /// It is used to get the first element in the box if no key is provided.
  final String _firstElmentKey = 0.toString();

  /// Initialize the box.
  /// [boxName] is the box name.
  ///
  /// [isSecureData] is a flag to check if the data is secure or not (encrypted).
  ///
  void init(String boxName, {bool isSecureData = false}) {
    _boxName = boxName;

    if (isSecureData) {
      // _box = await HiveDbHelper.openSecureBox(_boxName);
      _box = Hive.box(name: _boxName, encryptionKey: 'Osama');
    } else {
      // _box = await Hive.openBox(_boxName);
      _box = Hive.box(name: _boxName);
    }
    // final directory = await getApplicationDocumentsDirectory();
    // Hive.defaultDirectory = directory.path;
    boxIsInitialized = true;
    // _box.watch().listen((event) {
    //   debugModePrint('${_boxName} box changed');
    // });
  }

  // Stream<BoxEvent> Function({dynamic key}) get watch => _box.watch;
  Stream<void> get watch => _box.watch();

  Box get getBox => _box;

  List getAllDataModelsInBox() {
    // List<dynamic> listData = _box.values.toList();
    List<dynamic> listData = _box.getAll(_box.keys);

    return listData;
  }

  getData({String? key, dynamic defaultValue}) {
    final data = _box.get(key ?? _firstElmentKey, defaultValue: defaultValue);
    return data;
  }

  void setData({String? key, required dynamic data}) {
    // await _box.put(key ?? _firstElmentKey, data);
    _box.put(key ?? _firstElmentKey, data);
  }

  void setAllData(Map<String, dynamic> entries) {
    // await _box.putAll(entries);
    _box.putAll(entries);
  }

  void deleteKey({required String key}) {
    _box.delete(key);
  }

  bool containsKey({required String key}) {
    return _box.containsKey(key);
  }

  void deleteAllKeys() {
    _box.deleteAll(_box.keys);
  }

  void addAll(Iterable<dynamic> values) {
    _box.addAll(values);
  }

  void deleteBox() async {
    // await _box.deleteFromDisk();
    _box.deleteFromDisk();
  }

  void closeBox() {
    // await _box.close();
    _box.close();
    boxIsInitialized = false;
  }
}
