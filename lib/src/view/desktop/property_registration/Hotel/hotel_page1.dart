import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelPage1 extends StatelessWidget {
  final int jumPage;
  final PageController pageController;

  const HotelPage1({super.key, required this.jumPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hotel = Provider.of<RegistrationProvider>(context);

    List<Map<String, String>> options = [
      {
        'title': 'Homestay',
        'description':
            'A shared home where the guest has a private room and the host lives and is on site. Some facilities are shared between hosts and guests.'
      },
      {
        'title': 'Hostel',
        'description':
            'Budget accommodations with mostly dorm-style beds and social atmosphere.'
      },
      {
        'title': 'Condo hotel',
        'description':
            'Independent apartments with some hotel facilities like a front desk.'
      },
      {
        'title': 'Capsule Hotel',
        'description':
            'Extremely small units or capsules offering cheap and basic overnight accommodations.'
      },
      {
        'title': 'Country House',
        'description':
            'Private home in the countryside with simple accommodations.'
      },
      {
        'title': 'Farm stay',
        'description': 'Private farm with simple accommodations.'
      },
      {
        'title': 'Bed and Breakfast',
        'description':
            'A small lodging establishment offering overnight accommodation and breakfast.'
      },
      {
        'title': 'Motel',
        'description': 'A roadside hotel designed primarily for motorists.'
      },
      {
        'title': 'Villa',
        'description':
            'A luxurious country residence with spacious accommodations and amenities.'
      },
      {
        'title': 'Guest House',
        'description': 'A private house offering accommodations to guests.'
      },
    ];

    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.06),
            SizedBox(
              width: width * 0.600,
              child: Text(
                  'From the list below, which property category is the best fit for your place?',
                  style: largeTextStyleBold),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.only(right: width * 0.11),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: height * 0.23,
                  crossAxisCount: 3,
                  childAspectRatio: 3.6,
                  crossAxisSpacing: width * 0.02,
                  mainAxisSpacing: height * 0.04,
                ),
                itemCount: hotel.showMoreOptions ? options.length + 1 : 6,
                itemBuilder: (context, index) {
                  if (index == 5 && !hotel.showMoreOptions) {
                    return GestureDetector(
                      onTap: () {
                        hotel.toggleMoreOptions();
                      },
                      child: CustomContainer(
                        height: height * 0.03,
                        width: width * 0.04,
                        color: Colors.white,
                        boxShadow: true,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                'More options',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (index == options.length && hotel.showMoreOptions) {
                    return GestureDetector(
                      onTap: () {
                        hotel.toggleMoreOptions();
                      },
                      child: CustomContainer(
                        height: height * 0.03,
                        width: width * 0.04,
                        color: Colors.white,
                        boxShadow: true,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up_outlined,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                'Less options',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Consumer<RegistrationProvider>(
                        builder: (context, hotel, child) => GestureDetector(
                            onTap: () {
                              hotel.selectOption(options[index]['title']!);
                            },
                            child: CustomContainer(
                              height: height * 0.2,
                              width: width * 0.01,
                              border: Border.all(
                                color: hotel.selectedOption ==
                                        options[index]['title']
                                    ? Colors.deepPurpleAccent
                                    : Colors.transparent,
                              ),
                              color: Colors.white,
                              boxShadow: true,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.02,
                                    top: height * 0.02,
                                    right: width * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(options[index]['title']!,
                                        style: mediumTextStyleBold),
                                    sizedBox(height * 0.02, width),
                                    Text(
                                      options[index]['description']!,
                                      style: smallTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  }
                },
              ),
            ),
            SizedBox(height: height * 0.04),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text(
                              'I don\'t see my property type on the list',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            content: Container(
                              height: height * 0.17,
                              width: width * 0.350,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'That\'s ok  choose the category that\'s most similar to your property. We use this category to help guests find your property.',
                                      style: smallTextStyle),
                                  sizedBox(height * 0.04, width),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.07,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 138, 58, 244),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Got it",
                                          style: smallTextStylewhiteBold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_center_outlined,
                          size: 14,
                          color: Colors.blueAccent,
                        ),
                        Text("I don't see my property type on the list",
                            style: bluetextStyle)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            sizedBox(height * 0.05, width),
            Row(
              children: [
                Container(
                  height: height * 0.10,
                  width: width * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(06)),
                  child: Icon(Icons.arrow_back_ios_new),
                ),
                sizedBox(height * 0.01, width * 0.01),
                Container(
                  height: height * 0.10,
                  width: width * 0.700,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(06)),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: hotel.isOptionSelected
                          ? const Color.fromARGB(255, 133, 64, 251)
                          : Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (hotel.isOptionSelected) {
                        hotel.goTonextPage(2);
                      }
                    },
                    child: Text('Continue',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}

SizedBox continueButton(height, width, isDisabledButton, onPressed) {
  return SizedBox(
    height: height * 0.055,
    width: width * 0.27,
    child: TextButton(
      style: TextButton.styleFrom(
          backgroundColor:
              isDisabledButton ? Colors.grey.shade100 : Colors.deepPurpleAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: onPressed,
      child: Text('Continue', style: smallTextStylewhiteBold),
    ),
  );
}

InkWell backButton(double height, double width, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: CustomContainer(
      boxShadow: true,
      border: Border.all(color: Colors.grey.shade300),
      height: height * 0.055,
      width: width * 0.06,
      color: Colors.white,
      child: const Center(
        child: Icon(Icons.keyboard_arrow_left),
      ),
    ),
  );
}
