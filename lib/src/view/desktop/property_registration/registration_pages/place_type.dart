import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class PlaceType extends StatelessWidget {
  final int goToPage;
  final PageController pageController;
  const PlaceType({super.key, required this.goToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            SizedBox(
              width: width * 0.3,
              child: Text(
                'How many apartments are you listing?',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            for (int i = 0; i < 2; i++)
              Padding(
                padding:
                    EdgeInsets.only(bottom: i == 0 ? height * 0.04 : 0),
                child: Consumer<RegistrationProvider>(
                  builder: (context, person, child) => GestureDetector(
                    onTap: i == 0
                        ? () {
                            person.setStayTypeEntireOrPrivatePlace(true);
                          }
                        : () {
                            person.setStayTypeEntireOrPrivatePlace(false);
                          },
                    child: CustomContainer(
                      width: width * 0.35,
                      padding: EdgeInsets.symmetric(vertical: height * 0.03),
                      border: Border.all(
                          color: i == 0? person.isEntirePlace? 
                               Colors.deepPurpleAccent
                              : Colors.transparent :
                              i == 1 && !person.isEntirePlace?
                              Colors.deepPurpleAccent
                              : Colors.transparent
                              ),
                      color: Colors.white,
                      boxShadow: true,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width * 0.02),
                          Icon(
                            Icons.house_outlined,
                            color: i == 0
                                ? Colors.orangeAccent.shade100
                                : Colors.pinkAccent.shade100,
                            size: height * 0.06,
                          ),
                          SizedBox(width: width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                i == 0
                                    ? 'Entire place'
                                    : 'A private room',
                                style: smallTextStyleBold,
                              ),
                              SizedBox(height: height * 0.01),
                              SizedBox(
                                width: width * 0.25,
                                child: Text(i == 0 ?'Guests are able to use the entire place and do not have to share this with the host or other guests.'
                                : 'Guests rent a room within the property. There are common areas that are either shared with the host or other guests.'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            sizedBox(height * 0.03, 0.0),
            continueButton(
              height,
              width,
              true,
              () {
                 person.goToPage(goToPage,pageController);
              },
            ),
            sizedBox(height * 0.1, width),
          ],
        ),
      ),
    );
  }
}