import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/Home%20stay/place_type.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_2.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_4.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/availlability.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/final_page.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/goods_services_tax.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/host_profile.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/image_uploader_Page.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/price_per_night.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_aminities.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_detailes.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_location.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_rules.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_services.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/Rate_Planes/rate_plans.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/receive_bookings.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/staff_language_selection.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';

class AlternativePlaces extends StatelessWidget {
  const AlternativePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: person.placesPageController,
        children: [
          //Privete Room or Entire places
          ImageUploader(goToPage: 0, backToPage: 0, pageController: person.placesPageController),
          PlaceType(goToPage: 1, pageController: person.placesPageController),
          Places2(
              goToPage: 2,
              backToPage: 0,
              pageController: person.placesPageController),
          ApartmentPage1(
              goToPage: 3,
              pageController: person.placesPageController,
              stayPalceName: 'Alternative Places'),
          ApartmentPage2(
              goToPage: 4, pageController: person.placesPageController),
          ApartmentPage4(
              goToPage: 5,
              backToPage: 4,
              pageController: person.placesPageController),
          PropertyDetailes(
              goToPage: 6,
              backToPage: 5,
              pageController: person.placesPageController),
          PropertyLocationPage(
              gotToNextPage: 7,
              goToBackPage: 6,
              pageController: person.placesPageController),
          PropertyDetailes(
              goToPage: 8,
              backToPage: 7,
              pageController: person.placesPageController),
          PropertyAminities(
              goToPage: 9,
              backToPage: 8,
              pageController: person.placesPageController),
          PropertyServices(
              goToPage: 10,
              backToPage: 9,
              pageController: person.placesPageController),
          StaffLanguageSelectionPart(
              goToPage: 11,
              backToPage: 10,
              pageController: person.placesPageController),
          PropertyRules(
              goToPage: 12,
              backToPage: 11,
              pageController: person.placesPageController),
          HostProfilePage(
              goToPage: 13,
              backToPage: 12,
              pageController: person.placesPageController),
          ImageUploader(
              goToPage: 14,
              backToPage: 13,
              pageController: person.placesPageController),
          ReceiveBookings(
              goToPage: 15,
              backToPage: 14,
              pageController: person.placesPageController),
          PricePerNight(
              goToPage: 16,
              backToPage: 15,
              pageController: person.placesPageController),
          RatePlans(
              goToPage: 17,
              backToPage: 16,
              pageController: person.placesPageController),
          Availability(goToPage: 18, backToPage: 17, pageController: person.placesPageController),
          GoodsandServicesTsx(
              goToPage: 19,
              backToPage: 18,
              pageController: person.placesPageController),
          const Finalpage(),
        ],
      ),
    );
  }
}