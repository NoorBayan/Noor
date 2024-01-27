import 'package:flutter/widgets.dart';

import '../../general/routes/routes.dart';

class NavigationService {
  // late GlobalKey<NavigatorState> navigationKey;
  static NavigationService? _instance;
  NavigationService._() {
    // navigationKey = GlobalKey<NavigatorState>();
  }
  static NavigationService get instance {
    _instance ??= NavigationService._();
    return _instance!;
  }

  BuildContext? get context => rootNavigatorKey.currentContext;

  BuildContext? _currentContext;

  BuildContext get currentContext => context ?? _currentContext!;

  updateCurrentContext(BuildContext _context) {
    _currentContext = _context;
  }

}
