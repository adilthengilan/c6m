import 'package:flutter/material.dart';

class AvailabilityProvider with ChangeNotifier {
  bool _asSoonAsPossible = true;
  DateTime _selectedDate = DateTime.now();

  bool get asSoonAsPossible => _asSoonAsPossible;
  DateTime get selectedDate => _selectedDate;
  DateTime get nextMonth => DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day);

  void setAsSoonAsPossible(bool value) {
    _asSoonAsPossible = value;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}

extension DateTimeExtension on DateTime {
  String toShortDateString() {
    return "$day/$month/$year";
  }

}