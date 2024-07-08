import 'package:flutter/material.dart';

class GuestDetailesProvider extends ChangeNotifier {
  final ScrollController imageScrollController = ScrollController();

  int _currentIndex = 0;

  int selectBockingHistory = 0;

  void scrollToNext() {
    if (_currentIndex < 10) {
      _currentIndex++;
      imageScrollController.animateTo(
        _currentIndex * 400.0, // Adjust based on your image width
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
      imageScrollController.animateTo(
        _currentIndex * 400.0, // Adjust based on your image width
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}