import 'dart:async';

import 'package:bian_mobile_app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/general/providers/app_provider.dart';
import 'core/general/theme/theme.dart';
import 'core/general/util/print_util.dart';

void main() async {
  //
  runZonedGuarded<Future<void>>(() async {
    ///
    // GoogleMapConfig.init();

    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    //
    AppTheme.stopLandscapeMode();

    await AppProvider().initBaseService().printAwaitTime('AppProvider');

    AppTheme.changeStatusAndNavigationBarColor(
      statusBarcolor: Colors.transparent,
      navigationBarColor: Colors.white,
    );

    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      //   // Enable Crashlytics collection while doing release builds.
      //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

      // The following lines are the same as previously explained in "Handling uncaught errors"
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }

    runApp(
      const App(),
    );

    // runApp(DevicePreview(
    //   // enabled: !kReleaseMode,
    //   enabled: true,
    //   builder: (context) =>  const App(), // Wrap your app
    // ));
  }, (error, stack) {
    if (!kDebugMode) {
      // FirebaseCrashlytics.instance.recordError(error, stack);
    }
  });
}
