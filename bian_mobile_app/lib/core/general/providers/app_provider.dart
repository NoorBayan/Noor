import 'package:bian_mobile_app/core/general/helpers/sql_database.dart';
import 'package:bian_mobile_app/features/home/view/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../features/roots_and_patterns/view/roots_and_patterns_view.dart';
import '../util/util.dart';

import '../helpers/hive_db_helper.dart';

final appProvider = ChangeNotifierProvider<AppProvider>((ref) {
  return AppProvider();
});

class AppProvider with ChangeNotifier {
  static final AppProvider _instance = AppProvider._();
  AppProvider._();
  factory AppProvider() {
    return _instance;
  }
  String splashInitialScreen = HomeView.path;
  bool showSplashScreen = true;
  static late String _appPathCache;

  Future init() async {
    showSplashScreen = false;
    await initBaseService();
    await initOtherService();
  }

  Future initBaseService() async {
    await HiveDbHelper().init().printAwaitTime('HiveDbHelper');
    //
  }

  // call this function when splash screen is shown
  Future initOtherService() async {
    _appPathCache = await FileUtil.tempDir.printAwaitTime('_appPathCache');
    await SQLDatabase.instance.initDatabase();
  }
}
