import 'package:flutter/material.dart';

class AccountsManagementProvider extends ChangeNotifier {
  int navigationButtons = 0;
  String? dropdownValue;

  setDropDownValue(value) {
    dropdownValue = value;
    notifyListeners();
  }

  setNavigationIndex(index) {
    navigationButtons = index;
    notifyListeners();
  }
}
