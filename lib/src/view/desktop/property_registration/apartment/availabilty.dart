import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/availability_provider.dart';
import 'package:flutter_application_1/src/view%20model/login_provider.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/Common%20widgets/common_widgets.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_details.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Availability extends StatelessWidget {
  const Availability({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController webcontroller = TextEditingController();
    final availability =
        Provider.of<RegistrationProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01),
            Text(
              "Availability",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomContainer(
              boxShadow: true,
              width: width * 0.400,
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.01, left: width * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("When is the first date that guests can check in?",
                        style: smallTextStyleBold),
                    SizedBox(height: height * 0.02),
                    Consumer<AvailabilityProvider>(
                      builder: (context, availabilityProvider, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile<bool>(
                                  title: Text("As soon as possible",
                                      style: smallTextStyle),
                                  value: true,
                                  groupValue:
                                      availabilityProvider.asSoonAsPossible,
                                  onChanged: (value) {
                                    availabilityProvider
                                        .setAsSoonAsPossible(value!);
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<bool>(
                                  title: Text("On a specific date",
                                      style: smallTextStyle),
                                  value: false,
                                  groupValue:
                                      availabilityProvider.asSoonAsPossible,
                                  onChanged: (value) {
                                    availabilityProvider
                                        .setAsSoonAsPossible(value!);
                                  },
                                ),
                              ),
                            ],
                          ),
                          if (!availabilityProvider.asSoonAsPossible)
                            TableCalendar(
                              firstDay: DateTime.utc(2023, 7, 1),
                              lastDay: DateTime.utc(2024, 12, 31),
                              focusedDay: availabilityProvider.selectedDate,
                              selectedDayPredicate: (day) => isSameDay(
                                  day, availabilityProvider.selectedDate),
                              onDaySelected: (selectedDay, focusedDay) {
                                availabilityProvider
                                    .setSelectedDate(selectedDay);
                              },
                              calendarFormat: CalendarFormat.month,
                              calendarStyle: CalendarStyle(
                                todayTextStyle: smallTextStylewhiteBold,
                                todayDecoration: BoxDecoration(
                                    color: Color.fromARGB(232, 86, 64, 255),
                                    borderRadius: BorderRadius.circular(10)),
                                selectedTextStyle: smallTextStylewhiteBold,
                                selectedDecoration: BoxDecoration(
                                    color: Color.fromARGB(237, 50, 255, 241),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              headerStyle: HeaderStyle(
                                titleTextStyle: smallTextStyleBold,
                                titleCentered: true,
                                formatButtonVisible: false,
                                leftChevronVisible: true,
                                rightChevronVisible: true,
                              ),
                            ),
                          // Divider(),
                          if (!availabilityProvider.asSoonAsPossible)
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: Text(
                                  "Guests can start booking right away, but the first available check-in date will be ${availabilityProvider.selectedDate.toLocal().toShortDateString()}.",
                                  style: smallTextStyle),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedbox(height * 0.06, width),
            Consumer<RegistrationProvider>(
                builder: (context, availability, child) {
              return CustomContainer(
                boxShadow: true,
                color: backgroundColor,
                width: width * 0.600,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.06,
                      left: width * 0.02,
                      bottom: height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To help you start earning, we automatically make your property available for bookings for up to 18 months – excluding the days you import marked as unavailable. You can manage your availability and make dates unavailable for bookings after registration.",
                        style: smallTextStyle,
                      ),
                      sizedbox(height * 0.02, width),
                      Text(
                        "Want to sync your availability with Airbnb?",
                        style: mediumTextStyleBold,
                      ),
                      sizedbox(height * 0.01, width),
                      Text(
                        "You'll avoid double bookings by syncing calendars. It will also help you get your property listed on Booking.com and open for bookings 80% faster.",
                        style: greenTextStyle,
                      ),
                      sizedbox(height * 0.04, width),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text(
                                "Yes, I’ll import unavailable dates from another website"),
                            value: 1,
                            groupValue: availability.selectedRadio,
                            onChanged: (int? value) {
                              availability.setSelectedRadio(value!);
                            },
                          ),
                          //=================================================== web link adding============================================================
                          if (availability.selectedRadio == 1)
                            CustomContainer(
                              boxShadow: true,
                              color: backgroundColor,
                              height: height * 0.23,
                              width: width * 0.8,
                              child: Center(
                                child: CustomContainer(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 228, 228, 228)),
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: false,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        width * 0.02,
                                        height * 0.02,
                                        width * 0.02,
                                        height * 0.02),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        sizedbox(height * 0.02, width),
                                        Text(
                                          "Paste your iCal link here",
                                          style: smallTextStyleBold,
                                        ),
                                        sizedbox(height * 0.01, width),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: AppTextField(
                                                controller: webcontroller,
                                                hintText:
                                                    'Enter dates from another website',
                                                width: width,
                                                height: height,
                                              ),
                                            ),
                                            sizedbox(
                                                height * 0.01, width * 0.01),
                                            CustomContainer(
                                              height: height * 0.06,
                                              width: width * 0.05,
                                              borderRadius:
                                                  BorderRadius.circular(07),
                                              color: Color.fromARGB(
                                                  255, 88, 19, 168),
                                              boxShadow: false,
                                              child: Center(
                                                child: Text(
                                                  "Import",
                                                  style: smallTextStylewhite,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: height * 0.01),
                                        Text(
                                          "Where do I find my iCal link?",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          RadioListTile(
                            title: Text(
                                "Yes, I’ll connect with a Channel Manager"),
                            value: 2,
                            groupValue: availability.selectedRadio,
                            onChanged: (int? value) {
                              availability.setSelectedRadio(value!);
                            },
                          ),
                          if (availability.selectedRadio == 2)
                            CustomContainer(
                              border: Border.all(
                                  color: Color.fromARGB(255, 32, 74, 1)),
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: false,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(width * 0.02,
                                    height * 0.02, width * 0.02, height * 0.02),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.greenAccent,
                                        size: 13,
                                      ),
                                      sizedbox(height * 0.01, width * 0.01),
                                      Text(
                                        "You can connect with a Channel Manager after your registration is complete – continue to the next step.",
                                        style: greenTextStyle,
                                      )
                                    ]),
                              ),
                            ),
                          RadioListTile(
                            title: Text("No, I won’t sync my availability"),
                            value: 3,
                            groupValue: availability.selectedRadio,
                            onChanged: (int? value) {
                              availability.setSelectedRadio(value!);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }),
            sizedbox(height * 0.06, width),
            CustomContainer(
              width: width * 0.600,
              boxShadow: true,
              color: backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * 0.03,
                    left: width * 0.02,
                    bottom: height * 0.03),
                child: Consumer<RegistrationProvider>(
                    builder: (context, registrationProvider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Do you want to allow 30+ night stays?",
                        style: mediumTextStyleBold,
                      ),
                      sizedbox(height * 0.02, width),
                      Text(
                        "Allowing guests to stay for up to 90 nights can help you fill your calendar and tap into the trend of guests working remotely.",
                        style: smallTextStyle,
                      ),
                      sizedbox(height * 0.02, width),
                      Text(
                        "Will you accept reservations for stays over 30 nights?",
                        style: smallTextStyleBold,
                      ),
                      //======================================================= Radiao Buttons ====================================
                      RadioButtons(
                        groupValue: registrationProvider.selectRadioIndex == 1,
                        onChanged1: (value) {
                          registrationProvider.setSelectRadioIndex(1);
                        },
                        onChanged2: (value) {
                          registrationProvider.setSelectRadioIndex(0);
                        },
                        text1: 'Yes',
                        text2: 'No',
                      ),
                      SizedBox(height: height * 0.05),
                      if (availability.acceptReservationsOver30Nights)
                        Container(
                          width: width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'What\'s the maximum number of nights you want guests to be able to book?',
                                  style: smallTextStyleBold),
                              SizedBox(height: height * 0.02),
                              TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  registrationProvider.setMaxNightsPreferred(
                                      int.tryParse(value) ?? 0);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter number of nights',
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class RadioButtons extends StatelessWidget {
  final bool groupValue;
  final String text1;
  final String text2;
  final void Function(bool?) onChanged1;
  final void Function(bool?) onChanged2;
  const RadioButtons({
    super.key,
    required this.groupValue,
    required this.onChanged1,
    required this.onChanged2, required this.text1, required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<bool>(
            activeColor: Colors.lightBlueAccent,
            value: true,
            groupValue: groupValue,
            onChanged: onChanged1),
         Text(
          text1,
          style: TextStyle(fontSize: 12),
        ),
        sizedBox(0.0, 20),
        Radio<bool>(
            activeColor: Colors.lightBlueAccent,
            value: false,
            groupValue: groupValue,
            onChanged: onChanged2),
         Text(
          text2,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
