import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class HotelPage1 extends StatelessWidget {
  final int goToPage;
  final PageController pageController;
  const HotelPage1({super.key, required this.goToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hotel = Provider.of<RegistrationProvider>(context);

    List<Map<String, String>> options = [
      {"title": "Luxury Hotels", "description": "Premium stays with top-notch amenities."},
      {"title": "Budget Hotels", "description": "Affordable stays with basic comfort."},
      {"title": "Business Hotels", "description": "Corporate-friendly with business facilities."},
      {"title": "Extended Stay Hotels", "description": "Ideal for long-term stays with kitchens."},
      {"title": "All-Inclusive Hotels", "description": "Meals and activities included."},
      {"title": "Family-Friendly Hotels", "description": "Kid-friendly with family amenities."},
      {"title": "Adults-Only Hotels", "description": "Exclusively for adults and couples."},
      {"title": "Eco-Friendly Hotels", "description": "Sustainable stays with green practices."},
      {"title": "Wellness Hotels", "description": "Health-focused stays with spas and yoga."},
      {"title": "Pet-Friendly Hotels", "description": "Welcomes pets with special services."},
      {"title": "Resort Hotels", "description": "Leisure-focused with recreational activities."},
      {"title": "Heritage Hotels", "description": "Historic stays with modern comforts."},
      {"title": "Waterfront Hotels", "description": "Stays by or over water with scenic views."},
      {"title": "Theme Hotels", "description": "Unique accommodations with themes."},
      {"title": "Adventure Hotels", "description": "Near outdoor activities like hiking."},
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Which property category best describes your place?', style: largeTextStyleBold),
                  sizedBox(height * 0.01, width),
                  Text('Select the most suitable stay hotel category from the list below.', style: smallTextStyleBold),
                ],
              ),
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
                  if (index == 5 && !hotel.showMoreOptions) {
                    return GestureDetector(
                      onTap: () {
                        hotel.toggleMoreOptions(true);
                      },
                      child: CustomContainer(
                        height: height * 0.03,
                        width: width * 0.04,
                        color: Colors.white,
                        boxShadow: true,
                        child: const Center(
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
                        hotel.toggleMoreOptions(false);
                      },
                      child: CustomContainer(
                        height: height * 0.03,
                        width: width * 0.04,
                        color: Colors.white,
                        boxShadow: true,
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Less options',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_up_outlined,
                                color: Colors.blueAccent,
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
                          hotel.setStayCategoryOption(options[index]['title']!);
                        },
                        child: CustomContainer(
                          height: height * 0.3,
                          width: width * 0.01,
                          padding: EdgeInsets.only(left: width * 0.015, top: height * 0.04, right: width * 0.015),
                          border: Border.all(
                            color: hotel.stayCategoryOption == options[index]['title'] ? Colors.deepPurpleAccent : Colors.transparent,
                          ),
                          color: Colors.white,
                          boxShadow: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(options[index]['title']!, style: mediumTextStyleBold),
                              sizedBox(height * 0.02, width),
                              Text(
                                options[index]['description']!,
                                style: smallTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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
                                Text('That\'s ok  choose the category that\'s most similar to your property. We use this category to help guests find your property.', style: smallTextStyle),
                                sizedBox(height * 0.04, width),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: height * 0.06,
                                    width: width * 0.07,
                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 138, 58, 244), borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text("Got it", style: smallTextStylewhiteBold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.help_center_outlined,
                          size: 14,
                          color: Colors.blueAccent,
                        ),
                        Text("I don't see my property type on the list", style: bluetextStyle)
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
                  onTap: () {
                    Navigator.pop(context);
                    hotel.toggleMoreOptions(false);
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.04,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(06)),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                sizedBox(0.0, width * 0.45),
                Consumer<RegistrationProvider>(
                  builder: (context, person, child) => continueButton(
                    height,
                    width,
                    person.stayCategoryOption != "",
                    () {
                      person.goToPage(goToPage, pageController);
                      hotel.toggleMoreOptions(false);
                    },
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
