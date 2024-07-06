import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/view%20model/booking_details.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildGuestInfo(height, width),
                  // SizedBox(height: 20),
                  _buildCurrentBooking(bookingProvider, height, width),
                ],
              ),
              SizedBox(height: 20),
              _buildHistoryBooking(bookingProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuestInfo(height, width) {
    return Container(
      width: width * 0.180,
      height: height * 0.50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.05),
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
                      EdgeInsets.only(left: width * 0.02, top: height * 0.04),
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
                      sizedBox(height * 0.01, width),
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

  Widget _buildCurrentBooking(bookingProvider, height, width) {
    final currentBooking = bookingProvider.currentBooking;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Booking',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Booking ID: ${currentBooking['bookingId']}',
                            style: GoogleFonts.montserrat(
                                fontSize: 11,
                                color: Color.fromARGB(254, 77, 14, 84),
                                fontWeight: FontWeight.w400)),
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
                    Text('Room Capacity'),
                    Text('${currentBooking['capacity']}')
                  ],
                ),
                sizedBox(height * 0.01, width * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bed Type '),
                    Text('${currentBooking['bedType']}')
                  ],
                ),
                sizedBox(height * 0.01, width * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bed Type'),
                    Text('${currentBooking['bedType']}')
                  ],
                ),
                sizedBox(height * 0.01, width * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Booking Date"), Text("Octo 25th-28th 2020")],
                )
              ],
            ),
            SizedBox(height: 10),
            Text('Room Facilities:'),
            // Wrap(
            //   spacing: 8.0,
            //   children: currentBooking['facilities'].map<Widget>((facility) {
            //     return Chip(label: Text(facility));
            //   }).toList(),
            // ),
            SizedBox(height: 10),
            Text('Images:', style: TextStyle(fontWeight: FontWeight.bold)),
            // Add images here
            Row(
              children: [
                Image.asset('assets/room1.jpg'),
                Image.asset('assets/room2.jpg'),
                Image.asset('assets/room3.jpg'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryBooking(BookingdetailsProvider bookingProvider) {
    final historyBooking = bookingProvider.historyBooking;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('History Booking',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ...historyBooking.map((booking) {
          return Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Room Name: ${booking['roomName']}'),
                  Text('Bed Type: ${booking['bedType']}'),
                  Text('Room Floor: ${booking['roomFloor']}'),
                  Text('Book Date: ${booking['bookDate']}'),
                  SizedBox(height: 10),
                  Text('Room Facilities:'),
                  Wrap(
                    spacing: 8.0,
                    children: booking['facilities'].map<Widget>((facility) {
                      return Chip(label: Text(facility));
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
