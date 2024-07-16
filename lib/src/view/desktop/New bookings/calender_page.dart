import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/feautures_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

bool isDarkMode = false;

class BookingCalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: width * 0.18,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Select Dates',
            style: isDarkMode ? smallTextStylewhiteBold : smallTextStylewhite),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: isDarkMode
                          ? Color.fromARGB(255, 24, 24, 24)
                          : Color.fromARGB(255, 240, 240, 240),
                      blurRadius: 3,
                    ),
                  ],
                  color: isDarkMode
                      ? Color.fromARGB(255, 3, 3, 3)
                      : backgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  7,
                  (index) {
                    List<String> Days = [
                      'Sat',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sun',
                    ];
                    return Text(Days[index],
                        style:
                            isDarkMode ? smallTextStylewhite : smallTextStyle);
                  },
                ),
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            ListView.builder(
              itemCount: 12,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (BuildContext context, int index) {
                final focusedDay =
                    DateTime.now().add(Duration(days: index * 30));
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                          // DateFormat('MMMM y').format(focusedDay),
                          //   style: isDarkMode
                          //       ? smallTextStylewhite
                          //       : smallTextStylewhite,
                          ""),
                    ),
                    sizedBox(height * 0.02, 0.0),
                    Consumer<FeaturesProvider>(
                      builder: (context, calendar, child) => TableCalendar(
                        rowHeight: height * 0.07,
                        headerVisible: false,
                        daysOfWeekVisible: false,
                        firstDay: calendar.toDayDate,
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: focusedDay,
                        calendarFormat: CalendarFormat.month,
                        availableCalendarFormats: const {
                          CalendarFormat.month: 'Month',
                        },
                        selectedDayPredicate: (day) {
                          return calendar.selectedDates.contains(day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          calendar.onSelected(selectedDay, context);
                        },
                        calendarStyle: CalendarStyle(
                          todayTextStyle:
                              isDarkMode ? smallTextStylewhite : smallTextStyle,
                          todayDecoration:
                              BoxDecoration(color: Colors.transparent),
                          rangeEndTextStyle: smallTextStylewhiteBold,
                          disabledTextStyle: TextStyle(color: Colors.grey),
                          defaultTextStyle:
                              isDarkMode ? smallTextStylewhite : smallTextStyle,
                          weekendTextStyle:
                              isDarkMode ? smallTextStylewhite : smallTextStyle,
                          selectedDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 78, 246, 162),
                                Color.fromARGB(255, 73, 204, 211),
                              ],
                            ),
                          ),
                          outsideDaysVisible: false,
                        ),
                        availableGestures: AvailableGestures.all,
                      ),
                    ),
                    sizedBox(height * 0.03, 0.0),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: height * 0.11,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Consumer<FeaturesProvider>(
          builder: (context, calendar, child) => InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 66, 230, 148),
                    Color.fromARGB(255, 59, 178, 184),
                  ],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Provider.of<FeaturesProvider>(context, listen: false)
                                .selectedDates
                                .length >
                            1
                        ? Row(
                            children: [
                              Text(
                                '${calendar.checkingDate} - ${calendar.checkoutDate}',
                                style: smallTextStylewhite,
                              ),
                              sizedBox(0.0, width * 0.02),
                              Text(
                                "${calendar.selectedDates.length - 1}",
                                style: smallTextStylewhite,
                              ),
                              sizedBox(0.0, width * 0.02),
                              // AppIcon(
                              //   iconData: Icons.nights_stay,
                              //   color: Colors.white,
                              //   height: height * 0.025,
                              // ),
                            ],
                          )
                        : Text('Select', style: smallTextStylewhite),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
