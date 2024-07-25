import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/layouting.dart';
import 'package:tuch_trip_crms/src/db_connecting.dart';
import 'package:tuch_trip_crms/src/view%20model/availability_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_details.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_detailes_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/rooms_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_management_provider.dart';

Future<void> main() async {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
        ChangeNotifierProvider(create: (context) => GuestManagementProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context) => BookingdetailsProvider()),
        ChangeNotifierProvider(create: (context) => RoomsProvider()),
        ChangeNotifierProvider(create: (context) => GuestDetailesProvider()),
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => GuestManagementProvider()),
        ChangeNotifierProvider(create: (context) => RoomsProvider()),
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => AvailabilityProvider()),
        ChangeNotifierProvider(create: (context) => DBConnecting())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: Layouting(),
      ),
    );
  }
}
