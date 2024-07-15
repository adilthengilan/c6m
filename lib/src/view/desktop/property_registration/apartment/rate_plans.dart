import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/login_provider.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class RatePlans extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const RatePlans(
      {super.key,
      required this.goToPage,
      required this.backToPage,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: width * 0.012),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Price per night', style: largeTextStyleBold),
                  sizedBox(height * 0.02, width),
                  SizedBox(
                    width: width * 0.3,
                    child: Text(
                        'To attract a wider range of guests, we suggest setting up multiple rate plans. The recommended prices and policies for each plan are based on data from properties like yours, but they can be edited now or after you complete registration.',
                        style: GoogleFonts.montserrat(color: Colors.black)),
                  ),
                  sizedBox(height * 0.03, width),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: width * 0.012),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Standard rate plan', style: largeTextStyleBold),
                  sizedBox(height * 0.02, width),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Cancellation policy',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      sizedBox(0.0, width * 0.005),
                      const Icon(Icons.info_outline, size: 20),
                      const Spacer(),
                      //================================ Edit Button =======================================================
                      editButton(
                        width,
                        height,
                        () {},
                      ),
                    ],
                  ),
                  sizedBox(height * 0.03, 0.0),
                  SizedBox(
                    width: width * 0.33,
                    child: Text(
                      'You’re 91% more likely to get bookings with the pre-selected cancellation policy settings than with a 30-day cancellation policy',
                      style: GoogleFonts.montserrat(color: Colors.green),
                    ),
                  ),
                  sizedBox(height * 0.03, 0.0),
                  for (int i = 0; i < 2; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle_outline),
                          sizedBox(0.0, width * 0.01),
                          SizedBox(
                            width: width * 0.25,
                            child: Text(
                                i == 0
                                    ? 'Guests can cancel their bookings for free up to 1 day before their arrival'
                                    : 'Guests who cancel within 24 hours will have their cancellation fee waived',
                                style: smallTextStyle),
                          )
                        ],
                      ),
                    ),
                  sizedBox(height * 0.01, 0.0),
                  Divider(color: Colors.grey.shade300),
                  sizedBox(height * 0.01, 0.0),
                  //================================================ Heading and Edit Button ====================================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Price per group size',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      sizedBox(0.0, width * 0.005),
                      const Icon(Icons.info_outline, size: 20),
                      const Spacer(),
                      //================================ Edit Button =======================================================
                      editButton(
                        width,
                        height,
                        () {},
                      ),
                    ],
                  ),
                  sizedBox(height * 0.03, 0.0),
                  Text(
                    'You’re 12% more likely to get bookings if you set lower prices for smaller groups of guests',
                    style: GoogleFonts.montserrat(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                  sizedBox(height * 0.03, 0.0),
                  SizedBox(
                    width: width * 0.3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Occupancy',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            sizedbox(height * 0.02, 0.0),
                            for (int i = 0; i < 2; i++)
                              Padding(
                                padding: EdgeInsets.only(bottom: height * 0.02),
                                child: Row(
                                  children: [
                                    const Icon(IconlyLight.user),
                                    sizedBox(0.0, width * 0.01),
                                    Text(
                                      'X  1',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                        sizedbox(0.0, width * 0.04),
                        Column(
                          children: [
                            Text(
                              'Guests pay',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            sizedbox(height * 0.022, 0.0),
                            for (int i = 0; i < 2; i++)
                              Padding(
                                padding: EdgeInsets.only(bottom: height * 0.03),
                                child: Text(
                                  i == 0 ? '\$ 100.00' : '\$ 90.00',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                  sizedbox(height * 0.03, 0.0),
                ],
              ),
            ),
            sizedBox(height * 0.02, 0.0),
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: width * 0.012),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Non-refundable rate plan', style: largeTextStyleBold),
                  sizedBox(height * 0.02, width),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Cancellation policy',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      sizedBox(0.0, width * 0.005),
                      const Icon(Icons.info_outline, size: 20),
                      const Spacer(),
                      //================================ Edit Button =======================================================
                      editButton(
                        width,
                        height,
                        () {},
                      ),
                    ],
                  ),
                  sizedBox(height * 0.02, width),
                  SizedBox(
                    width: width * 0.3,
                    child: Text(
                      'You’re 16% more likely to get bookings with the 15% pre-selected weekly rate than with none',
                      style: GoogleFonts.montserrat(
                          color: Colors.green, fontSize: 13),
                    ),
                  ),
                  sizedBox(height * 0.02, width),
                  for (int i = 0; i < 2; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle_outline),
                          sizedBox(0.0, width * 0.01),
                          SizedBox(
                            width: width * 0.25,
                            child: Text(
                                i == 0
                                    ? 'Guests will pay 15% less than the standard rate when they book for at least 7 nights'
                                    : 'Guests can cancel their bookings for free up to 1 day before their arrival (based on the standard rate cancellation policy',
                                style: smallTextStyle),
                          )
                        ],
                      ),
                    ),
                  sizedBox(height * 0.03, width),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            Row(
              children: [
                backButton(
                  height,
                  width,
                  () {
                    person.goToPage(backToPage, pageController);
                  },
                ),
                sizedBox(0.0, width * 0.02),
                continueButton(
                  height,
                  width,
                  true,
                  () {
                    person.goToPage(goToPage, pageController);
                  },
                )
              ],
            ),
            sizedBox(height * 0.2, width),
          ],
        ),
      ),
    );
  }

  SizedBox editButton(double width, double height, VoidCallback onPressed) {
    return SizedBox(
      width: width * 0.045,
      height: height * 0.048,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: Colors.deepPurpleAccent),
        ),
        onPressed: () {},
        child: Text(
          'Edit',
          style: GoogleFonts.montserrat(
            color: Colors.deepPurpleAccent,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}