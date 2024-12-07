import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_addressPage.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_namePage.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/image_uploader_Page.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_aminities.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_detailes.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_location.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_rules.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_services.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/staff_language_selection.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class Finalpage extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const Finalpage({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
    return PageView(
      controller: person.finalPagePageviewcontroller,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBox(height * 0.06, 0.0),
              CustomContainer(
                boxShadow: false,
                height: height * 0.75,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    4,
                    (index) => CustomContainer(
                      height: height * 0.15,
                      width: width * 0.55,
                      boxShadow: true,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.015),
                      borderRadius: BorderRadius.circular(8),
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Row(
                        children: [
                          Icon([Icons.check_circle_outline, Icons.bed_outlined, Icons.image_outlined, Icons.credit_score_outlined][index],
                              color: index == 0 ? Colors.lightBlueAccent.shade100 : Colors.grey.shade800, size: height * 0.04),
                          sizedBox(0.0, width * 0.02),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(['Step 1', 'Step 2', 'Step 3', 'Step 4'][index], style: smallTextStyle),
                              sizedBox(height * 0.006, 0.0),
                              Text(['Property details', 'Rooms', 'Photos', 'Final steps'][index], style: mediumTextStyleBold),
                              sizedBox(height * 0.006, 0.0),
                              Text(
                                  [
                                    'The basics. Add your property name, address, facilities and more.',
                                    'Tell us about your first room. Once you’ve set one up you can add more.',
                                    'Share some photos of your property so guests know what to expect.',
                                    'Set up payments and invoicing before you open for bookings.'
                                  ][index],
                                  style: smallTextStyle),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(color: index == 1 || index == 2 ? Colors.deepPurpleAccent : Colors.white),
                              backgroundColor: index == 2 ? Colors.deepPurpleAccent : Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.025),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: [
                              () {
                                person.goToPage(1, person.finalPagePageviewcontroller);
                              },
                              () {
                                person.goToPage(2, person.finalPagePageviewcontroller);
                              },
                              () {
                                person.goToPage(9, person.finalPagePageviewcontroller);
                              },
                              () {
                                person.goToPage(goToPage, pageController);
                              }
                            ][index],
                            child: Text(
                              ['Edit', 'Add Room', 'Add Photos', 'Add final details'][index],
                              style: GoogleFonts.montserrat(
                                color: [Colors.deepPurpleAccent, Colors.grey, Colors.white, Colors.black][index],
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        PropertyNamePage(goToPage: 2, backToPage: 0, pageController: person.finalPagePageviewcontroller),
        PropertyAddressPage(goToPage: 3, backToPage: 1, pageController: person.finalPagePageviewcontroller),
        PropertyLocationPage(gotToNextPage: 4, goToBackPage: 2, pageController: person.finalPagePageviewcontroller),
        PropertyCapacityDetailesPage(goToPage: 5, backToPage: 3, pageController: person.finalPagePageviewcontroller),
        PropertyAminities(goToPage: 6, backToPage: 4, pageController: person.finalPagePageviewcontroller),
        PropertyServices(goToPage: 7, backToPage: 5, pageController: person.finalPagePageviewcontroller),
        StaffLanguageSelectionPart(goToPage: 8, backToPage: 6, pageController: person.finalPagePageviewcontroller),
        PropertyRules(goToPage: 0, backToPage: 7, pageController: person.finalPagePageviewcontroller),
        ImageUploader(goToPage: 0, backToPage: 0, pageController: person.finalPagePageviewcontroller),
      ],
    );
  }
}
