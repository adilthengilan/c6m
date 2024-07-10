import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/view%20model/booking_details.dart';
import 'package:flutter_application_1/src/view%20model/booking_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final bookingProvider = Provider.of<BookingdetailsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Row(
                  children: [
                    Text(
                      "Guests",
                      style: smallTextStyle,
                    ),
                    Text(
                      "/ Keanu",
                      style: smallTextStyle,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //------------------------------------User Profile -------------------------------------------
                  _buildGuestInfo(height, width),
                  sizedBox(height * 0.01, width * 0.01),
                  //---------------------------------------User Current booking details------------------------
                  _buildCurrentBooking(bookingProvider, height, width),
                ],
              ),
              sizedBox(height * 0.02, width),
              //___________-----------------------------User booking history -----------------------------------
              _buildHistoryBooking(bookingProvider, height, width),
            ],
          ),
        ),
      ),
    );
  }

  //************************************************************************************************************************************************** */
//----------------------------------------------------User profile widget -------------------------------------
  Widget _buildGuestInfo(height, width) {
    return Container(
      width: width * 0.180,
      height: height * 0.50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(-0.3, 1),
            blurRadius: 2,
            blurStyle: BlurStyle.normal,
            spreadRadius: 0,
            color: Color.fromARGB(255, 176, 176, 176)),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                  'assets/profile.jpg'), // Add a profile image in assets
            ),
            sizedBox(height * 0.01, width),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '#GS-2234',
                  style: GoogleFonts.montserrat(
                      fontSize: 11,
                      color: Color.fromARGB(254, 77, 14, 84),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Keanu Repes',
                  style: smallTextStyleBold,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.05),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            size: 12,
                          ),
                          sizedBox(height * 0.01, width * 0.01),
                          Text(
                            '+12 3456 678',
                            style: smallTextStyle,
                          ),
                        ],
                      ),
                      sizedBox(height * 0.02, width),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 12,
                          ),
                          sizedBox(height * 0.01, width * 0.01),
                          Text('keanurepes@mail.com', style: smallTextStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//----------------------------------------------------------------User current booking details--------------------------------------------------
  Widget _buildCurrentBooking(bookingProvider, height, width) {
    final currentBooking = bookingProvider.currentBooking;

    return Container(
      height: height * 0.50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(-0.3, 1),
            blurRadius: 2,
            blurStyle: BlurStyle.normal,
            spreadRadius: 0,
            color: Color.fromARGB(255, 176, 176, 176)),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Booking',
              style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            sizedBox(height * 0.03, width * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 85, 18, 125),
                    ),
                    sizedBox(height * 0.01, width * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Booking ID: ${currentBooking['bookingId']}',
                            style: GoogleFonts.montserrat(
                                fontSize: 11,
                                color: Color.fromARGB(254, 77, 14, 84),
                                fontWeight: FontWeight.w600)),
                        Text(
                          "Queen Room Deluxe A09224",
                          style: smallTextStyleBold,
                        ),
                      ],
                    ),
                  ],
                ),
                sizedBox(height * 0.01, width * 0.10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Room Capacity',
                        style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Color.fromARGB(253, 208, 208, 208),
                            fontWeight: FontWeight.w600)),
                    Text(
                      '${currentBooking['capacity']}',
                      style: smallTextStyleBold,
                    )
                  ],
                ),
                sizedBox(height * 0.01, width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bed Type ',
                        style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Color.fromARGB(253, 208, 208, 208),
                            fontWeight: FontWeight.w600)),
                    Text(
                      '${currentBooking['bedType']}',
                      style: smallTextStyleBold,
                    )
                  ],
                ),
                sizedBox(height * 0.01, width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Booking Date",
                        style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Color.fromARGB(253, 208, 208, 208),
                            fontWeight: FontWeight.w600)),
                    Text(
                      "Octo 25th-28th 2020",
                      style: smallTextStyleBold,
                    )
                  ],
                )
              ],
            ),
            sizedBox(height * 0.04, width * 0.01),
            Row(
              children: [
                Text(
                  'Room Facilities',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                sizedBox(height * 0.01, width * 0.01),
                Icon(
                  Icons.info_outline,
                  size: 15,
                  color: Color.fromARGB(255, 255, 208, 65),
                )
              ],
            ),
            sizedBox(height * 0.03, width * 0.01),

            // Add images here
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: height * 0.20,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Room1.jpg"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  sizedBox(height * 0.01, width * 0.01),
                  Container(
                    height: height * 0.20,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Room2.jpg"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  sizedBox(height * 0.01, width * 0.01),
                  Container(
                    height: height * 0.20,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/Room3.jpg",
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  sizedBox(height * 0.01, width * 0.01),
                  Container(
                    height: height * 0.20,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Room4.jpg"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
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

//---------------------------------------------------User history
  Widget _buildHistoryBooking(
      BookingdetailsProvider bookingProvider, height, width) {
    final historyBooking = bookingProvider.historyBooking;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
      child: Container(
        width: width * 0.930,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(-0.3, 1),
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              spreadRadius: 0,
              color: Color.fromARGB(255, 176, 176, 176)),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.02, top: height * 0.03, bottom: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'History Booking',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  sizedBox(height * 0.01, width * 0.60),
                  Container(
                    height: height * 0.05,
                    width: width * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(08),
                        color: Color.fromARGB(255, 155, 233, 255)),
                    child: Center(
                      child: Text(
                        'Date Filter',
                        style: smallTextStyleBold,
                      ),
                    ),
                  ),
                  sizedBox(height * 0.01, width * 0.01),
                  Container(
                    height: height * 0.05,
                    width: width * 0.09,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(08),
                        color: Color.fromARGB(255, 255, 114, 175)),
                    child: Center(
                      child: Text(
                        'Generate Report',
                        style: smallTextStyleBold,
                      ),
                    ),
                  ),
                ],
              ),
              sizedBox(height * 0.01, width),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  dataRowHeight: height * 0.10,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Room Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                    DataColumn(
                        label: Text(
                      'Bed Type',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    )),
                    DataColumn(
                        label: Text(
                      'Room Floor',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    )),
                    DataColumn(
                        label: Text(
                      'Room Facility',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    )),
                    DataColumn(
                        label: Text(
                      'Book Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ],
                  rows: List<DataRow>.generate(historyBooking.length, (index) {
                    final booking = historyBooking[index];
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Row(
                          children: [
                            Container(
                              height: height * 0.08,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      booking['image'] ??
                                          'assets/images/Room3.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            sizedBox(height * 0.01, width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '#${index + 1}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 11,
                                      color: Color.fromARGB(254, 77, 14, 84),
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  booking['roomName'] ?? '',
                                  style: smallTextStyle,
                                ),
                              ],
                            ),
                          ],
                        )),
                        DataCell(Text(
                          booking['bedType'] ?? '',
                          style: smallTextStyle,
                        )),
                        DataCell(Text(
                          booking['roomFloor'] ?? '',
                          style: smallTextStyle,
                        )),
                        DataCell(Text(
                          (booking['facilities'] as List<dynamic>).join(', ') ??
                              '',
                          style: smallTextStyle,
                        )),
                        DataCell(Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking['bookDate'] ?? '',
                              style: smallTextStyle,
                            ),
                            Text(
                              booking['bookTime'] ?? '',
                              style: smallTextStyle,
                            ),
                          ],
                        )),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
