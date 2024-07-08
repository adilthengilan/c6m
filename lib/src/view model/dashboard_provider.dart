import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier{ 
  int navigationButtonsSelectedIndex = 0;
  

  void setSelectedButtonIndex(index){
    navigationButtonsSelectedIndex = index;
    notifyListeners();
  }
}