import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/accounts_management_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/history.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/invoices.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/tax_screen.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class AccountsManagementScreen extends StatefulWidget {
  @override
  State<AccountsManagementScreen> createState() =>
      _AccountsManagementScreenState();
}

class _AccountsManagementScreenState extends State<AccountsManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String heading = 'Dashboard';
    // final accountsProvider = Provider.of<AccountsManagementProvider>(context,listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: SizedBox(),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(heading, style: mediumTextStyleBold),
        ),
        body: DashBoard_Screen_accnts());
  }
}
