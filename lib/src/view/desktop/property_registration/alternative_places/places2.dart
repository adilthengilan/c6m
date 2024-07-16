import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Places2 extends StatelessWidget {
  const Places2({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hotel = Provider.of<RegistrationProvider>(context);

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
            //============================================  containers for choose which category =======================================================================
            Container(
              child: Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<RegistrationProvider>(
                      builder: (context, hotel, child) => GestureDetector(
                        onTap: () {
                          // hotel.selectOption();
                        },
                        child: CustomContainer(
                          boxShadow: true,
                          color: backgroundColor,
                          height: height * 0.30,
                          width: width * 0.250,
                          borderRadius: BorderRadius.circular(05),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.03,
                                left: width * 0.01,
                                right: width * 0.01),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      index == 0
                                          ? 'Campground'
                                          : index == 1
                                              ? 'Boat'
                                              : index == 2
                                                  ? 'Luxury tent'
                                                  : 'City',
                                      style: largeTextStyleBold),
                                  sizedBox(height * 0.03, width * 0.01),
                                  SizedBox(
                                    width: width * 0.300,
                                    child: Text(
                                        index == 0
                                            ? 'Accommodations offering cabins or bungalows alongside areas for camping or campers, with shared facilities or recreational activities'
                                            : index == 1
                                                ? 'Commercial travel accommodations located on a boat'
                                                : index == 2
                                                    ? 'Tents with fixed beds and some services, located in natural surroundings'
                                                    : 'City',
                                        style: smallTextStyle),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
