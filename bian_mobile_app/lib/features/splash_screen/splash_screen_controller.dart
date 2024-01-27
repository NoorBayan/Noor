part of 'splash_screen_page.dart';

final splashScreenController =
    ChangeNotifierProvider.autoDispose<SplashScreenController>((ref) {
  return SplashScreenController(ref);
});

class SplashScreenController extends BaseChangeNotifier {
  final _stopwatch = Stopwatch();
  final Ref _ref;

  final _minimumDurationToKeepShowingSplashScreen = const Duration(seconds: 1);

  SplashScreenController(this._ref);
  bool isShowingAnimation = true;
  bool isProcessing = false;

  Future onShowSplashScreen(BuildContext context) async {
    _stopwatch.start();
    isProcessing = true;
    await AppProvider().initOtherService();
    // checks if time elapsed is smaller than minimum time to stop showing splash screen after given time to give enough time to show animation
    // UriLinkServiceProvider.instance.init();
    // if (_stopwatch.elapsed < _minimumDurationToKeepShowingSplashScreen) {
    //   Duration duration =
    //       _minimumDurationToKeepShowingSplashScreen - _stopwatch.elapsed;
    //   // adds remaining time to show splash screen
    //   Future.delayed(duration, () => _onEndSplashScreen(context));
    // } else {
    isProcessing = false;
    if (!isShowingAnimation) {
      onEndSplashScreen(context);
    }
    // }
  }

  onEndSplashScreen(BuildContext context) async {
    _stopwatch.stop();
    AppProvider().showSplashScreen = false;

    context.go(AppProvider().splashInitialScreen);
  }

  // String get versionApp => AppProvider().versionApp;
}
