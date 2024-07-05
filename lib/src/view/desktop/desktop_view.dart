import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/Guests/guest.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/rooms/rooms.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';
import 'package:tuch_trip_crms/src/view_model/dashboard_provider.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

///////////==============================================================================================================
///////////==============================================================================================================
TextEditingController searchController = TextEditingController();
///////////==============================================================================================================
///////////==============================================================================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: dashboardAppBar(width, height),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            navigationSideButtons(height, width),
            dashboardProvider.navigationButtonsSelectedIndex == 0?
            DashBoard(): 
            dashboardProvider.navigationButtonsSelectedIndex == 1?
            RoomScreen():
            dashboardProvider.navigationButtonsSelectedIndex == 3?
            GuestManagementScreen(): SizedBox()
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
            child: Consumer<DashboardProvider>(
              builder: (context, person, child) => 
              Text(
                person.navigationButtonsSelectedIndex == 0? 'Dashboard' : person.navigationButtonsSelectedIndex == 1? 'Room': person.navigationButtonsSelectedIndex == 2? 'Booking': person.navigationButtonsSelectedIndex == 3? 'Guest' : person.navigationButtonsSelectedIndex == 4 ? 'Settings' : 'Concierge',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
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
        padding: EdgeInsets.only(top: height * 0.02),
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
                            color:
                                index == person.navigationButtonsSelectedIndex
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
                            style:
                                index == person.navigationButtonsSelectedIndex
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
}