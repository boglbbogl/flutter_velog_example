import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool isSplash = true;

  AuthProvider() {
    checked();
  }

  void checked() {
    Future.delayed(const Duration(milliseconds: 100), () {
      isSplash = false;
      notifyListeners();
    });
  }
}
