import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeaturesProvider extends ChangeNotifier {
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
          // toastmessege("Hotels can't be Booked for a maximum of 28 Days.");
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////// Location searching Provider ////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   final GeocodingService _geocodingService = GeocodingService();
//   String? currentAddress;
//   Position? currentPosition;
//   List<dynamic> searchResults = [];
//   List<String> recentLocationHistory = [];
//   String locationText = '';
//   bool isLoading = true;

//   // Handling Location permision from device
//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       print('Location services are disabled. Please enable the services');
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         print('Location permissions are denied');
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       print(
//           'Location permissions are permanently denied, we cannot request permissions.');
//       return false;
//     }
//     return true;
//   }

//   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   Future<void> getCurrentPosition() async {
//     isLoading = true;
//     notifyListeners();

//     print('current location');
//     final hasPermission = await _handleLocationPermission();
//     print('Has permission : ${hasPermission}');

//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       print('latutyrt ${position.latitude}');
//       currentPosition = position;
//       Timer(Duration(seconds: 2), () {
//         getAddressFromLatLng();
//       });
//       print("$isLoading");
//       isLoading = false;
//       print("$isLoading");
//     }).catchError((e) {
//       debugPrint(e);
//     });
//     notifyListeners();
//   }

// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   // Tarsalating log, lat to human readable language, Location Address
//   Future<void> getAddressFromLatLng() async {
//     print('current latitude ${currentPosition?.latitude}');
//     await placemarkFromCoordinates(
//             currentPosition!.latitude, currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       print(
//           'Latitude: ${currentPosition!.latitude} Longitude ${currentPosition!.longitude}');
//       Placemark place = placemarks[0];
//       currentAddress = '${place.street}, ${place.subLocality}, '
//           '${place.subAdministrativeArea}, ${place.postalCode}';
//       locationText = currentAddress ?? '';
//       notifyListeners();
//     }).catchError((e) {
//       debugPrint(e.toString());
//     });
//   }

// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   // on changed function in the search bar, this function will passing user input to Api service and list all the matching in the listview builder
//   void searchLocations(value) async {
//     if (value != null) {
//       final results = await _geocodingService.searchLocations(value);
//       searchResults = results;
//       notifyListeners();
//     }
//   }

// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   void setLocationText(locationName) {
//     locationText = locationName;
//     notifyListeners();
//   }

// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   void simulateLoading() async {
//     isLoading = true;

//     // Simulate a network call or any other asynchronous operation
//     await Future.delayed(Duration(seconds: 3));

//     isLoading = false;
//     notifyListeners();
//   }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
