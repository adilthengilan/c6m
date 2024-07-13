import 'package:flutter/material.dart';
import 'package:flutter_application_1/layouting.dart';
import 'package:flutter_application_1/src/view%20model/availability_provider.dart';
import 'package:flutter_application_1/src/view%20model/booking_details.dart';
import 'package:flutter_application_1/src/view%20model/booking_provider.dart';
import 'package:flutter_application_1/src/view%20model/dashboard_provider.dart';
import 'package:flutter_application_1/src/view%20model/guest_management.dart';
import 'package:flutter_application_1/src/view%20model/login_provider.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view%20model/rooms_provider.dart';
import 'package:flutter_application_1/src/view/desktop/Login/login_screen.dart';
import 'package:flutter_application_1/src/view/desktop/New%20bookings/new_booking.dart';
import 'package:provider/provider.dart';

void main() {
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
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context) => BookingdetailsProvider()),
        ChangeNotifierProvider(create: (context) => GuestManagementProvider()),
        ChangeNotifierProvider(create: (context) => RoomsProvider()),
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => AvailabilityProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
