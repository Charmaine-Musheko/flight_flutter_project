import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool _isDisposed = false;

  bool _isFutureLoading = false;
  bool get isFutureLoading => _isFutureLoading;

  void viewIsLoading(bool value) {
    isLoading = value;
    _isFutureLoading = value;
    notify();
  }

  void notify() {
    if (!_isDisposed) {
      try {
        notifyListeners();
      } catch (exception) {
        if (kDebugMode) {
          print(exception);
        }
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
