import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Places1 extends StatelessWidget {
  const Places1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final places = Provider.of<RegistrationProvider>(context, listen: false);
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
                'What can guests book?',
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
                  builder: (context, places, child) => GestureDetector(
                    onTap: i == 0
                        ? () {
                            places.setNumberProperties(1);
                          }
                        : () {
                            places.setNumberProperties(1);
                          },
                    child: CustomContainer(
                      height: height * 0.13,
                      width: width * 0.3,
                      border: Border.all(
                          color: i == 0 && places.numberofProperty == 1 ||
                                  i == 1 && places.numberofProperty > 1
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
                          Text(
                            i == 0 ? 'Entire place' : 'A private room',
                            style: smallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            sizedBox(height * 0.02, 0.0),
            //Text Button for [Continue]
            SizedBox(
              height: height * 0.055,
              width: width * 0.25,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: places.numberofProperty < 1
                        ? Colors.grey.shade100
                        : Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  if (places.numberofProperty > 0) {
                    places.nextPage(1);
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