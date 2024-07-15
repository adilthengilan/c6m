import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/apartment_page1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/apartment_page2.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/apartment_page3.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/apartment_page4.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/final_page.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/goods_services.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/host_profile.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/image_uploader.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/price_pernight.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_amenities.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_details.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_location.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_rules.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_services.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/rate_plans.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/recieve_booking.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/staff_language_selection.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/registration_menu.dart';
import 'package:provider/provider.dart';

class Apartment extends StatelessWidget {
  const Apartment({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: backgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: person.apartmentPagecontroller,
        children: [
          ApartmentPage1(goToPage: 1,pageController: person.apartmentPagecontroller),//page 1
          ApartmentPage2(goToPage: 2,pageController: person.apartmentPagecontroller),//page 2
          ApartmentPage3(goToPage: 3, backToPage: 1,pageController: person.apartmentPagecontroller),//page 3
          ApartmentPage4(goToPage: 4, backToPage: 2,pageController: person.apartmentPagecontroller),//page 4
          PropertyLocationPage(gotToNextPage: 5,goToBackPage: 3,pageController: person.apartmentPagecontroller),//page 5
          PropertyDetailes(goToPage: 6, backToPage: 4,pageController: person.apartmentPagecontroller),//page 6
          PropertyAminities(goToPage: 7, backToPage: 5,pageController: person.apartmentPagecontroller),//page 7
          PropertyServices(goToPage: 8, backToPage: 6,pageController: person.apartmentPagecontroller),//page 8
          StaffLanguageSelectionPart(goToPage: 9, backToPage: 7,pageController: person.apartmentPagecontroller),//page 9
          PropertyRules(goToPage: 10, backToPage: 8,pageController: person.apartmentPagecontroller),//page 10
          HostProfilePage(goToPage: 11,backToPage: 9,pageController: person.apartmentPagecontroller), //Page 11
          ImageUploader(goToPage: 12,backToPage: 10, pageController: person.apartmentPagecontroller), //Page12
          ReceiveBookings(goToPage: 13, backToPage: 11, pageController: person.apartmentPagecontroller),
          PricePerNight(goToPage: 1, backToPage: 12, pageController: person.apartmentPagecontroller),
          RatePlans(goToPage: 2, backToPage: 14, pageController: person.apartmentPagecontroller),
          GoodsandServicesTsx(goToPage: 3, backToPage: 14, pageController: person.apartmentPagecontroller),
          Finalpage(), //page 13
          /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ],
      ),
    );
  }
}