import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return DashBoard();
  }
}