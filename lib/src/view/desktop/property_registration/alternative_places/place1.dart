import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class AlternativePlaces extends StatelessWidget {
  const AlternativePlaces({
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
            sizedBox(height * 0.22, 0.0),
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
                      width: width * 0.5,
                      border: Border.all(
                          color: i == 0 && person.numberofProperty == 1 ||
                                  i == 1 && person.numberofProperty > 1
                              ? Colors.deepPurpleAccent
                              : Colors.transparent),
                      color: Colors.white,
                      boxShadow: true,
                      child: Row(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sizedBox(height * 0.01, width * 0.01),
                              Text(
                                i == 0 ? 'Entire place' : 'A private room',
                                style: smallTextStyleBold,
                                textAlign: TextAlign.start,
                              ),
                              sizedBox(height * 0.01, width * 0.01),
                              SizedBox(
                                width: width * 0.200,
                                child: Text(
                                  i == 0
                                      ? 'Guests have access to the entire place and don\'t have to share it with the host or other guests.'
                                      : 'Guests rent a room within the property.There are common areas that are shared with either the host or other guests.',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            sizedBox(height * 0.02, 0.0),
            //Text Button for [Continue]
            Container(
              height: height * 0.055,
              width: width * 0.25,
              color: Colors.grey.shade100,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: person.numberofProperty < 1
                        ? Colors.grey.shade100
                        : Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  if (person.numberofProperty > 0) {
                    // person.goToPage(1person.al);
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
