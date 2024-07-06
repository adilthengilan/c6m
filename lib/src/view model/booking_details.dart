import 'package:flutter/material.dart';

class BookingdetailsProvider extends ChangeNotifier {
  final Map<String, dynamic> currentBooking = {
    'bookingId': '#0052466623',
    'roomType': 'Queen Room Deluxe A09244',
    'capacity': '3-5 Person',
    'bedType': 'Double',
    'bookingDate': 'Oct 25th - 28th, 2020',
    'facilities': ['AC', 'Shower', 'Double Bed', 'Towel', 'Bathtub', 'Coffee Set', 'LED TV', 'Wifi'],
  };

  final List<Map<String, dynamic>> historyBooking = [
    {
      'roomName': 'Queen A-0001',
      'bedType': 'Single Bed',
      'roomFloor': 'Floor G-05',
      'facilities': ['AC', 'Shower', 'Double Bed', 'Towel', 'Bathtub', 'Coffee Set', 'LED TV', 'Wifi'],
      'bookDate': 'Oct 29th, 2020',
    },
    {
      'roomName': 'Deluxe B-0023',
      'bedType': 'Double Bed',
      'roomFloor': 'Floor G-08',
      'facilities': ['AC', 'Shower', 'Double Bed', 'Towel', 'Bathtub', 'Coffee Set', 'LED TV', 'Wifi'],
      'bookDate': 'Nov 1st, 2020',
    },
  ];
}
