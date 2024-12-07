import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/hotel_page1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/conformation_page.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_addressPage.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/availlability.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/final_page.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/goods_services_tax.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/host_profile.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/image_uploader_Page.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/price_per_night.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_aminities.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_detailes.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_listing.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_location.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_rules.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_services.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/Rate_Planes/rate_plans.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/receive_bookings.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/staff_language_selection.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';

class Hotels extends StatelessWidget {
  const Hotels({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: const Color.fromARGB(255, 250, 253, 255),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: person.hotelsPagecontroller,
        children: [
          HotelPage1(goToPage: 1, pageController: person.hotelsPagecontroller),
          PorpertyCount(goToPage: 2, pageController: person.hotelsPagecontroller, stayPalceName: "Hotel"),
          ConformationPage(goToPage: 3, pageController: person.hotelsPagecontroller),
          PropertyAddressPage(goToPage: 4, backToPage: 2, pageController: person.hotelsPagecontroller),
          PropertyLocationPage(gotToNextPage: 5, goToBackPage: 3, pageController: person.hotelsPagecontroller),
          PropertyCapacityDetailesPage(goToPage: 6, backToPage: 4, pageController: person.hotelsPagecontroller),
          PropertyAminities(goToPage: 7, backToPage: 5, pageController: person.hotelsPagecontroller),
          PropertyServices(goToPage: 8, backToPage: 6, pageController: person.hotelsPagecontroller),
          StaffLanguageSelectionPart(goToPage: 9, backToPage: 7, pageController: person.hotelsPagecontroller),
          PropertyRules(goToPage: 10, backToPage: 8, pageController: person.hotelsPagecontroller),
          HostProfilePage(goToPage: 11, backToPage: 9, pageController: person.hotelsPagecontroller),
          ImageUploader(goToPage: 12, backToPage: 10, pageController: person.hotelsPagecontroller),
          ReceiveBookings(goToPage: 13, backToPage: 11, pageController: person.hotelsPagecontroller),
          PricePerNight(goToPage: 14, backToPage: 12, pageController: person.hotelsPagecontroller),
          RatePlans(goToPage: 15, backToPage: 13, pageController: person.hotelsPagecontroller),
          Availability(goToPage: 16, backToPage: 14, pageController: person.hotelsPagecontroller),
          GoodsandServicesTsx(goToPage: 17, backToPage: 15, pageController: person.hotelsPagecontroller),
          Finalpage(goToPage: 18, backToPage: 16, pageController: person.hotelsPagecontroller),
          PropertyListing(backToPage: 17, pageController: person.hotelsPagecontroller),
        ],
      ),
    );
  }
}
