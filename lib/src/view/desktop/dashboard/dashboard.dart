import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';
import 'package:tuch_trip_crms/src/view_model/dashboard_provider.dart';

///////////==============================================================================================================
///////////==============================================================================================================
///////////==============================================================================================================
TextEditingController searchController = TextEditingController();
///////////==============================================================================================================
///////////==============================================================================================================
///////////==============================================================================================================

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: dashboardAppBar(width, height),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            navigationSideButtons(height, width),
            Container(
              width: width * 0.82,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBox(height * 0.04, 0.0),
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
                                    checkInandCheckOutpersentageStatus(
                                        height, width),
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
                                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////////////////// Column ............. /////////////////////////////////////////////
                                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                              ],
                            ),
                          ],
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
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////// Dashboard App Bar ////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  AppBar dashboardAppBar(double width, double height) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      toolbarHeight: height * 0.1,
      title: Row(
        children: [
          SizedBox(
            width: width * 0.18,
            child: Text('Tuchtrip', style: largeTextStyleBold),
          ),
          SizedBox(
            width: width * 0.15,
            child: Text(
              'Dashboard',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          sizedBox(0.0, width * 0.06),
          //======================================================= Search Bar =============================================================
          CustomContainer(
            height: height * 0.051,
            width: width * 0.25,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: true,
            child: CustomTextField(
              labelText: 'Search here',
              controller: searchController,
              borderRadius: 20,
              borderSide: BorderSide.none,
              suffixIcon: const Icon(Icons.search, color: Colors.blue),
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: width * 0.1,
          child: Row(
            //==================================================== Navigation Buttons ======================================================
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) {
                final icons = [
                  {
                    'icon': IconlyLight.chat,
                    'onTap': () {},
                  },
                  {
                    'icon': Icons.notifications_none_outlined,
                    'onTap': () {},
                  },
                  {
                    'icon': Icons.favorite_border_outlined,
                    'onTap': () {},
                  },
                ];
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: icons[index]['onTap'] as VoidCallback,
                  child: CustomContainer(
                    height: height * 0.045,
                    width: width * 0.028,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShape: BoxShape.rectangle,
                    boxShadow: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.01,
                            left: width * 0.003,
                          ),
                          child: Icon(
                            icons[index]['icon'] as IconData?,
                            size: height * 0.024,
                            semanticLabel: 'text',
                            color: Colors.deepPurple,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.005,
                          ),
                          child: CircleAvatar(
                            radius: height * 0.006,
                            backgroundColor: Colors.orange.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        sizedBox(0.0, width * 0.06),
        //========================================================== Profile Image ===================================================
        CustomContainer(
          height: height * 0.05,
          width: width * 0.028,
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          boxShadow: false,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/profile image.png'),
          ),
        ),
        sizedBox(0.0, width * 0.01),
        SizedBox(
          height: height * 0.06,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Receptionist', style: smallTextStyleBold),
              Text('John Deo', style: smallTextStyle),
            ],
          ),
        ),
        sizedBox(0.0, width * 0.02),
      ],
    );
  }
}

//=================================== Navigation Menu Buttons on The side of Screen =======================================
//=========================================================================================================================
//==================== DashBoard ======= Room ======= Booking ========= Guest ========= Settings ==========================
//=========================================================================================================================
Container navigationSideButtons(double height, double width) {
  return Container(
    height: height * 2,
    width: width * 0.18,
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.only(top: height * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          5,
          (index) {
            final buttons = [
              {
                'icon': Icons.dashboard_outlined,
                'text': 'Dashboard',
                'onTap': () {},
              },
              {
                'icon': Icons.vpn_key_outlined,
                'text': 'Room',
                'onTap': () {},
              },
              {
                'icon': IconlyLight.calendar,
                'text': 'Booking',
                'onTap': () {},
              },
              {
                'icon': IconlyLight.user,
                'text': 'Guest',
                'onTap': () {},
              },
              {
                'icon': IconlyLight.setting,
                'text': 'Settings',
                'onTap': () {},
              },
            ];
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
              ),
              child: Consumer<DashboardProvider>(
                builder: (context, person, child) => GestureDetector(
                  onTap: () {
                    person.setSelectedButtonIndex(index);
                  },
                  child: CustomContainer(
                    height: height * 0.065,
                    width: width * 0.15,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                    borderRadius: BorderRadius.circular(15),
                    gradiantColors:
                        index == person.navigationButtonsSelectedIndex
                            ? [
                                Colors.purple.shade500,
                                Colors.purple.shade300,
                              ]
                            : [
                                Colors.white,
                                Colors.white,
                              ],
                    boxShadow: index == person.navigationButtonsSelectedIndex
                        ? true
                        : false,
                    child: Row(
                      mainAxisAlignment:
                          index == person.navigationButtonsSelectedIndex
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                      children: [
                        Icon(
                          buttons[index]['icon'] as IconData,
                          color: index == person.navigationButtonsSelectedIndex
                              ? Colors.white
                              : Colors.black,
                        ),
                        sizedBox(
                            0.0,
                            index == person.navigationButtonsSelectedIndex
                                ? width * 0.012
                                : width * 0.02),
                        Text(
                          buttons[index]['text'] as String,
                          style: index == person.navigationButtonsSelectedIndex
                              ? smallTextStylewhite
                              : smallTextStyle,
                        ),
                        sizedBox(0.0, width * 0.01)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}

//===================================== Latest Costumer Reviews List ====================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
Container reviewsList(double height, double width) {
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
          itemBuilder: (context, index) => CustomContainer(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                          width: width * 0.42,
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
                    // Remove OR Verify Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        2,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: width * 0.01),
                          child: InkWell(
                            onTap: () {},
                            child: CustomContainer(
                              height: height * 0.05,
                              width: width * 0.1,
                              color: Colors.white,
                              border: Border.all(
                                  color: index == 1
                                  //if The index == 1 lightBlueColor is assign to First Button (Remove Button)
                                      ? Colors.lightBlueAccent.shade100
                                      //Otherwise Pinkshade color assign to second Button (Verify Button)
                                      : Colors.pink.shade200),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: true,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(index == 0 ? 'Remove' : 'Verify',
                                      style: smallTextStyleBold),
                                  sizedBox(0.0, width * 0.006),
                                  Icon(
                                    index == 0
                                        ? Icons.close_outlined
                                        : Icons.check,
                                    color: index == 0
                                        ? Colors.redAccent
                                        : Colors.blue,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
CustomContainer bookedRoomsTodayStatus(double height, double width) {
  return CustomContainer(
    height: height * 0.3,
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
        )
      ],
    ),
  );
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
CustomContainer checkInandCheckOutpersentageStatus(
    double height, double width) {
  return CustomContainer(
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
  );
}
//====================================================================================================================
//====================================================================================================================
//====================================================================================================================
//====================================================================================================================
CustomContainer availableRoomsTodayPesentage(double width, double height) {
  return CustomContainer(
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
            image: AssetImage('assets/images/Screenshot 2024-07-02 164934.png'),
          ),
        ),
        sizedBox(height * 0.01, 0.0),
        Text('785', style: largeTextStyleBold),
        sizedBox(height * 0.006, 0.0),
        Text('Available Rooms Today', style: smallTextStyle),
      ],
    ),
  );
}
//=======================================================================================================================
//=======================================================================================================================
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
        return CustomContainer(
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
        );
      },
    ),
  );
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SizedBox sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

final smallTextStyle = GoogleFonts.montserrat(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

final smallTextStylewhite = GoogleFonts.montserrat(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
final smallTextStylewhiteBold = GoogleFonts.montserrat(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

final smallTextStyleBold = GoogleFonts.montserrat(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

final largeTextStyleBold = GoogleFonts.montserrat(
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);
