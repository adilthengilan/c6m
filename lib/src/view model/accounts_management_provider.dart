import 'package:flutter/material.dart';

class AccountsManagementProvider extends ChangeNotifier {
  int navigationButtons = 0;

  setNavigationIndex(index){
    navigationButtons = index;
    notifyListeners();
  }
}