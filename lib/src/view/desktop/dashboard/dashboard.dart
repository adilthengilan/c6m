import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:iconly/iconly.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.02, 0.0),
            menuButtons(height, width),
            sizedBox(height * 0.03, width * 0.6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          availableRoomsTodayPesentage(width, height),
                          sizedBox(0.0, width * 0.015),
                          checkInandCheckOutpersentageStatus(height, width),
                          sizedBox(0.0, width * 0.015)
                        ],
                      ),
                      sizedBox(height * 0.03, 0.0),
                      reviewsList(height, width),
                    ],
                  ),
                  Column(
                    children: [
                      bookedRoomsTodayStatus(height, width),
                      sizedBox(height, 0.0)
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

//=======================================================================================================================
//======================================== Side Menu Buttons ============================================================
//=======================================================================================================================
  Row menuButtons(double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) {
          final boxButtons = [
            {
              'icon': IconlyLight.bookmark,
              'color': Colors.purpleAccent.shade100,
              'text': 'New Bookings',
              'ontap': () {},
            },
            {
              'icon': IconlyLight.calendar,
              'color': Colors.greenAccent.shade100,
              'text': 'Schedule Room',
              'ontap': () {},
            },
            {
              'icon': Icons.logout_outlined,
              'color': Colors.orangeAccent.shade100,
              'text': 'Check-In',
              'ontap': () {},
            },
            {
              'icon': Icons.login_outlined,
              'color': Colors.pinkAccent.shade100,
              'text': 'Check-Out',
              'ontap': () {},
            },
          ];
          return Padding(
            padding: EdgeInsets.only(right: width * 0.0335),
            child: !isLoading
                ? CustomContainer(
                    height: height * 0.18,
                    width: width * 0.17,
                    color: boxButtons[index]['color'] as Color,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.035,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('872', style: largeTextStyleBold),
                            sizedBox(height * 0.01, 0.0),
                            Text(boxButtons[index]['text'] as String,
                                style: smallTextStyleBold)
                          ],
                        ),
                        Icon(
                          boxButtons[index]['icon'] as IconData,
                          color: Colors.black,
                          size: height * 0.06,
                        ),
                      ],
                    ),
                  )
                : LoadingWidget(
                    height: height * 0.2,
                    width: width * 0.17,
                  ),
          );
        },
      ),
    );
  }

//====================================================================================================================
//=================================== Available Rooms Today Persentage ===============================================
//====================================================================================================================
//====================================================================================================================
  Widget availableRoomsTodayPesentage(double width, double height) {
    return !isLoading
        ? CustomContainer(
            width: width * 0.18,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: height * 0.03),
            borderRadius: BorderRadius.circular(15),
            boxShadow: true,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                  width: width * 0.07,
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                        'assets/images/Screenshot 2024-07-02 164934.png'),
                  ),
                ),
                sizedBox(height * 0.01, 0.0),
                Text('785', style: largeTextStyleBold),
                sizedBox(height * 0.006, 0.0),
                Text('Available Rooms Today', style: smallTextStyle),
              ],
            ),
          )
        : LoadingWidget(
            height: height * 0.245,
            width: width * 0.18,
          );
  }

//=======================================================================================================================
//================================= Check-In and Check-Out Persentage Status ============================================
//=======================================================================================================================
//=======================================================================================================================
  Widget checkInandCheckOutpersentageStatus(double height, double width) {
    return !isLoading
        ? CustomContainer(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.02,
            ),
            boxShadow: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                2,
                (index) {
                  final indicators = [
                    {
                      'color': Colors.deepPurple,
                      'persentage': '70 %',
                      'text': 'Check-In',
                      'value': 8 / 10
                    },
                    {
                      'color': Colors.orangeAccent[400],
                      'persentage': '30 %',
                      'text': 'Check-Out',
                      'value': 3 / 10,
                    },
                  ];
                  return Row(
                    children: [
                      Container(
                        height: height * 0.2,
                        width: width * 0.1,
                        padding: EdgeInsets.all(height * 0.04),
                        child: CircularProgressIndicator(
                          color: indicators[index]['color'] as Color,
                          value: indicators[index]['value'] as double,
                          backgroundColor: Colors.grey.shade100,
                          strokeWidth: 15,
                        ),
                      ),
                      sizedBox(0.0, width * 0.01),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(indicators[index]['persentage'] as String,
                              style: largeTextStyleBold),
                          sizedBox(height * 0.01, 0.0),
                          Text(indicators[index]['text'] as String,
                              style: smallTextStyle),
                        ],
                      ),
                      index == 0
                          ? sizedBox(0.0, width * 0.03)
                          : sizedBox(0.0, width * 0.02)
                    ],
                  );
                },
              ),
            ),
          )
        : LoadingWidget(
            height: height * 0.245,
            width: width * 0.395,
          );
  }

