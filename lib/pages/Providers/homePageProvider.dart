import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool? _isProcessing;

  bool? get isProcessing => _isProcessing;

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }
}
