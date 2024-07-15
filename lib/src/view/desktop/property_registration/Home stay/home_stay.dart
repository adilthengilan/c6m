import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Home%20stay/home_stay_page1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Hotel/hotel_page1.dart';
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
        children:  [
          HomeStayPage1(jumPage: 1, pageController: homestay.homeStayController,), // select one or either
          HotelPage1(jumPage: 2, pageController: homestay.homeStayController,), //grid view listed options
          // ApartmentPage2(goToPage: goToPage, pageController: pageController)//multiple options or either choose
          // ApartmentPage3(goToPage: goToPage, backToPage: backToPage, pageController: pageController)//sounds like your property
          //property name
        ],
      ),
    );
  }
}
