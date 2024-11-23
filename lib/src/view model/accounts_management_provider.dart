import 'package:flutter/material.dart';

class AccountsManagementProvider extends ChangeNotifier {
  int navigationButtons = 0;
  String? dropdownValue;
  int screenindex = 0;

  setscreenindex(index) {
    screenindex = index;
    notifyListeners();
  }

  setDropDownValue(value) {
    dropdownValue = value;
    notifyListeners();
  }

  setNavigationIndex(index) {
    navigationButtons = index;
    notifyListeners();
  }
}
