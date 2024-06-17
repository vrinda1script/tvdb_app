import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  SplashProvider() {
    initializeApp();
  }

  void initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
    _isInitialized = true;
    notifyListeners();
  }
}
