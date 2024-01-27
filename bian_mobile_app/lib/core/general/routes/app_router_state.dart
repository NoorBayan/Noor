import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final appRouterStateProvider = ChangeNotifierProvider<AppRouterState>((ref) {
//   return AppRouterState();
// });
final appRouterStateProvider =  AppRouterState();


class AppRouterState extends ChangeNotifier {
  String? _incomingPath;
  String?  get incomingPath => this._incomingPath;

  set incomingPath(final value) {
    this._incomingPath = value;
    notifyListeners();
  }
}
