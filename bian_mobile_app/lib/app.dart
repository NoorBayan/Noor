
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/general/helpers/flash_bar_helper.dart';
import 'core/general/routes/routes.dart';
import 'core/general/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(LifeCycleEventHandler.instance);
    super.initState();
  }
  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(LifeCycleEventHandler.instance);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
          // useInheritedMediaQuery: true,
          designSize: const Size(393, 852), // size phone design
          builder: (_, __) => Consumer(builder: (context, ref, child) {
                final router = ref.watch(routerProvider);
                return MaterialApp.router(
                  routeInformationParser: router.routeInformationParser,
                  routeInformationProvider: router.routeInformationProvider,
                  routerDelegate: router.routerDelegate,
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.light,

                  // locale: DevicePreview.locale(context), // Add the locale here
                  // builder: DevicePreview.appBuilder,
                  // useInheritedMediaQuery: true,

                  builder: (context, _) {
                    AppDimensions.init(context);

                    var child = _!;
                    // final navigatorKey = child.key as GlobalKey<NavigatorState>;

                    // don't move "FlashBarUtil.setupOverlay" to the end of this function
                    // child = FlashBarHelper.setupOverlay(
                    //   context: context,
                    //   child: child,
                    // );

                    child = AppTextStyle.wrapAppToStopTextScaleFactor(
                      child: child,
                      context: context,
                    );

                    // child = DevicePreview.appBuilder(context, _);

                    child = AppTextStyle.wrapAppToRemoveFirstAndLastLineHeight(
                      child: child,
                    );

                    return child;
                  },
                );
              })),
    );
  }
}
