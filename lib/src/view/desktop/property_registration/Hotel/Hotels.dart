import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Hotel/hotel_page1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Hotel/hotel_page2.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Hotel/hotel_page3.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places4.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/apartment_page3.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/registration_menu.dart';
import 'package:provider/provider.dart';

class Hotels extends StatelessWidget {
  const Hotels({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hotels = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: hotels.placesPageController,
        children: const [
          HotelPage1(), // grid view builder
          Places4(), // multiple container
          // ApartmentPage2(goToPage: , pageController: pageController)// sound like our property or not?
          // ApartmentPage3(goToPage: goToPage, backToPage: backToPage, pageController: pageController)//property name
        ],
      ),
    );
  }
}
