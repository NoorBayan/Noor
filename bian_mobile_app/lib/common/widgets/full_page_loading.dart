import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/general/routes/navigator_service.dart';

class FullPageLoading {
  static BuildContext get globalContext =>
      NavigationService.instance.currentContext;
  static void startLoading([BuildContext? context]) {
    showDialog(
      context: context ?? globalContext,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          color: Colors.grey,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  static void endLoading([BuildContext? context]) {
    final _context = context ?? globalContext;
    if (Navigator.of(_context).canPop()) {
      Navigator.of(_context).pop();
    }
  }
}
