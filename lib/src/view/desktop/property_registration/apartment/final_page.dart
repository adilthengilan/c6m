import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_4.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/aprtment_page_3.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/image_uploader_Page.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_aminities.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_detailes.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_location.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_rules.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_services.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/staff_language_selection.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class Finalpage extends StatelessWidget {
  const Finalpage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
    return PageView(
      controller: person.finalPagePageviewcontroller,
      children: [ 
        SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.06, 0.0),
            CustomContainer(
              boxShadow: false,
              height: height * 0.75,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(4, (index) =>
                CustomContainer(
                height: height * 0.15,
                width: width * 0.55,
                boxShadow: true,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.015),
                borderRadius: BorderRadius.circular(8),
                margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  children: [
                    Icon(index == 0?
                    Icons.check_circle_outline :
                    index == 1? Icons.bed_outlined :
                    index == 2? Icons.image_outlined :
                    Icons.credit_score_outlined,
                    color: index == 0? Colors.lightBlueAccent.shade100 :Colors.grey.shade800,size: height * 0.04),
                    sizedBox(0.0, width * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(index == 0? 'Step 1' : index == 1? 'Step 2' : index == 2? 'Step 3' : 'Step 4',style: smallTextStyle),
                        sizedBox(height * 0.006, 0.0),
                        Text(index == 0? 'Property details' : index == 1? 'Rooms' : index == 2? 'Photos' : 'Final steps',style: mediumTextStyleBold),
                        sizedBox(height * 0.006, 0.0),
                        Text(index == 0?
                         'The basics. Add your property name, address, facilities and more.'
                         : index == 1? 'Tell us about your first room. Once you’ve set one up you can add more.'
                         : index == 2? 'Share some photos of your property so guests know what to expect.'
                         : 'Set up payments and invoicing before you open for bookings.',style: smallTextStyle),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(color: index == 1 ||index == 2? Colors.deepPurpleAccent : Colors.white),
                        backgroundColor: index == 2? Colors.deepPurpleAccent : Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01,vertical: height * 0.025),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                      onPressed: () {
                        index == 0?  person.goToPage(1,person.finalPagePageviewcontroller) : index == 1? person.goToPage(2,person.finalPagePageviewcontroller): index == 2? person.goToPage(9,person.finalPagePageviewcontroller): Navigator.push(context, MaterialPageRoute(builder: (context) => const DesktopView(),));
                      },
                       child: Text(index == 0? 'Edit' : index == 1? 'Add Room': index == 2? 'Add Photos' : 'Add final details',style: GoogleFonts.montserrat(
                        color:index == 0? Colors.deepPurpleAccent :  index == 3? Colors.grey :index == 2? Colors.white : Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                       ),
                      ),
                    ),
                  ],
                ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
      ApartmentPage3(goToPage: 2, backToPage: 0, pageController: person.finalPagePageviewcontroller),
      ApartmentPage4(goToPage: 3, backToPage: 1, pageController: person.finalPagePageviewcontroller),
      PropertyLocationPage(gotToNextPage: 4, goToBackPage: 2, pageController: person.finalPagePageviewcontroller),
      PropertyDetailes(goToPage: 5, backToPage: 3, pageController: person.finalPagePageviewcontroller),
      PropertyAminities(goToPage: 6, backToPage: 4, pageController: person.finalPagePageviewcontroller),
      PropertyServices(goToPage: 7, backToPage: 5, pageController: person.finalPagePageviewcontroller),
      StaffLanguageSelectionPart(goToPage: 8, backToPage: 6, pageController: person.finalPagePageviewcontroller),
      PropertyRules(goToPage: 0, backToPage: 7, pageController: person.finalPagePageviewcontroller),
      //
      ImageUploader(goToPage: 0, backToPage: 0, pageController: person.finalPagePageviewcontroller),
    ],
  );    
  }
}