import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class ApartmentPage4 extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const ApartmentPage4({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                    padding: EdgeInsets.symmetric(vertical: height * 0.03,horizontal: width * 0.02),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      sizedBox(height * 0.03, 0.0),
                      Text("Where is the property you're listing?",style: largeTextStyleBold),
                      sizedBox(height * 0.02, 0.0),
                      SizedBox(
                        width: width  * 0.3,
                        child: Text(
                        'We may send a letter to confirm the location of your property, '
                        'so make sure that the address is correct – it’s difficult to make changes to it later.',
                        style: smallTextStyle,
                        ),
                      ),
                      sizedBox(height* 0.08, 0.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(4, (index) => 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(index == 0? 'Country/region' : index == 1? 'Street name and house number' : index == 2? 'Post Code' : 'City',style: smallTextStyle),
                          sizedBox(height * 0.01, 0.0),
                          SizedBox(
                            height: height * 0.055,
                            width: index == 2 ? width * 0.1 : width,
                            child: Consumer<RegistrationProvider>(
                                builder: (context, person, child) => 
                                CustomTextField(
                                  labelText: '', 
                                  onChanged: 
                                  index == 0 ? (country) {
                                    person.setPropertyCountry(country);
                                  }: 
                                  index == 1? (street) {
                                    person.setPropertyStreet(street);
                                  }: 
                                  index == 2? (postCode) {
                                    person.setPropertyPostCode(postCode);
                                  }:
                                   (city) {
                                    person.setPropertyCity(city);
                                   }, 
                                  borderRadius: 10,
                                  borderSide: const BorderSide(color: Colors.lightBlueAccent),
                                  enabledBorder:  BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                          sizedBox(height * 0.035, 0.0),
                        ]
                      ),
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
              person.goToPage(backToPage, pageController);
              person.propertyCountry = '';
              person.propertyStreetName = '';
              person.propertyCity = '';
              person.propertyPostCode = '';
              }),
              sizedBox(0.0, width * 0.02),
              //Continue Button
              continueButton(
              height, width, 
              person.propertyCountry != '' &&
              person.propertyStreetName != '' &&
              person.propertyPostCode != '' &&
              person.propertyCity != '',
              (){
                person.goToPage(goToPage, pageController);
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