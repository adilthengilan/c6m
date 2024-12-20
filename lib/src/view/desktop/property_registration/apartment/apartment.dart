// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
// import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_2.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_4.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/aprtment_page_3.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/availlability.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/final_page.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/goods_services_tax.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/host_profile.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/image_uploader_Page.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/price_per_night.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_aminities.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_detailes.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_listing.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_location.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_rules.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_services.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/Rate_Planes/rate_plans.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/receive_bookings.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/staff_language_selection.dart';
// import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';

// class Apartment extends StatelessWidget {
//   const Apartment({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final person = Provider.of<RegistrationProvider>(context, listen: false);
//     return Scaffold(
//       appBar: RegistrationAppBar(height, width),
//       backgroundColor: backgroundColor,
//       body: PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: person.apartmentPagecontroller,
//         children: [
//           MultiplePropertiesConfirmationPage(goToPage: 1, pageController: person.apartmentPagecontroller, stayPalceName: 'apartments'),
//           ApartmentPage2(goToPage: 2, pageController: person.apartmentPagecontroller),
//           PropertyNamePage(goToPage: 3, backToPage: 1, pageController: person.apartmentPagecontroller),
//           PropertyAddressPage(goToPage: 4, backToPage: 2, pageController: person.apartmentPagecontroller),
//           PropertyLocationPage(gotToNextPage: 5, goToBackPage: 3, pageController: person.apartmentPagecontroller),
//           PropertyCapacityDetailesPage(goToPage: 6, backToPage: 4, pageController: person.apartmentPagecontroller),
//           PropertyAminities(goToPage: 7, backToPage: 5, pageController: person.apartmentPagecontroller),
//           PropertyServices(goToPage: 8, backToPage: 6, pageController: person.apartmentPagecontroller),
//           StaffLanguageSelectionPart(goToPage: 9, backToPage: 7, pageController: person.apartmentPagecontroller),
//           PropertyRules(goToPage: 10, backToPage: 8, pageController: person.apartmentPagecontroller),
//           HostProfilePage(goToPage: 11, backToPage: 9, pageController: person.apartmentPagecontroller),
//           ImageUploader(goToPage: 12, backToPage: 10, pageController: person.apartmentPagecontroller),
//           ReceiveBookings(goToPage: 13, backToPage: 11, pageController: person.apartmentPagecontroller),
//           PricePerNight(goToPage: 14, backToPage: 12, pageController: person.apartmentPagecontroller),
//           RatePlans(goToPage: 15, backToPage: 13, pageController: person.apartmentPagecontroller),
//           Availability(goToPage: 16, backToPage: 14, pageController: person.apartmentPagecontroller),
//           GoodsandServicesTsx(goToPage: 17, backToPage: 15, pageController: person.apartmentPagecontroller),
//           Finalpage(goToPage: 18, backToPage: 16, pageController: person.apartmentPagecontroller), //page 13
//           PropertyListing(backToPage: 17, pageController: person.apartmentPagecontroller),

//           /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//         ],
//       ),
//     );
//   }
// }
