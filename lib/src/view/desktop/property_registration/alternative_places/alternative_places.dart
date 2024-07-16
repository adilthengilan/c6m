import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places4.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/availabilty.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/non_refundable_rate.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_listing.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/setup_weekly_plan.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/registration_menu.dart';
import 'package:provider/provider.dart';

class AlternativePlaces extends StatelessWidget {
  const AlternativePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final placesProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: placesProvider.placesPageController,
        children: [
          Availability(),
          // HomeStayPage1(), // What can guests book 2 options just select one
          // HotelPage1(jumPage: null, pageController: null,), // here we can use hotel page1 grid view or seperate this
          Places4(), // Multiple or one container
          // ApartmentPage2(goToPage: , pageController: pageController)// sound like our property or not?
        ],
      ),
    );
  }
}
