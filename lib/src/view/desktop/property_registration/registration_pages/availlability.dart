import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class Availability extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const Availability({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<RegistrationProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, bottom: height * 0.06),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                boxShadow: true,
                width: width * 0.500,
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.01, left: width * 0.02),
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
                      sizedBox(height * 0.04, width),
                      Text("When is the first date that guests can check in?", style: smallTextStyleBold),
                      SizedBox(height: height * 0.01),
                      Consumer<RegistrationProvider>(
                        builder: (context, person, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<bool>(
                                    title: Text("As soon as possible", style: smallTextStyle),
                                    value: true,
                                    groupValue: person.asSoonAsPossible,
                                    onChanged: (value) {
                                      person.setAsSoonAsPossible(value!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<bool>(
                                    title: Text("On a specific date", style: smallTextStyle),
                                    value: false,
                                    groupValue: person.asSoonAsPossible,
                                    onChanged: (value) {
                                      person.setAsSoonAsPossible(value!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            if (!person.asSoonAsPossible)
                              TableCalendar(
                                firstDay: DateTime.now(),
                                lastDay: DateTime.utc(2100, 12, 31),
                                focusedDay: person.firstDayGuestCanCheckInSelectedDate,
                                selectedDayPredicate: (day) => isSameDay(day, person.firstDayGuestCanCheckInSelectedDate),
                                onDaySelected: (selectedDay, focusedDay) {
                                  person.setSelectedDate(selectedDay);
                                },
                                calendarFormat: CalendarFormat.month,
                                calendarStyle: CalendarStyle(
                                  todayTextStyle: smallTextStyle,
                                  todayDecoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                  selectedTextStyle: smallTextStylewhiteBold,
                                  selectedDecoration: BoxDecoration(color: const Color.fromARGB(237, 50, 255, 241), borderRadius: BorderRadius.circular(10)),
                                ),
                                headerStyle: HeaderStyle(
                                  titleTextStyle: smallTextStyleBold,
                                  titleCentered: true,
                                  formatButtonVisible: false,
                                  leftChevronVisible: true,
                                  rightChevronVisible: true,
                                ),
                              ),
                            if (!person.asSoonAsPossible)
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.02),
                                child: Text(
                                    "Guests can start booking right away, but the first available check-in date will be ${person.firstDayGuestCanCheckInSelectedDate.toLocal().toShortDateString()}.",
                                    style: smallTextStyle),
                              ),
                            sizedBox(height * 0.005, width),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedBox(height * 0.01, width),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<RegistrationProvider>(builder: (context, provider, child) {
                return CustomContainer(
                  boxShadow: true,
                  color: backgroundColor,
                  width: width * 0.500,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.06, left: width * 0.02, bottom: height * 0.02, right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To help you start earning, we automatically make your property available for bookings for up to 18 months – excluding the days you import marked as unavailable. You can manage your provider and make dates unavailable for bookings after registration.",
                          style: smallTextStyle,
                        ),
                        sizedBox(height * 0.03, width),
                        Text(
                          "Want to sync your provider with Airbnb?",
                          style: mediumTextStyleBold,
                        ),
                        sizedBox(height * 0.02, width),
                        Text(
                          "You'll avoid double bookings by syncing calendars. It will also help you get your property listed on TuchTrip.com and open for bookings 80% faster.",
                          style: GoogleFonts.montserrat(color: Colors.green),
                        ),
                        sizedBox(height * 0.04, width),
                        Column(
                          children: [
                            RadioListTile(
                              title: Text(
                                "Yes, I’ll import unavailable dates from another website",
                                style: smallTextStyle,
                              ),
                              value: 1,
                              groupValue: provider.selectThreeAvailability,
                              onChanged: (int? value) {
                                provider.setSelectThreeAvailability(value!);
                              },
                            ),
                            //=================================================== web link adding============================================================
                            if (provider.selectThreeAvailability == 1)
                              CustomContainer(
                                boxShadow: false,
                                color: backgroundColor,
                                height: height * 0.18,
                                width: width * 0.8,
                                child: Center(
                                  child: CustomContainer(
                                    border: Border.all(color: const Color.fromARGB(255, 228, 228, 228)),
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: false,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.02, width * 0.02, height * 0.02),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          sizedBox(height * 0.02, width),
                                          Text(
                                            "Paste your iCal link here",
                                            style: smallTextStyleBold,
                                          ),
                                          sizedBox(height * 0.01, width),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: height * 0.06,
                                                width: width * 0.36,
                                                child: CustomTextField(
                                                  labelText: 'Enter dates from another website',
                                                  controller: provider.webcontroller,
                                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                                  enabledBorder: BorderSide(color: Colors.grey.shade300),
                                                ),
                                              ),
                                              sizedBox(0.0, width * 0.005),
                                              CustomContainer(
                                                height: height * 0.06,
                                                width: width * 0.05,
                                                borderRadius: BorderRadius.circular(07),
                                                color: const Color.fromARGB(255, 88, 19, 168),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            RadioListTile(
                              title: Text(
                                "Yes, I’ll connect with a Channel Manager",
                                style: smallTextStyle,
                              ),
                              value: 2,
                              groupValue: provider.selectThreeAvailability,
                              onChanged: (int? value) {
                                provider.setSelectThreeAvailability(value!);
                              },
                            ),
                            if (provider.selectThreeAvailability == 2)
                              CustomContainer(
                                border: Border.all(color: const Color.fromARGB(255, 228, 228, 228)),
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: false,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.greenAccent,
                                      size: 13,
                                    ),
                                    sizedBox(height * 0.01, width * 0.01),
                                    Text(
                                      "You can connect with a Channel Manager after your registration is complete\n – continue to the next step.",
                                      style: GoogleFonts.montserrat(color: Colors.green),
                                    )
                                  ]),
                                ),
                              ),
                            RadioListTile(
                              title: Text(
                                "No, I won’t sync my provider",
                                style: smallTextStyle,
                              ),
                              value: 3,
                              groupValue: provider.selectThreeAvailability,
                              onChanged: (int? value) {
                                provider.setSelectThreeAvailability(value!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              }),
            ),
            sizedBox(height * 0.01, width),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                width: width * 0.500,
                boxShadow: true,
                color: backgroundColor,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.03, left: width * 0.02, bottom: height * 0.03, right: width * 0.02),
                  child: Consumer<RegistrationProvider>(builder: (context, person, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Do you want to allow 30+ night stays?",
                          style: mediumTextStyleBold,
                        ),
                        sizedBox(height * 0.02, width),
                        Text(
                          "Allowing guests to stay for up to 90 nights can help you fill your calendar and tap into the trend of guests working remotely.",
                          style: smallTextStyle,
                        ),
                        sizedBox(height * 0.04, width),
                        Text(
                          "Will you accept reservations for stays over 30 nights?",
                          style: smallTextStyleBold,
                        ),
                        sizedBox(height * 0.02, width),

                        //======================================================= Radiao Buttons ====================================
                        RadioButtons(
                          groupValue: person.isAllowedOver30nightstays,
                          onChanged1: (value) {
                            person.setAllowedOver30nightstays(value!);
                          },
                          onChanged2: (value) {
                            person.setAllowedOver30nightstays(value!);
                          },
                          text1: 'Yes',
                          text2: 'No',
                        ),
                        if (!person.isAllowedOver30nightstays)
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.04),
                            child: SizedBox(
                              width: width * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('What\'s the maximum number of nights you want guests to be able to book?', style: smallTextStyleBold),
                                  SizedBox(height: height * 0.01),
                                  CustomTextField(
                                    labelText: "Enter number of nights",
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                    enabledBorder: BorderSide(color: Colors.grey.shade300),
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    onChanged: (value) {
                                      person.setMaxReservationNumberOfNights(int.tryParse(value) ?? 0);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(height: height * 0.02),
                      ],
                    );
                  }),
                ),
              ),
            ),
            //=====================================================================================================================
            //=====================================================================================================================
            //=================================================================================================================================================
            //==================================================================== open booking ==============================================================
            //=================================================================================================================================================
            sizedBox(height * 0.03, width),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    provider.goToPage(backToPage, pageController);
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.04,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(06)),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                sizedBox(height * 0.01, width * 0.01),
                Container(
                  height: height * 0.06,
                  width: width * 0.44,
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(06)),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 34, 158, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      provider.goToPage(goToPage, pageController);
                    },
                    child: const Text('Countinue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                sizedBox(height * 0.07, width * 0.01),
              ],
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
    required this.onChanged2,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<bool>(activeColor: Colors.lightBlueAccent, value: true, groupValue: groupValue, onChanged: onChanged1),
        Text(
          text1,
          style: smallTextStyle,
        ),
        sizedBox(0.0, 20),
        Radio<bool>(activeColor: Colors.lightBlueAccent, value: false, groupValue: groupValue, onChanged: onChanged2),
        Text(
          text2,
          style: smallTextStyle,
        ),
      ],
    );
  }
}