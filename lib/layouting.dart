import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/layout_builder.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';

class Layouting extends StatefulWidget {
  const Layouting({super.key});

  @override
  State<Layouting> createState() => _HomePageState();
}

class _HomePageState extends State<Layouting> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      setState(() {});
    }

    return Scaffold(
      body: ResponsiveLayout(
          DesktopView: DesktopView(),
          MobileViews: MobileView(),
          TabView: TabView()),
    );
  }
}

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
