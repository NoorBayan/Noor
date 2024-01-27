import 'dart:async';

import 'base_db_box.dart';

abstract mixin class BaseLocal {
  late BaseDbBox? _dbBox;
  late Completer<BaseDbBox?> _dbBoxCompleter;
  void init() {
    _dbBox = BaseDbBox();
    // _dbBoxCompleter = Completer();
    // _dbBoxCompleter.complete( _dbBox!.init(boxName));
  }

  static String allList = "all_list";

  void close() {
    _dbBox!.closeBox();
  }

  String get boxName;

  BaseDbBox get dbBox => _dbBox!;

  bool get isInitialized => _dbBox?.boxIsInitialized ?? false;

  Future<bool> initIfNeeded() async {
    if (!_dbBoxCompleter.isCompleted) {
      await _dbBoxCompleter.future;
      return true;
    }
    return false;
  }

  void refreshData(String data, String key) {
    return _dbBox!.setData(data: data, key: key);
  }

  void refreshAllData(Map<String, dynamic> entries) {
    return _dbBox!.setAllData(entries);
  }
}
