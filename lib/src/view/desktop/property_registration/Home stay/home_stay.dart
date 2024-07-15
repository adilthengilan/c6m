import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Home%20stay/home_stay_page1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Home%20stay/home_stay_page2.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Hotel/hotel_page1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places4.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places_5.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/apartment_page2.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/apartment_page3.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/registration_menu.dart';
import 'package:provider/provider.dart';

class HomeStay extends StatelessWidget {
  const HomeStay({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final homestay = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: homestay.homeStayController,
        children: const [
          HomeStayPage1(), // select one or either
          HotelPage1(), //grid view listed options
          // ApartmentPage2(goToPage: goToPage, pageController: pageController)//multiple options or either choose
// ApartmentPage3(goToPage: goToPage, backToPage: backToPage, pageController: pageController)//sounds like your property
//property name
        ],
      ),
    );
  }
}
