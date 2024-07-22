import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/account_registration.dart';
import 'package:tuch_trip_crms/src/view/desktop/Concierge/concrierge.dart';
import 'package:tuch_trip_crms/src/view/desktop/Guests/guest.dart';
import 'package:tuch_trip_crms/src/view/desktop/New%20bookings/new_booking.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';
import 'package:tuch_trip_crms/src/view/desktop/rooms/rooms.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return const AccountRegistrationScreen();
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
    // final dbconnection = Provider.of<DBConnecting>(context);
    // print(dbconnection.token);
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
                            boxShadow:
                                index == person.navigationButtonsSelectedIndex
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
                                  color: index ==
                                          person.navigationButtonsSelectedIndex
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
                                  style: index ==
                                          person.navigationButtonsSelectedIndex
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
                    builder: (context) => const PropertyRegistrationMenu()));
          },
          label: Text('Enroll Your Property', style: smallTextStyle),
          icon: Icon(
            Icons.apartment_outlined,
            color: Colors.lightBlueAccent.shade100,
          ),
        ),
        sizedBox(0.0, width * 0.02),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountRegistrationScreen()));
          },
          child: Row(
            children: [
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
              SizedBox(width: width * 0.01),
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
              SizedBox(width: width * 0.02),
            ],
          ),
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