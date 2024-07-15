import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/alternative_place.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/homestay.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/hotel.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class PropertyRegistrationMenu extends StatelessWidget {
  const PropertyRegistrationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: RegistrationAppBar(height, width),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.08, top: height * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List your property on Tuchtrip and start hosting guests right away!',
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26),
            ),
            sizedBox(height * 0.02, 0.0),
            Text(
              'To get started, choose the type of property you want to list on Booking.com',
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            sizedBox(height * 0.08, 0.0),
            //==================================================== Property Lists ================================================================
            Row(
              children: List.generate(4, (index) => Padding(
                padding: EdgeInsets.only(right: width * 0.03),
                child: GestureDetector(
                  onTap: index == 0?  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Apartment()));
                  } : index == 1? () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeStay()));
                  } : index == 2? (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const Hotel()));
                  } :  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AlternativePlaces()));
                  },
                  child: CustomContainer(
                    boxShadow: true,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height * 0.035),
                    borderRadius: BorderRadius.circular(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedBox(height * 0.01, 0.0),
                        Icon(index == 0? Icons.apartment_outlined : index == 1? Icons.home_outlined : index == 2? Icons.other_houses_outlined : Icons.houseboat_outlined,
                        size: height * 0.08,
                        color: index == 0? Colors.purpleAccent.shade100 : index == 1? Colors.greenAccent.shade100 : index == 2? Colors.orangeAccent.shade100 : Colors.pinkAccent.shade100),
                        sizedBox(height * 0.02, 0.0),
                        SizedBox(
                          width: width * 0.12,
                          child: Center(
                            child: Text(index == 0?'Apartments' : index == 1? 'Homes' : index == 2? 'Hotel' : 'Alternative places',style: mediumTextStyleBold)),
                        ),
                        sizedBox(height * 0.01, 0.0),
                        SizedBox(width: width * 0.12,
                        child: Center(
                          child: Text('Furnished and self-catering accommodation, where guests rent the entire place.',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center),
                           ),
                         ),
                         sizedBox(height * 0.03, 0.0),
                         CustomContainer(
                          boxShadow: true,
                          height: height * 0.045,
                          width: width * 0.13,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
                            ),
                            onPressed: index == 0?  () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Apartment()));
                            } : index == 1? () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeStay()));
                            } : index == 2? (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Hotel()));
                            } :  (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AlternativePlaces()));
                            },
                            child: Text(index  == 0 ? 'Post Your Property' :'Coming Soon..',
                            style: smallTextStylewhite),
                          ),
                         ),
                       ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar RegistrationAppBar(double height, double width) {
  return AppBar(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        SizedBox(
          width: width * 0.18,
          child: Text('Tuchtrip', style: largeTextStyleBold),
        ),
      ],
    ),
    actions: [
      Text('Help', style: smallTextStyleBold),
      sizedBox(0.0, width * 0.006),
      CustomContainer(
        boxShadow: false,
        boxShape: BoxShape.circle,
        color: Colors.deepPurpleAccent.shade100,
        border: Border.all(color: Colors.grey.shade100),
        padding: EdgeInsets.all(height * 0.005),
        child: Icon(
          Icons.question_mark_rounded,
          color: Colors.white,
          size: height * 0.02,
        ),
      ),
      sizedBox(0.0, width * 0.02),
      CustomContainer(
        height: height * 0.05,
        width: width * 0.028,
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: false,
        child: Center(
          child: Icon(Icons.person_outline),
        ),
      ),
      SizedBox(width: width * 0.02),
    ],
  );
}
