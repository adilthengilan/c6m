import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _guests = [
    {
      "name": "Thalia Castillo",
      "guests": 3,
      "room": "215",
      "checkIn": "Jun 15, 2021",
      "checkOut": "Jun 19, 2021",
      "status": "Waiting",
      "Revenue": "\$640"
    },
    {
      "name": "Pat Reyes",
      "guests": 3,
      "room": "210",
      "checkIn": "Jun 12, 2021",
      "checkOut": "Jun 20, 2021",
      "status": "Arrived",
      "Revenue": "\$780"
    },
    {
      "name": "Regina Barnes",
      "guests": 1,
      "room": "150",
      "checkIn": "Jun 14, 2021",
      "checkOut": "Jun 26, 2021",
      "status": "Waiting",
      "Revenue": "\$540"
    },
    {
      "name": "Rowena Vega",
      "guests": 1,
      "room": "120",
      "checkIn": "Jun 14, 2021",
      "checkOut": "Jun 20, 2021",
      "status": "Waiting",
      "Revenue": "\$340"
    },
    {
      "name": "Chris Wade",
      "guests": 4,
      "room": "310",
      "checkIn": "Jun 02, 2021",
      "checkOut": "Jun 12, 2021",
      "status": "Leave",
      "Revenue": "\$940"
    },
    {
      "name": "Vittorio Rizzo",
      "guests": 2,
      "room": "212",
      "checkIn": "Jun 08, 2021",
      "checkOut": "Jun 29, 2021",
      "status": "Arrived",
      "Revenue": "\$780"
    },
    {
      "name": "Edda Galino",
      "guests": 2,
      "room": "230",
      "checkIn": "Jun 10, 2021",
      "checkOut": "Jun 30, 2021",
      "status": "Arrived",
      "Revenue": "\$780"
    },
    {
      "name": "Adolf Althaus",
      "guests": 4,
      "room": "312",
      "checkIn": "Jun 10, 2021",
      "checkOut": "Jun 12, 2021",
      "status": "Leave",
      "Revenue": "\$140"
    },
    {
      "name": "Thalia Castillo",
      "guests": 3,
      "room": "215",
      "checkIn": "Jun 15, 2021",
      "checkOut": "Jun 19, 2021",
      "status": "Waiting",
      "Revenue": "\$640"
    },
  ];

  List<Map<String, dynamic>> _filteredGuests = [];

  BookingProvider() {
    _filteredGuests = List.from(_guests);
  }

  List<Map<String, dynamic>> get guests => _filteredGuests;

  void filterGuests(String filter) {
    if (filter == 'All') {
      _filteredGuests = _guests;
    } else {
      _filteredGuests =
          _guests.where((guest) => guest['status'] == filter).toList();
    }
    notifyListeners();
  }

  void addBooking(Map<String, dynamic> newBooking) {
    _guests.add(newBooking);
    _filteredGuests = List.from(_guests);
    notifyListeners();
  }
}
