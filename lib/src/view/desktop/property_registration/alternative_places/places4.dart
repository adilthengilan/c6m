import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Places4 extends StatelessWidget {
  const Places4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            SizedBox(
              width: width * 0.3,
              child: Text(
                'How many campgrounds are you listing?',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            for (int i = 0; i < 2; i++)
              Padding(
                padding: EdgeInsets.only(bottom: i == 0 ? height * 0.04 : 0),
                child: Consumer<RegistrationProvider>(
                  builder: (context, person, child) => GestureDetector(
                    onTap: i == 0
                        ? () {
                            person.setNumberProperties(1);
                          }
                        : () {
                            person.setNumberProperties(2);
                          },
                    child: CustomContainer(
                      height: height * 0.13,
                      width: width * 0.3,
                      border: Border.all(
                          color: i == 0 && person.numberofProperty == 1 ||
                                  i == 1 && person.numberofProperty > 1
                              ? Colors.deepPurpleAccent
                              : Colors.transparent),
                      color: Colors.white,
                      boxShadow: true,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width * 0.02),
                          Icon(
                            Icons.house_outlined,
                            color: i == 0
                                ? Colors.orangeAccent.shade100
                                : Colors.pinkAccent.shade100,
                            size: height * 0.06,
                          ),
                          SizedBox(width: width * 0.02),
                          SizedBox(
                            width: width * 0.200,
                            child: Text(
                              i == 0
                                  ? 'One campground with one or multiple rooms that guests can book'
                                  : 'Multiple campgrounds with one or multiple rooms that guests can book',
                              style: smallTextStyle,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            SizedBox(
              height: height * 0.02,
              width: width * 0.01,
            ),

            sizedBox(height * 0.02, 0.0),
            //Number Input [Number of Property] Taking Count of property
            Consumer<RegistrationProvider>(
                builder: (context, person, child) => person.numberofProperty > 1
                    ? Column(
                        children: [
                          Row(
                            children: [
                              CustomContainer(
                                boxShadow: false,
                                height: height * 0.055,
                                width: width * 0.06,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.055,
                                      width: width * 0.043,
                                      child: CustomTextField(
                                        labelText: '${person.numberofProperty}',
                                        labelTextStyle: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        borderRadius: 10,
                                        controller:
                                            person.numberofPropertycontroller,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.045,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Provider.of<RegistrationProvider>(
                                                        context,
                                                        listen: false)
                                                    .increaseNumberProperty();
                                              },
                                              child: Icon(
                                                  Icons.keyboard_arrow_up,
                                                  size: height * 0.022)),
                                          InkWell(
                                              onTap: () {
                                                Provider.of<RegistrationProvider>(
                                                        context,
                                                        listen: false)
                                                    .decreaseNumberProperty();
                                              },
                                              child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: height * 0.022)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox()),
            sizedBox(height * 0.02, 0.0),
            //Text Button for [Continue]
            SizedBox(
              height: height * 0.055,
              width: width * 0.25,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: person.numberofProperty < 1
                        ? Colors.grey.shade100
                        : Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  if (person.numberofProperty > 0) {
                    person.nextPage(1);
                  }
                },
                child: Text('Continue', style: smallTextStylewhiteBold),
              ),
            ),
            sizedBox(height * 0.1, width),
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
