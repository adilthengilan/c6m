import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/accounts_management_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class AccountsManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final accountsProvider = Provider.of<AccountsManagementProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text('Dashboard', style: mediumTextStyleBold),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            height: height,
            width: 250,
            color: Colors.grey.shade50,
            boxShadow: false,
            child: Column(
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.02,
                          left: width * 0.01,
                          right: width * 0.01,
                        ),
                        child: Consumer<AccountsManagementProvider>(
                          builder: (context, person, child) => CustomContainer(
                            boxShadow: false,
                            width: width,
                            height: height * 0.06,
                            color: index == person.navigationButtons
                                ? Colors.purpleAccent.shade100
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                                onPressed: () {
                                  person.setNavigationIndex(index);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      person.navigationButtons == index
                                          ? MainAxisAlignment.center
                                          : MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      index == 0
                                          ? Icons.space_dashboard_outlined
                                          : Icons.history_outlined,
                                      color: index == person.navigationButtons
                                          ? Colors.white
                                          : Colors.deepPurple,
                                    ),
                                    sizedBox(0.0, width * 0.01),
                                    Text(
                                        index == 0
                                            ? 'Dashboard'
                                            : 'Transactions',
                                        style: index == person.navigationButtons
                                            ? smallTextStylewhiteBold
                                            : smallTextStyle),
                                  ],
                                )),
                          ),
                        ),
                      )),
            ),
          ),
          accountsManagementDashBoard(height, width, context),
        ],
      ),
    );
  }

  Expanded accountsManagementDashBoard(
      double height, double width, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            sizedBox(height * 0.03, width),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  sizedBox(0.0, width * 0.038),
                  _buildSummaryCard(
                      'Daily Revenue', '\$12,345,000', height, width),
                  sizedBox(0.0, width * 0.025),
                  _buildSummaryCard(
                      'Outstanding Balance', '\$321,000', height, width),
                  sizedBox(0.0, width * 0.025),
                  _buildSummaryCard(
                      'Total Expenses', '\$56,7800', height, width),
                  sizedBox(0.0, width * 0.038),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // physics: const NeverScrollableScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  sizedBox(0.0, width * 0.02),
                  _buildStatusCard(width, 'Today Bookings', 0.8, '80', '7,541',
                      Colors.yellow.shade400, context, () {}, 0),
                  sizedBox(0.0, width * 0.03),
                  _buildStatusCard(width, 'Cancelled Bookings', 0.68, '68',
                      '2,541', Colors.greenAccent, context, () {}, 1),
                  sizedBox(0.0, width * 0.03),
                  _buildStatusCard(width, 'Check-In', 0.39, '39', '1,154',
                      Colors.orangeAccent.shade200, context, () {}, 2),
                  sizedBox(0.0, width * 0.03),
                  _buildStatusCard(width, 'Check-Out', 0.95, '95', '95',
                      Colors.blueGrey.shade300, context, () {}, 3),
                  sizedBox(0.0, width * 0.02),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.white,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Revenue & Expense Report',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      _buildListTile('Total Revenue', '\$120,000'),
                      _buildListTile('Total Expenses', '\$80,000'),
                      _buildListTile('Net Profit', '\$40,000'),
                    ],
                  ),
                ),
              ),
            ),
            sizedBox(height * 0.06, width),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(
      width,
      String title,
      double progress,
      String count,
      String mobile,
      Color color,
      BuildContext context,
      VoidCallback onPressed,
      int index) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: smallTextStyleBold),
            sizedBox(30, 0.0),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 110,
                    width: 110,
                    child: CircularProgressIndicator(
                      value: progress,
                      color: color,
                      backgroundColor: Colors.grey.shade100,
                      strokeWidth: 5,
                    ),
                  ),
                  Text(
                    '${count}%',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(30, 00),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onPressed: onPressed,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('View All Data', style: smallTextStylewhite),
                  )),
            ),
            sizedBox(40, 00),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Paid', style: smallTextStyle),
                      sizedBox(5, 0),
                      Text(mobile, style: smallTextStyleBold),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Not Paid', style: smallTextStyle),
                      sizedBox(5, 0),
                      Text(count, style: smallTextStyleBold),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, height, width) {
    return Card(
      child: CustomContainer(
        width: width / 5,
        boxShadow: false,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade100),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(amount, style: TextStyle(fontSize: 22, color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: Text(value, style: smallTextStyleBold),
    );
  }
}
