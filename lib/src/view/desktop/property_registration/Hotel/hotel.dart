import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Hotels extends StatelessWidget {
  const Hotels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    final properties = [
      {
        'title': 'Hotel',
        'description':
            'Accommodations for travelers often with restaurants, meeting rooms and other guest services.'
      },
      {
        'title': 'Guesthouse',
        'description':
            'Private home with separate living facilities for host and guest'
      },
      {
        'title': 'Bed and breakfast',
        'description': 'Private home offering overnight stays and breakfast.'
      },
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
    ];

    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.10),
            SizedBox(
              width: width * 0.7,
              child: Text(
                'From the list below, which property category is the best fit for your place?',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(height: height * 0.06),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.6,
                crossAxisSpacing: width * 0.02,
                mainAxisSpacing: height * 0.04,
              ),
              itemCount: properties.length,
              itemBuilder: (context, index) {
                return Consumer<RegistrationProvider>(
                  builder: (context, person, child) => GestureDetector(
                    onTap: () {
                      person.setNumberProperties(index + 1);
                    },
                    child: CustomContainer(
                      height: height * 0.03,
                      width: width * 0.04,
                      border: Border.all(
                        color: person.numberofProperty == index + 1
                            ? Colors.deepPurpleAccent
                            : Colors.transparent,
                      ),
                      color: Colors.white,
                      boxShadow: true,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.02,
                          top: height * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.01),
                            Text(
                              properties[index]['title']!,
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: height * 0.02),
                            SizedBox(
                              width: width * 0.30,
                              child: Text(
                                properties[index]['description']!,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Icon(
                  Icons.help_center_outlined,
                  size: 13,
                  color: Colors.blueAccent,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "I don't see my property type on the list",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Container(
                  child: Icon(Icons.arrow_back_ios_new),
                ),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (person.numberofProperty > 0) {
                        person.goToPage(1);
                      }
                    },
                    child: Text('Continue', style: smallTextStylewhiteBold),
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
