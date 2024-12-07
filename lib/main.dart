import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/app_router.dart';
import 'package:tuch_trip_crms/layouting.dart';
import 'package:tuch_trip_crms/src/db_connecting.dart';
import 'package:tuch_trip_crms/src/view%20model/account_registration.dart';
import 'package:tuch_trip_crms/src/view%20model/accounts_management_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_details.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/fetching_details.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_detailes_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/rooms_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_management_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/account_registration.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/accounts_management_screen.dart';
import 'package:tuch_trip_crms/src/view/desktop/admin_homePage/admin_homepage.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';

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
        ChangeNotifierProvider(create: (context) => DBConnecting()),
        ChangeNotifierProvider<accountRegistration>(create: (context) => accountRegistration()),
        ChangeNotifierProvider(create: (context) => AccountsManagementProvider()),
        ChangeNotifierProvider(create: (context) => PayrollProvider()),
        ChangeNotifierProvider<fetchingHotelsDetails>(create: (context) => fetchingHotelsDetails())
      ],
      child: MaterialApp.router(
        title: 'tuchtrip-customer relationship management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        // routerConfig: router,
        routeInformationParser: MyAppRoutes().router.routeInformationParser,
        routeInformationProvider: MyAppRoutes().router.routeInformationProvider,
        routerDelegate: MyAppRoutes().router.routerDelegate,
        // routeInformationProvider: PlatformRouteInformationProvider(
        //     initialRouteInformation: RouteInformation(location: '/')),
        // routeInformationParser: MyAppRouter().router.routeInformationParser,
        // routerDelegate: MyAppRouter().router.routerDelegate,
      ),
    );
  }
}

class MyAppRoutes {
  final router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
            name: 'home',
            path: "/",
            pageBuilder: (context, state) {
              return MaterialPage(child: Layouting());
            }),
        GoRoute(
          name: 'register',
          path: "/register",
          builder: (context, state) => AccountRegistrationScreen(),
        ),
        GoRoute(
            name: 'login',
            path: "/login",
            pageBuilder: (context, state) {
              return MaterialPage(child: AccountRegistrationScreen());
            }),
        GoRoute(
            name: 'receptionDashboard',
            path: "/reception",
            pageBuilder: (context, state) {
              return MaterialPage(child: HomePage());
            }),
        GoRoute(
            name: 'accountsDashboard',
            path: '/accounts',
            pageBuilder: (context, state) {
              return MaterialPage(child: AccountsManagementScreen());
            }),
        GoRoute(
            name: 'Admin',
            path: '/admin',
            pageBuilder: (context, state) {
              return MaterialPage(child: Admin_HomePage());
            }),
      ],
      routerNeglect: true);
}
