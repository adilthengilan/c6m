import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_management_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

import '../../widgets/custom_textfield.dart';

class Tax_Screen_accnts extends StatefulWidget {
  const Tax_Screen_accnts({super.key});

  @override
  State<Tax_Screen_accnts> createState() => _Tax_Screen_accntsState();
}

class _Tax_Screen_accntsState extends State<Tax_Screen_accnts> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '   Tax Details',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        sizedBox(height * 0.02, 0.0),
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
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        boxShadow: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                index == 0
                                    ? 'Tax Details'
                                    : index == 1
                                        ? 'Account Details'
                                        : 'Company Details',
                                style: index == 0
                                    ? smallTextStyleBold
                                    : smallTextStyle),
                            sizedBox(height * 0.01, 0.0),
                            CustomContainer(
                              width: width * 0.06,
                              height: height * 0.005,
                              borderRadius: BorderRadius.circular(10),
                              gradiantColors: index ==
                                      person.tabButtonSelectedIndex
                                  ? [
                                      Colors.lightBlueAccent.shade200,
                                      Colors.cyanAccent.shade200
                                    ]
                                  : [Colors.transparent, Colors.transparent],
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
          ],
        ),
        sizedBox(height * 0.02, 0.0),
        Container(
          margin: EdgeInsets.only(left: width * 0.02, top: height * 0.01),
          width: width / 1.5,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox(height * 0.04, 0.0),
              Row(
                children: [
                  sizedBox(0.0, width * 0.01),
                  Text(
                    'Tax Details',
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  sizedBox(0.0, width / 1.9),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[200]),
                      child: Center(
                        child: Text('Edit'),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Container(
                margin: EdgeInsets.only(left: width * 0.02, top: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tax Number',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        Text(
                          '1526356452563',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        sizedBox(height * 0.03, 0.0),
                        Text(
                          'Holder Name',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        Text(
                          'John',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        sizedBox(height * 0.03, 0.0),
                        Text(
                          'Country',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        Text(
                          'Dubai',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        sizedBox(height * 0.03, 0.0),
                      ],
                    ),
                    sizedBox(0.0, width * 0.2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact No.',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        Text(
                          '+971 123456',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        sizedBox(height * 0.03, 0.0),
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        Text(
                          'example@gmail.com',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        sizedBox(height * 0.03, 0.0),
                        // Text(
                        //   'Country',
                        //   style: GoogleFonts.poppins(color: Colors.grey),
                        // ),
                        // Text(
                        //   'Dubai',
                        //   style: GoogleFonts.poppins(
                        //       color: const Color.fromARGB(255, 0, 0, 0),
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500),
                        // )
                      ],
                    ),
                    sizedBox(0.0, width * 0.1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Contact No.',
                        //   style: GoogleFonts.poppins(color: Colors.grey),
                        // ),
                        // Text(
                        //   '+971 123456',
                        //   style: GoogleFonts.poppins(
                        //       color: const Color.fromARGB(255, 0, 0, 0),
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500),
                        // ),
                        // sizedBox(height * 0.03, 0.0),
                        Text(
                          'Tax Percentage',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        Text(
                          '15%',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        sizedBox(height * 0.03, 0.0),
                        // Text(
                        //   'Country',
                        //   style: GoogleFonts.poppins(color: Colors.grey),
                        // ),
                        // Text(
                        //   'Dubai',
                        //   style: GoogleFonts.poppins(
                        //       color: const Color.fromARGB(255, 0, 0, 0),
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500),
                        // )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
