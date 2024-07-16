import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/Home%20stay/hotel_category.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/Hotel/hotel_page1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_2.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_4.dart';
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

class Hotels extends StatelessWidget {
  const Hotels({super.key});

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
        controller: person.hotelsPagecontroller,
        children: [
          HotelPage1(goToPage: 1, pageController: person.hotelsPagecontroller),
          //Selection Stay TypeNuha's Page //From the list below, which property category is most similar to your place?
          ApartmentPage1(goToPage: 2, pageController: person.hotelsPagecontroller,stayPalceName: person.stayCategoryOption!),
          ApartmentPage2(goToPage: 3, pageController: person.hotelsPagecontroller),
          ApartmentPage4(goToPage: 4, backToPage: 3, pageController: person.hotelsPagecontroller),
          PropertyDetailes(goToPage: 5, backToPage: 4, pageController: person.hotelsPagecontroller),
          PropertyLocationPage(gotToNextPage: 6, goToBackPage: 5, pageController: person.hotelsPagecontroller),
          PropertyDetailes(goToPage: 7, backToPage: 6, pageController: person.hotelsPagecontroller),
          PropertyAminities(goToPage: 8, backToPage: 7, pageController: person.hotelsPagecontroller),
          PropertyServices(goToPage: 9, backToPage: 8, pageController: person.hotelsPagecontroller),
          StaffLanguageSelectionPart(goToPage: 9, backToPage: 8, pageController: person.hotelsPagecontroller),
          PropertyRules(goToPage: 11, backToPage: 10, pageController: person.hotelsPagecontroller),
          HostProfilePage(goToPage: 12, backToPage: 11, pageController: person.hotelsPagecontroller),
          ImageUploader(goToPage: 13, backToPage: 12, pageController: person.hotelsPagecontroller),
          ReceiveBookings(goToPage: 14, backToPage: 13, pageController: person.hotelsPagecontroller),
          PricePerNight(goToPage: 15, backToPage: 14, pageController: person.hotelsPagecontroller),
          RatePlans(goToPage: 16, backToPage: 15, pageController: person.hotelsPagecontroller),
          GoodsandServicesTsx(goToPage: 17, backToPage: 16, pageController: person.hotelsPagecontroller),
          const Finalpage(),
        ],
      ),
    );
  }
}