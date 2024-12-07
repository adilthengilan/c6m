import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class ReceiveBookings extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const ReceiveBookings({
    super.key,
    required this.goToPage,
    required this.backToPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('How you receive bookings', style: largeTextStyleBold),
                  sizedBox(height * 0.03, 0.0),
                  Text(
                    "We’re here to ensure you can receive bookings safely:",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedBox(height * 0.03, 0.0),
                  for (int i = 0; i < 4; i++)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.check, color: Colors.black, size: height * 0.025),
                        sizedBox(0.0, width * 0.01),
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.02),
                          child: SizedBox(
                            width: width * 0.28,
                            child: Text(
                              i == 0
                                  ? 'Set house rules guest must agree to before they stay'
                                  : i == 1
                                      ? 'Request damage deposits for extra security'
                                      : i == 2
                                          ? 'Report guest misconduct if something goes wrong'
                                          : 'Receive protection against liability claims from guests and neighbours up to US\$10,00,000 for every reservation',
                            ),
                          ),
                        ),
                      ],
                    ),
                  sizedBox(height * 0.03, 0.0),
                  Text('How can guests book your apartment?', style: smallTextStyleBold),
                  sizedBox(height * 0.02, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, provider, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio<bool>(
                              activeColor: Colors.lightBlueAccent,
                              value: true,
                              groupValue: provider.isAllGuestscCanBookInstantly,
                              onChanged: (value) => provider.setallGuestscCanBookInstantly(value),
                            ),
                            sizedBox(0.0, width * 0.01),
                            const Text(
                              'All guests can book instantly',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        sizedBox(0.0, 20),
                        Row(
                          children: [
                            Radio<bool>(
                              activeColor: Colors.lightBlueAccent,
                              value: false,
                              groupValue: provider.isAllGuestscCanBookInstantly,
                              onChanged: (value) => provider.setallGuestscCanBookInstantly(value),
                            ),
                            sizedBox(0.0, width * 0.01),
                            const Text(
                              'All guests will need to request to book',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        sizedBox(height * 0.03, 0.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Visibility(
              visible: !person.isAllGuestscCanBookInstantly,
              child: CustomContainer(
                boxShadow: true,
                width: width * 0.35,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(height * 0.03, 0.0),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline_rounded),
                          sizedBox(0.0, width * 0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: width * 0.25, child: const Text('When using request to book, the booking process will be as follows:')),
                              sizedBox(height * 0.01, 0.0),
                              for (int i = 0; i < 3; i++)
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.005, bottom: height * 0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(i == 0
                                          ? '1. '
                                          : i == 1
                                              ? '2. '
                                              : '3. '),
                                      SizedBox(
                                          width: width * 0.28,
                                          child: Text(i == 0
                                              ? 'Guests who want to make a booking with a checkin that is more than 48 hours in the future will be able to find your apartment and send a booking request'
                                              : i == 1
                                                  ? ' You’ll have 24 hours to accept or decline the request'
                                                  : 'Guests will have 24 hours to finish their booking and confirm their stay')),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                    sizedBox(height * 0.03, 0.0),
                  ],
                ),
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Row(
              children: [
                backButton(
                  height,
                  width,
                  () {
                    person.goToPage(backToPage, pageController);
                  },
                ),
                sizedBox(0.0, width * 0.005),
                continueButton(height, width, true, () {
                  person.goToPage(goToPage, pageController);
                })
              ],
            ),
            sizedBox(height * 0.1, 0.0),
          ],
        ),
      ),
    );
  }
}
