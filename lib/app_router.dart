import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuch_trip_crms/layouting.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/account_registration.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/accounts_management_screen.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'dart:html' as html;

class MyAppRouteContants {
  static const String HomeRouteName = 'landingPage';
  static const String LoginRouteName = 'login';

  static const String RegisterRouteName = 'register';

  static const String ReceptionRouteName = 'reception';
}

void need_refreshPage() {
  html.window.location.reload();
}
