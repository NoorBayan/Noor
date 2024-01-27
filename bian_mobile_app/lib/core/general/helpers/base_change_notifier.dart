import 'package:flutter/foundation.dart';


abstract class BaseChangeNotifier extends ChangeNotifier {
  bool _disposed = false;

  bool get disposed => _disposed;

  // this for page with form and button to submit form
  bool _isBusy = false;
  bool get isBusy => _isBusy;
  set isBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    if (value) {
      _hasError = false;
    }
    notifyListeners();
  }


  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  set isLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }

  String errorMessage = '';
  bool _hasError = false;
  bool get hasError => _hasError;
  set hasError(bool value) {
    _hasError = value;
    if (value) {
      _isLoading = false;
    }
    notifyListeners();
  }

  @override
  notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }
}
