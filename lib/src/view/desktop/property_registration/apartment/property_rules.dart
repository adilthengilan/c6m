import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/property_detailes.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class PropertyRules extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const PropertyRules({super.key, required this.goToPage, required this.backToPage, required this.pageController});

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
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.025, horizontal: width * 0.02),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('House rules', style: largeTextStyleBold),
                  sizedBox(height * 0.04, width),
                  Text('What are your check-in and check-out times?',
                      style: mediumTextStyleBold),
                  sizedBox(height * 0.02, 0.0),
                  Text(
                    'Check in',
                    style: smallTextStyleBold
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(2, (index) => 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(index == 0? 'From' : 'Until'),
                                    sizedBox(height * 0.006, 0.0),
                                    SizedBox(
                                      width: width * 0.13,
                                      child: Consumer<RegistrationProvider>(
                                        builder: (context, consumer, child) =>
                                        DropdownButtonFormField<String>(
                                          dropdownColor: Colors.white,
                                        decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                        value: index ==0 ? consumer.checkInFrom: consumer.checkInUntil,
                                        onChanged: (String? newValue) {
                                          index == 0?
                                        consumer.setCheckInFrom(newValue!) : 
                                        consumer.setCheckInUntil(newValue!);
                                        },
                                        items: [
                                            '00:00',
                                            '01:00',
                                            '02:00',
                                            '03:00',
                                            '04:00',
                                            '05:00',
                                            '06:00',
                                            '07:00',
                                            '08:00',
                                            '09:00',
                                            '10:00',
                                            '11:00',
                                            '12:00',
                                            '13:00',
                                            '14:00',
                                            '15:00',
                                            '16:00',
                                            '17:00',
                                            '18:00',
                                            '19:00',
                                            '20:00',
                                            '21:00',
                                            '22:00',
                                            '23:00'
                                          ].map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                           );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            sizedBox(height * 0.03, 0.0),
                            Text('Check out',style: smallTextStyleBold),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(2, (index) => 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(index == 0? 'From' : 'Until'),
                                    sizedBox(height * 0.006, 0.0),
                                    SizedBox(
                                      width: width * 0.13,
                                      child: Consumer<RegistrationProvider>(
                                        builder: (context, consumer, child) =>
                                        DropdownButtonFormField<String>(
                                          dropdownColor: Colors.white,
                                        decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                        value: index == 0? consumer.checkOutFrom : consumer.checkOutUntil,
                                        onChanged: (String? newValue) {
                                          index == 0?
                                           consumer.setCheckOutFrom(newValue!) : 
                                           consumer.setCheckOutUntil(newValue!);
                                        },
                                        items: [
                                            '00:00',
                                            '01:00',
                                            '02:00',
                                            '03:00',
                                            '04:00',
                                            '05:00',
                                            '06:00',
                                            '07:00',
                                            '08:00',
                                            '09:00',
                                            '10:00',
                                            '11:00',
                                            '12:00',
                                            '13:00',
                                            '14:00',
                                            '15:00',
                                            '16:00',
                                            '17:00',
                                            '18:00',
                                            '19:00',
                                            '20:00',
                                            '21:00',
                                            '22:00',
                                            '23:00'
                                          ].map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                           );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            sizedBox(height * 0.04, 0.0),
                            const Divider(),
                            sizedBox(height * 0.03, 0.0),
                            Text('Smoking allowed',style: smallTextStyleBold),
                            sizedBox(height * 0.02, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => 
                    RadioButtons(
                      groupValue: consumer.issmokingAllowed,
                       onChanged1:(value) {consumer.setSmokingAllowed(value);},
                        onChanged2: (value) {consumer.setSmokingAllowed(value);
                              },
                             ),
                            ),
                            sizedBox(height * 0.04, 0.0),
                            Text('Do you allow Pets?',style: smallTextStyleBold),
                            sizedBox(height * 0.02, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => 
                    RadioButtons(
                      groupValue: consumer.isallowPets,
                       onChanged1:(value) {consumer.setPetsAllowed(value);
                       },
                        onChanged2: (value) {consumer.setPetsAllowed(value);
                              },
                             ),
                            ),
                            sizedBox(height * 0.04, 0.0),
                            Text('Parties/events allowed',style: smallTextStyleBold),
                            sizedBox(height * 0.02, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => 
                    RadioButtons(
                      groupValue: consumer.iseventsAllowed,
                       onChanged1:(value) {consumer.setEventAllowed(value);
                       },
                        onChanged2: (value) {consumer.setEventAllowed(value);
                              },
                             ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  sizedBox(height* 0.03, width),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
      Row(
        children: [
          backButton(height, width, (){
            person.goToPage(backToPage, pageController);
          },
          ),
          sizedBox(0.0, width * 0.02),
          continueButton(height, width, true, (){
            person.goToPage(goToPage, pageController);
          })
        ],
      ),
      sizedBox(height *0.2, width),
          ],
        ),
      ),
    );
  }
}
