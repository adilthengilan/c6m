import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_management_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/rooms_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class Concrierge extends StatelessWidget {
  const Concrierge({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        ? 'Employee Name(210)'
                                        : index == 1
                                            ? 'Active Employee (246)'
                                            : 'Inactive Employee(180)',
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
                                              Color.fromARGB(255, 255, 64, 140),
                                              Color.fromARGB(255, 250, 165, 200)
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
                //=======================================================  The Tab Button ==================================================
                Padding(
                  padding:  EdgeInsets.only(right: width * 0.02),
                  child: CustomContainer(
                    boxShadow: true,
                    height: height * 0.051,
                    width: width * 0.13,
                    color: Color.fromARGB(231, 255, 91, 181),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        sizedBox(0.0, width * 0.01),
                        Text('Generate report', style: smallTextStyleBold),
                      ],
                    ),
                  ),
                ),
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
                                  ? width * 0.27
                                  : index == 1
                                      ? width * 0.15
                                      : index == 2
                                          ? width * 0.13
                                          : index == 3
                                              ? width * 0.13
                                              : width * 0.06,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      index == 0
                                          ? 'Employee Name'
                                          : index == 1
                                              ? 'Job desk'
                                              : index == 2
                                                  ? 'Schedule'
                                                  : index == 3
                                                      ? 'Contact'
                                                      : 'Status',
                                      style: smallTextStyleBold))),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, builderIndex) => CustomContainer(
                      width: width,
                      padding: EdgeInsets.only(left: width * 0.004),
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.grey.shade100)),
                      color: Colors.white,
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
                                Consumer<GuestManagementProvider>(
                                  builder: (context, person, child) => Checkbox(
                                    value: builderIndex ==
                                            person.guestSelectedIndex
                                        ? true
                                        : false,
                                    onChanged: (value) {
                                      person.setSelectGuestIndex(value);
                                    },
                                    activeColor:
                                        Color.fromARGB(231, 255, 91, 181),
                                    checkColor: Colors.white,
                                  ),
                                ),
                                sizedBox(0.0, width * 0.01),
                                CustomContainer(
                                  height: height * 0.1,
                                  width: width * 0.06,
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/Profile.jpg')),
                                  boxShadow: false,
                                ),
                                sizedBox(0.0, width * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Employee id', style: smallTextStyle),
                                    sizedBox(height * 0.01, 0.0),
                                    SizedBox(
                                        width: width * 0.1,
                                        child: Text('Margareetha',
                                            style: smallTextStyleBold)),
                                    Text(
                                      "Join on Jan 5th,2022",
                                      style: smallTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => Container(
                                  width: index == 0 || index == 1
                                      ? width * 0.13
                                      : width * 0.140,
                                  padding: EdgeInsets.only(right: width * 0.02),
                                  child: Text(
                                      index == 0
                                          ? 'Answering guests enquieries,directing phonecalls,coordinating travel plans and more'
                                          : index == 1
                                              ? 'Tuesday,friday,monday,8.00Am to 4.00Pm'
                                              : '+91 9446085810',
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
                                        ? 'Active'
                                        : 'Inactive',
                                    style: GoogleFonts.montserrat(
                                        color: builderIndex == 0 ||
                                                builderIndex == 2
                                            ? Colors.red
                                            : Colors.green,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
