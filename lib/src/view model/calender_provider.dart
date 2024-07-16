import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/toast_message.dart';
import 'package:intl/intl.dart';

class CalendarProvider extends ChangeNotifier {
  final toDayDate = DateTime.now();
  List<DateTime> selectedDates = [];
  List<DateTime> conformedDate = [];

  String checkingDate = '';
  String checkoutDate = '';

  void onSelected(selectedDay, context) {
    if (selectedDay.isBefore(toDayDate)) return;

    // when two selected they want select another one
    if (selectedDates.length >= 2) {
      selectedDates.clear();
    }

    if (selectedDates.isEmpty || selectedDates.length == 1) {
      selectedDates.add(selectedDay);
      selectedDates.sort();

      if (selectedDates.length >= 2) {
        final difference =
            selectedDates.last.difference(selectedDates[0]).inDays;

        if (difference > 27) {
          selectedDates.clear();
          toastmessege("Hotels can't be Booked for a maximum of 28 Days.");
        } else {
          // Add dates between the two selected dates to the list
          List<DateTime> betweenDates = [];
          DateTime currentDate = selectedDates[0];

          while (currentDate.isBefore(selectedDates[1])) {
            betweenDates.add(currentDate);
            currentDate = currentDate.add(Duration(days: 1));
          }
          betweenDates.add(selectedDates[1]); // add the end date
          if (betweenDates.length <= 28) {
            selectedDates = betweenDates;
          } else {
            selectedDates
                .clear(); // Remove the second date if the range is more than 28 days
          }
          final firstDay = DateFormat.d().format(selectedDates[0]);
          final lastDay = DateFormat.d().format(selectedDates.last);
          final firstmonth = DateFormat.MMM().format(selectedDates[0]);
          final lastMonth = DateFormat.MMM().format(selectedDates.last);
          final firstDayName = DateFormat.E().format(selectedDates[0]);
          final lastDayName = DateFormat.E().format(selectedDates.last);
          checkingDate = '$firstDayName $firstDay $firstmonth';
          checkoutDate = '$lastDayName $lastDay  $lastMonth';

        }
      }
    }
    notifyListeners();
  }
}