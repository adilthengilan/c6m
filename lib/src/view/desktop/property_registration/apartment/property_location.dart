import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class PropertyLocationPage extends StatelessWidget {
  final int gotToNextPage;
  final int goToBackPage;
  final PageController pageController;
   const PropertyLocationPage({
    super.key,
    required this.gotToNextPage,
    required this.goToBackPage, required this.pageController,
    });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context,listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            CustomContainer(
              boxShadow: true,
              height: height * 0.75,
              width: width * 0.35,
              padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.02),
              color: Colors.white,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.03, 0.0),
                  Text('Pin the location of your property',style: largeTextStyleBold),
                  sizedBox(height * 0.02, width),
                  Text("This is the location we'll show to guests on our site. Move the map to find the exact location of your property then click to drop the pin.",style: smallTextStyle),
                  sizedBox(height * 0.04, 0.0),
                  InkWell(
                    onTap: (){
                      person.launchMaps('37.7749', '-122.4194');
                    },
                    child: CustomContainer(
                      boxShadow: false,
                      width: width,
                      height: height * 0.5,
                      image: DecorationImage(
                        fit : BoxFit.cover,
                        image: AssetImage('assets/images/google map image.png')),
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Consumer<RegistrationProvider>(
             builder: (context, person, child) => 
             Row(
              children: [
                // Back Button
                backButton(
                   height, width, 
                    (){
                    person.goToPage(goToBackPage, pageController);
                    }),
                    sizedBox(0.0, width * 0.02),
                    //Continue Button
                    continueButton(
                    height, width, 
                    true,
                    (){
                    person.goToPage(gotToNextPage, pageController);
                  },
                ),
              ],
            ),
          ),
          sizedBox(height * 0.2, width),
          ],
        ),
      ),
    );
  }
}
