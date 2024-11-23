import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/booking_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_management_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/rooms_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class Expenses_Page_Accnt extends StatefulWidget {
  const Expenses_Page_Accnt({super.key});

  @override
  State<Expenses_Page_Accnt> createState() => _Expenses_Page_AccntState();
}

class _Expenses_Page_AccntState extends State<Expenses_Page_Accnt> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: width * 0.82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.04, 0.0),
            Row(
              children: [
                // ======================================== Tab Buttons [All Guests] [Pending] [Booked] [Canceled] [Refund] =====================================
                CustomContainer(
                  height: height * 0.051,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: width * 0.02),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: true,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Consumer<GuestManagementProvider>(
                        builder: (context, person, child) => InkWell(
                          onTap: () {
                            person.settabButtonIndex(index);
                          },
                          child: CustomContainer(
                            height: height,
                            borderRadius: BorderRadius.circular(10),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            boxShadow: false,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    index == 0
                                        ? 'Expenses'
                                        : index == 1
                                            ? 'Paid'
                                            : 'Pending',
                                    style: index == 0
                                        ? smallTextStyleBold
                                        : smallTextStyle),
                                sizedBox(height * 0.01, 0.0),
                                CustomContainer(
                                  width: width * 0.06,
                                  height: height * 0.005,
                                  borderRadius: BorderRadius.circular(10),
                                  gradiantColors:
                                      index == person.tabButtonSelectedIndex
                                          ? [
                                              Colors.lightBlueAccent.shade200,
                                              Colors.cyanAccent.shade200
                                            ]
                                          : [
                                              Colors.transparent,
                                              Colors.transparent
                                            ],
                                  boxShadow: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBox(0.0, width * 0.02),
                //======================================================= Search bar Side of The Tab Button ==================================================
                CustomContainer(
                  height: height * 0.051,
                  width: width * 0.25,
                  color: Colors.white,
                  boxShadow: true,
                  borderRadius: BorderRadius.circular(10),
                  child: Consumer<GuestManagementProvider>(
                    builder: (context, person, child) => CustomTextField(
                      labelText: 'Search here',
                      controller: person.guestSearchController,
                      borderRadius: 20,
                      borderSide: BorderSide.none,
                      suffixIcon: const Icon(Icons.search, color: Colors.blue),
                    ),
                  ),
                ),
                sizedBox(0.0, width * 0.02),
                buildActionButton(context, 'Add Expenses', Icons.sort,
                    Color.fromARGB(255, 219, 255, 160), () {
                  _showSortOptions(context);
                }),
              ],
            ),
            sizedBox(height * 0.03, 0.0),
            //========================================================================= Guest List ==============================================================
            CustomContainer(
              width: width * 0.78,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              margin: EdgeInsets.only(
                  left: width * 0.02,
                  right: width * 0.006,
                  bottom: height * 0.04),
              boxShadow: true,
              child: Column(
                children: [
                  CustomContainer(
                    boxShadow: false,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    height: height * 0.06,
                    border: BorderDirectional(
                        bottom: BorderSide(color: Colors.grey.shade200)),
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? width * 0.015 : 0),
                          child: SizedBox(
                              width: index == 0
                                  ? width * 0.26
                                  : index == 1
                                      ? width * 0.1
                                      : index == 2
                                          ? width * 0.1
                                          : index == 3
                                              ? width * 0.22
                                              : width * 0.06,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      index == 0
                                          ? 'Expense'
                                          : index == 1
                                              ? ''
                                              : index == 2
                                                  ? 'Amount'
                                                  : index == 3
                                                      ? ''
                                                      : 'Status',
                                      style: smallTextStyleBold))),
                        ),
                      ),
                    ),
                  ),
                  Consumer<BookingProvider>(
                    builder: (context, value, child) => ListView.builder(
                      itemCount: value.expenses.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, builderIndex) => CustomContainer(
                        width: width,
                        padding: EdgeInsets.only(left: width * 0.004),
                        border: BorderDirectional(
                            bottom: BorderSide(color: Colors.grey.shade100)),
                        color: backgroundColor,
                        boxShadow: true,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.27,
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              child: Row(
                                children: [
                                  sizedBox(0.0, width * 0.006),
                                  Consumer2<GuestManagementProvider,
                                      BookingProvider>(
                                    builder: (context, person, value, child) =>
                                        Checkbox(
                                      value: builderIndex ==
                                              person.guestSelectedIndex
                                          ? true
                                          : false,
                                      onChanged: (value) {
                                        person.setSelectGuestIndex(value);
                                      },
                                      activeColor: Colors.cyanAccent,
                                      checkColor: Colors.white,
                                    ),
                                  ),
                                  sizedBox(0.0, width * 0.01),
                                  // CustomContainer(
                                  //   height: height * 0.1,
                                  //   width: width * 0.11,
                                  //   color: Colors.grey.shade100,
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   boxShadow: false,
                                  // ),
                                  Text(
                                      '${value.expenses[builderIndex]['expense']}'),
                                  sizedBox(0.0, width * 0.01),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('', style: smallTextStyle),
                                      sizedBox(height * 0.01, 0.0),
                                      SizedBox(
                                          width: width * 0.1,
                                          child: Text('',
                                              style: smallTextStyleBold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => Container(
                                    width:
                                        index == 2 ? width * 0.22 : width * 0.1,
                                    padding: EdgeInsets.only(
                                        right: index == 2
                                            ? width * 0.02
                                            : width * 0.01),
                                    child: Text(
                                        index == 0
                                            ? builderIndex == 0
                                                ? ''
                                                : ''
                                            : index == 1
                                                ? ''
                                                : '${value.expenses[builderIndex]['amount']}',
                                        style: smallTextStyle)),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.06,
                              child: Consumer<RoomsProvider>(
                                builder: (context, person, child) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      builderIndex == 0 || builderIndex == 2
                                          ? 'Pending'
                                          : 'Paid',
                                      style: GoogleFonts.montserrat(
                                          color: builderIndex == 0 ||
                                                  builderIndex == 2
                                              ? Colors.red
                                              : Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    builderIndex == 0 || builderIndex == 2
                                        ? Text('Oct 24 - 28',
                                            style: smallTextStyle)
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildActionButton(BuildContext context, String label, IconData icon,
    Color color, VoidCallback onPressed) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextButton.icon(
      icon: Icon(icon, size: 12, color: Colors.black),
      label: Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onPressed: onPressed,
    ),
  );
}

void _showSortOptions(BuildContext context) {
  final expense = TextEditingController();
  final amount = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return Consumer<BookingProvider>(
        builder: (context, value, child) => AlertDialog(
          title: Text('Add Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Expense'),
                controller: expense,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Amount'),
                controller: amount,
              ),
              // _buildSortOption(context, bookingProvider, 'Paid'),
              // _buildSortOption(context, bookingProvider, 'Pending'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final data = {'expense': expense.text, 'amount': amount.text};
                value.saveData(data);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      );
    },
  );
}

List<dynamic> expenses = [];
