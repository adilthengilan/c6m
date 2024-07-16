import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/availability_provider.dart';
import 'package:flutter_application_1/src/view%20model/login_provider.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class ApartmentPage5 extends StatelessWidget {
  const ApartmentPage5({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
              height: height * 0.90,
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
                          Divider(),
                          // if (!availabilityProvider.asSoonAsPossible)
                          TableCalendar(
                            firstDay: DateTime.utc(2023, 7, 1),
                            lastDay: DateTime.utc(2024, 12, 31),
                            focusedDay: availabilityProvider.selectedDate,
                            selectedDayPredicate: (day) => isSameDay(
                                day, availabilityProvider.selectedDate),
                            onDaySelected: (selectedDay, focusedDay) {
                              availabilityProvider.setSelectedDate(selectedDay);
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
                          Divider(),
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
          ],
        ),
      ),
    );
  }
}
