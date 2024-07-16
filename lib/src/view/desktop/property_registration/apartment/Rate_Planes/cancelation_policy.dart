import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class CancelationPolicy extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const CancelationPolicy({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);

    return Padding(
        padding: EdgeInsets.only(left: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.03, horizontal: width * 0.02),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.03, 0.0),
                  Text("Cancellation policies",
                      style: largeTextStyleBold),
                  sizedBox(height * 0.03, 0.0),
                  Text( 'How many days before arrival can guests cancel their booking for free?',
                      style: smallTextStyleBold),
                  sizedBox(height * 0.03, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, person, child) => Column(
                      children: [
                        Row(
                          children: [
                            for (int index = 0;
                                index < person.days.length;
                                index++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0),
                                child: ChoiceChip(
                                  label: Text(person.days[index]),
                                  selected:
                                      person.freeCancelationButtonIndex ==
                                          index,
                                  onSelected: (bool selected) {
                                    person.setCancellationPeriod(
                                        selected, index);
                                  },
                                  selectedColor: Colors.deepPurpleAccent,
                                  backgroundColor: Colors.grey[50],
                                  labelStyle: TextStyle(
                                    color:
                                        person.freeCancelationButtonIndex ==
                                                index
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        person.freeCancellationDays > 1
                            ? Container(
                                margin:
                                    EdgeInsets.only(top: height * 0.03),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Colors.orangeAccent.shade100),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                    'Allow guests to cancel up to ${person.freeCancellationDays} day(s) before arrival to increase your chances of getting bookings.',
                                    style: smallTextStyle),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  sizedBox(height * 0.025, 0.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline, color: Colors.blue),
                      sizedBox(0.0, width * 0.01),
                      Expanded(
                        child: Text(
                          'Guests love flexibility – free cancellation rates are generally the most booked rates on our site. Get your first booking sooner by allowing guests to cancel up to ${person.freeCancellationDays} days before check-in.',
                        ),
                      ),
                    ],
                  ),
                  sizedBox(height * 0.03, 0.0),
                  Text('Protection against accidental bookings',
                      style: smallTextStyleBold),
                  sizedBox(height * 0.015, 0.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<RegistrationProvider>(
                        builder: (context, person, child) => Row(
                          children: [
                            Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                trackOutlineColor: WidgetStatePropertyAll(Colors.grey.shade600),
                                thumbColor: WidgetStatePropertyAll(Colors.white),
                                activeTrackColor: Colors.blueAccent,
                                inactiveThumbColor: Colors.white,
                                value: person.protectionAgainstAccidentalBookings,
                                onChanged: (value) {
                                  person.setBookingProtection(value);
                                },
                              ),
                            ),
                            sizedBox(0.0, width * 0.006),
                            Text(
                              person.protectionAgainstAccidentalBookings
                                  ? 'On'
                                  : 'Off',
                              style: smallTextStyleBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  sizedBox(height * 0.03, 0.0),
                  Text(
                    'To avoid having to deal with accidental bookings, we automatically waive cancellation fees for guests who cancel within 24 hours of booking.',
                    style: smallTextStyle,
                  ),
                ],
              ),
            ),
            sizedbox(height * 0.03, 0.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    person.goToPage(backToPage, pageController);
                  },
                  child: CustomContainer(
                    boxShadow: true,
                    border: Border.all(color: Colors.grey.shade300),
                    height: height * 0.055,
                    width: width * 0.064,
                    color: Colors.white,
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_arrow_left),
                          SizedBox(width: width * 0.002),
                          Text('Cancel'),
                          SizedBox(width: width * 0.003),
                        ],
                      ),
                    ),
                  ),
                ),
                sizedBox(0.0, width * 0.015),
                continueButton(
                  height,
                  width,
                  true,
                  () {
                    // person.goToPage(goToPage, pageController);
                  },
                )
              ],
            ),
          ],
        ),
      );
  }
}
