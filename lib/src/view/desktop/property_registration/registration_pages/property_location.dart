import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class PropertyLocationPage extends StatelessWidget {
  final int gotToNextPage;
  final int goToBackPage;
  final PageController pageController;
  const PropertyLocationPage({
    super.key,
    required this.gotToNextPage,
    required this.goToBackPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.02),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.03, 0.0),
                  Text('Pin the location of your property in the map', style: largeTextStyleBold),
                  sizedBox(height * 0.02, width),
                  Text(
                      "Click on the map below to pin your property location. Copy the link and paste it in the field. This will be the location shown to guests on our site. Adjust the map to make sure the pin is in the correct spot.",
                      style: smallTextStyle),
                  sizedBox(height * 0.04, 0.0),
                  InkWell(
                    onTap: () {
                      person.launchMaps('37.7749', '-122.4194');
                    },
                    child: CustomContainer(
                      boxShadow: false,
                      width: width,
                      height: height * 0.5,
                      image: const DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/google map image.png')),
                    ),
                  ),
                  sizedBox(height * 0.05, 0.0),
                  Text("Paste the pinned location link from Google Maps here", style: smallTextStyle),
                  sizedBox(height * 0.01, 0.0),
                  CustomTextField(
                    labelText: "Paste the copied link here",
                    onChanged: (value) {
                      person.setpropertyLocationMapLink(value);
                    },
                    borderRadius: 10,
                    borderSide: const BorderSide(color: Colors.lightBlueAccent),
                    enabledBorder: BorderSide(color: Colors.grey.shade300),
                  ),
                  sizedBox(height * 0.03, 0.0),
                ],
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Consumer<RegistrationProvider>(
              builder: (context, person, child) => Row(
                children: [
                  // Back Button
                  backButton(height, width, () {
                    person.goToPage(goToBackPage, pageController);
                  }),
                  sizedBox(0.0, width * 0.005),
                  //Continue Button
                  continueButton(
                    height,
                    width,
                    person.propertyLocationMapLink != "",
                    () {
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
