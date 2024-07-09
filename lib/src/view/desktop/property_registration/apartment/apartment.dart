import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_2.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/aprtment_page_3.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class Apartment extends StatelessWidget {
  const Apartment({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: backgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: person.apartmentPagecontroller,
        children: [
          ApartmentPage1(),
          ApartmentPage2(),
          ApartmentPage3(),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.06, 0.0),
                CustomContainer(
                        boxShadow: true,
                        height: height * 0.75,
                        width: width * 0.35,
                        padding: EdgeInsets.symmetric(vertical: height * 0.02,horizontal: width * 0.02),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          sizedBox(height * 0.03, 0.0),
                          Text("What's the name of your place?",style: largeTextStyleBold),
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
                              Text('Country/region',style: smallTextStyleBold),
                              sizedBox(height * 0.01, 0.0),
                              SizedBox(
                                height: height * 0.055,
                                width: index == 2 ? width * 0.1 : width,
                                child: Consumer<RegistrationProvider>(
                                    builder: (context, person, child) => 
                                    CustomTextField(
                                      labelText: '', 
                                      onChanged: (value) {
                                      },
                                      borderRadius: 10,
                                      borderSide: const BorderSide(color: Colors.lightBlueAccent),
                                      enabledBorder:  BorderSide(color: Colors.grey.shade300),
                                  ),
                                )
                              ),
                              sizedBox(height * 0.035, 0.0),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox(height * 0.02, 0.0),
                Row(
                  children: [
                    continueButton(
                      height,
                      width,
                      person,
                      () {
                      person.goToPage(4);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}