//=======================================================================================================================
//===================================== Latest Costumer Reviews List ====================================================
//=======================================================================================================================
//=======================================================================================================================
  Widget reviewsList(double height, double width) {
    return Container(
      width: width * 0.585,
      padding: EdgeInsets.only(bottom: height * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Costumer Reviews',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          sizedBox(height * 0.02, 0.0),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: width * 0.002),
            shrinkWrap: true,
            itemBuilder: (context, index) => !isLoading
                ? CustomContainer(
                    width: width * 0.2,
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: height * 0.02),
                    padding: EdgeInsets.only(
                      left: width * 0.02,
                      top: height * 0.03,
                      bottom: height * 0.03,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: true,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: height * 0.03,
                                    backgroundColor: Colors.grey.shade200,
                                    child: Center(
                                      child: Text(
                                        'A', // Customer user Name First Letter
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  sizedBox(0.0, width * 0.01),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Aloika', // Customer User Name
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'March 2024', // Review Date And Month
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        sizedBox(0.0, width * 0.025),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.006,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.amber[400],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '4.6', // The Rating Value
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    sizedBox(0.0, width * 0.01),
                                    Text(
                                      'Exeptional', //Rating Status
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBox(height * 0.01, 0.0),
                                SizedBox(
                                  width: width * 0.425,
                                  child: Text(
                                    "Lovely hotel staff were excellent and very friendly. Good selection of food and beverage outlets. Comfortable rooms'"
                                    "with all amenities. 'Overall a very pleasant stay. Great place for a winter break, beach and pools were lovely. ",
                                    // The Review of User
                                    style: smallTextStyle,
                                  ),
                                ),
                                sizedBox(height * 0.02, 0.0),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: height * 0.015),
                    child: LoadingWidget(
                      height: height * 0.25,
                      width: width * 0.15,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

//=======================================================================================================================
//=================================== Booked Rooms Today status =========================================================
//=======================================================================================================================
  Widget bookedRoomsTodayStatus(double height, double width) {
    return !isLoading
        ? CustomContainer(
            width: width * 0.18,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.03,
            ),
            boxShadow: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Booked Room Today', style: smallTextStyleBold),
                sizedBox(height * 0.035, 0.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) {
                      final barProgress = [
                        {
                          'color': Colors.orangeAccent,
                          'value': 0.5,
                        },
                        {
                          'color': Colors.lightBlueAccent,
                          'value': 0.6,
                        },
                        {
                          'color': Colors.deepPurple,
                          'value': 0.4,
                        },
                      ];
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.03),
                        child: LinearProgressIndicator(
                          value: barProgress[index]['value'] as double,
                          minHeight: height * 0.015,
                          backgroundColor: Colors.grey.shade100,
                          color: barProgress[index]['color'] as Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) {
                      final todayUpdates = [
                        {
                          'color': Colors.orangeAccent,
                          'status': 'Pending',
                          'value': 287
                        },
                        {
                          'color': Colors.lightBlueAccent,
                          'status': 'Done',
                          'value': 135
                        },
                        {
                          'color': Colors.deepPurple,
                          'status': 'Finish',
                          'value': 35,
                        }
                      ];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  color: todayUpdates[index]['color'] as Color,
                                  size: height * 0.015),
                              sizedBox(0.0, width * 0.004),
                              Text(
                                todayUpdates[index]['status'] as String,
                                style: GoogleFonts.montserrat(fontSize: 10),
                              ),
                            ],
                          ),
                          sizedBox(height * 0.006, 0.0),
                          Text('${todayUpdates[index]['value']}',
                              style: smallTextStyleBold)
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : LoadingWidget(
            height: height,
            width: width * 0.18,
          );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////// Sized Box //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SizedBox sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////// Text Style /////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

final mediumTextStyleBold = GoogleFonts.montserrat(
    fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600);

final smallTextStyle = GoogleFonts.montserrat(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

final smallTextStylewhite = GoogleFonts.montserrat(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
final smallTextStylewhiteBold = GoogleFonts.montserrat(
  fontSize: 13,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

final smallTextStyleBold = GoogleFonts.montserrat(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

final largeTextStyleBold = GoogleFonts.montserrat(
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);
final bluetextStyle = GoogleFonts.montserrat(
  fontSize: 14,
  color: Colors.blueAccent,
  fontWeight: FontWeight.w500,
);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////// Colors /////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const Color backgroundColor = Colors.white;
