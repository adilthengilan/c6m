
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class HomestayCatogories extends StatelessWidget {
  final int goToPage;
  final PageController pageController;
  const HomestayCatogories({super.key, required this.goToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hotel = Provider.of<RegistrationProvider>(context);

    List<Map<String, String>> options = [
      {
        'title': 'Apartment',
        'description':
            'Furnished and self-catering accommodation available for short- and long-term rental'
      },
      {
        'title': 'Hostel',
        'description':
            'Free-standing home with private, external entrance and rented specifically for holidays'
      },
      {
        'title': 'Villa',
        'description':
            'Private self-standing and self-catering home with luxury feel'
      },
      {
        'title': 'Aparthotel',
        'description':
            'A self-catering apartment with some hotel facilities like a reception desk'
      },
      {
        'title': 'Chalet',
        'description':
            'Free-standing home characterised by sloped roof and rented specifically for holidays'
      },
      {
        'title': 'Holiday park',
        'description': 'Private self-catering residences located on a shared grounds with shared facilities or recreational activities'
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
                physics: const NeverScrollableScrollPhysics(),
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
                    return Consumer<RegistrationProvider>(
                        builder: (context, hotel, child) => GestureDetector(
                            onTap: () {
                              hotel.setStayCategoryOption(options[index]['title']!);
                            },
                            child: CustomContainer(
                              height: height * 0.2,
                              width: width * 0.01,
                              border: Border.all(
                                color: hotel.stayCategoryOption ==
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
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.07,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(06)),
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                sizedBox(height * 0.01, width * 0.01),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.700,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(06)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: hotel.isStayCategoryOption
                            ? const Color.fromARGB(255, 133, 64, 251)
                            : Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (hotel.isStayCategoryOption) {
                          hotel.goToPage(goToPage, pageController);
                        }
                      },
                      child: Text('Continue',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
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