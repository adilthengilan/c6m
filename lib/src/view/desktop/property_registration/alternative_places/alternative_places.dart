import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Home%20stay/home_stay_page1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places3.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places4.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places_1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places_5.dart';
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
        children: const [
          HomeStayPage1()
          // Places1(), // What can guests book 2 options just select one
          // Places2(), // here we can use hotel page1 grid view or seperate this
          // Places3(), // page for listing and countinue
          // Places4(), // Multiple or one container
          // Places5(), // country origin page
        ],
      ),
    );
  }
}
