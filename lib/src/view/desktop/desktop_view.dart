import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuch_trip_crms/src/db_connecting.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/account_registration.dart';
import 'package:tuch_trip_crms/src/view/desktop/Concierge/concrierge.dart';
import 'package:tuch_trip_crms/src/view/desktop/Guests/guest.dart';
import 'package:tuch_trip_crms/src/view/desktop/New%20bookings/new_booking.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/job_vacancy/job_vacancy.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';
import 'package:tuch_trip_crms/src/view/desktop/rooms/rooms.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/show_dialoug.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DBConnecting>(context, listen: false);
    db.getToken();
    Timer(
      const Duration(seconds: 1),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => 
            JobVacancy()
            // db.token != null?
                //  const HomePage()
                // : const AccountRegistrationScreen(),
          ),
        );
      },
    );
    return const Scaffold(
      body: Center(
        child: RefreshProgressIndicator(backgroundColor: Colors.white,color: Colors.black)),
    );
    //
  }
}

///////////==============================================================================================================
///////////==============================================================================================================
///////////==============================================================================================================
TextEditingController searchController = TextEditingController();
TextEditingController occupentCheckInFirstNameController = TextEditingController();
TextEditingController occupentChecInkLastNameController = TextEditingController();
TextEditingController occupentCheckInMobileNumberController = TextEditingController();
TextEditingController occupentCheckInEmailController = TextEditingController();
TextEditingController occupentChecInkEmailController = TextEditingController();
TextEditingController occupentChecInCountryController = TextEditingController();
///////////==============================================================================================================
///////////==============================================================================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    final db = Provider.of<DBConnecting>(context, listen: false);
    db.getToken();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppAppBar(
        pageName: true,
      ),
      drawerEnableOpenDragGesture: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            navigationSideButtons(height, width),
            dashboardProvider.navigationButtonsSelectedIndex == 0
                ? const DashBoard()
                : dashboardProvider.navigationButtonsSelectedIndex == 1
                    ? const RoomScreen()
                    : dashboardProvider.navigationButtonsSelectedIndex == 2
                        ? const NewBookings()
                        : dashboardProvider.navigationButtonsSelectedIndex == 3
                            ? const GuestManagementScreen()
                            : const Concrierge()
          ],
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//=================================== Navigation Menu Buttons on The side of Screen =======================================
//=========================================================================================================================
//==================== DashBoard ======= Room ======= Booking ========= Guest ========= Settings ==========================
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Container navigationSideButtons(double height, double width) {
    return Container(
      width: width * 0.17,
      color: Colors.grey.shade50,
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
                  'icon': IconlyLight.user_1,
                  'text': 'Concierge',
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
                      padding: EdgeInsets.only(left: width * 0.01),
                      borderRadius: BorderRadius.circular(15),
                      gradiantColors:
                          index == person.navigationButtonsSelectedIndex
                              ? [
                                  Colors.purple.shade500,
                                  Colors.purple.shade300,
                                ]
                              : [
                                  Colors.grey.shade50,
                                  Colors.grey.shade50,
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
                                : width * 0.02,
                          ),
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////// This AppBar using in DashBoard It has Owr Logo, notification buttons, listing hotels, Profile //////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool pageName;
  const AppAppBar({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      toolbarHeight: height * 0.12,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SizedBox(
            width: width * 0.17,
            child: Text('Tuchtrip', style: largeTextStyleBold),
          ),
          pageName
              ? SizedBox(
                  width: width * 0.15,
                  child: Consumer<DashboardProvider>(
                    builder: (context, person, child) => Text(
                      person.navigationButtonsSelectedIndex == 0
                          ? 'Dashboard'
                          : person.navigationButtonsSelectedIndex == 1
                              ? 'Room'
                              : person.navigationButtonsSelectedIndex == 2
                                  ? 'Booking'
                                  : person.navigationButtonsSelectedIndex == 3
                                      ? 'Guest'
                                      : 'Concierge',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: width * 0.15,
                ),
          SizedBox(width: width * 0.06),
        ],
      ),
      actions: [
        SizedBox(
          width: width * 0.1,
          child: Row(
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
        SizedBox(width: width * 0.02),
        // =========================================================== List Your Property ==========================================================
        // =========================================================== ================== ==========================================================
        TextButton.icon(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.01,
              vertical: height * 0.02,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PropertyRegistrationMenu(),
              ),
            );
          },
          label: Text('Enroll Your Property', style: smallTextStyle),
          icon: Icon(
            Icons.apartment_outlined,
            color: Colors.lightBlueAccent.shade100,
          ),
        ),
        sizedBox(0.0, width * 0.02),
        Row(
          children: [
            CustomContainer(
              height: height * 0.055,
              width: width * 0.028,
              border: Border.all(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(15),
              boxShadow: false,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/person.icon.png'),
              ),
            ),
            SizedBox(width: width * 0.01),
            SizedBox(
              child: Consumer2<DashboardProvider, DBConnecting>(
                builder: (context, profile, db, child) =>
                    DropdownButton<String>(
                  dropdownColor: Colors.white,
                  focusColor: Colors.white,
                  underline: const SizedBox(),
                  icon: Padding(
                    padding: EdgeInsets.only(left: width * 0.01),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                  elevation: 0,
                  value: profile.selectedProfileDropDown,
                  hint: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Receptionist',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('John Deo', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'Profile',
                      child: Text('Profile'),
                    ),
                    DropdownMenuItem(
                      value: 'Post job vacancy',
                      child: Text('Post job vacancy'),
                    ),
                    DropdownMenuItem(
                      value: 'settings',
                      child: Text('Settings'),
                    ),
                    DropdownMenuItem(
                      value: db.token == null ? 'login' : "logout",
                      child: Text(db.token == null ? 'login' : "logout"),
                    ),
                  ],
                  onChanged: (value) {
                    switch (value) {
                      case 'Post job vacancy':
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const JobVacancy()));
                        break;
                      case 'settings':
                        print('Settings selected');
                        // Navigate to settings
                        break;
                      case 'Profile':
                        print('Logout selected');
                        // Perform logout
                        break;
                      case 'login':
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountRegistrationScreen()));
                        break;
                      case 'logout':
                        customShowDialog(context,
                        AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              title: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Logout"),
                                ],
                              ),
                              content: const Text("Do you want to logout this account?"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                  },
                                ),
                                TextButton(
                                  child: const Text("Logout"),
                                  onPressed: () {
                                    db.clearToken();
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => const AccountRegistrationScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                        );
                        break;
                    }
                  },
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// Shimmer widget //////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
class LoadingWidget extends StatelessWidget {
  final double height;
  final double width;
  const LoadingWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      child: CustomContainer(
        height: height,
        width: width,
        borderRadius: BorderRadius.circular(15),
        gradiantColors: [
          Colors.grey.shade200,
          Colors.grey.shade50,
        ],
        boxShadow: false,
      ),
    );
  }
}
