import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class ApartmentPage2 extends StatelessWidget {
  final int goToPage;
  final PageController pageController;
  const ApartmentPage2({super.key, required this.goToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.06, 0.0),
          CustomContainer(
            boxShadow: true,
            height: height * 0.75,
            width: width * 0.35,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            color: Colors.white,
            child: Column(
              children: [
                sizedBox(height * 0.05, 0.0),
                Icon(Icons.other_houses_outlined, size: height * 0.15, color: Colors.blue),
                sizedbox(height * 0.1, 0.0),
                SizedBox(
                  width: width * 0.23,
          //         child: Consumer<RegistrationProvider>(
          //           builder: (context, person, child) =>
          //           Text(person.numberofProperty > 1?  person.isSameAddress
          //           ? 'Multiple apartments in the same location where guests can book an entire apartment'
          //           :' Multiple apartments in different locations where guests can book an entire place'
          //           : 'One apartment where guests can book the entire place',
          //           style: largeTextStyleBold,
          //           textAlign: TextAlign.center,
          //           ),
                  // ),
                ),
                const Spacer(),
                SizedBox(
                  height: height * 0.15, // Constrain the height to fit both buttons
                  child: ListView.builder(
                    itemCount: 2, // Number of items
                    scrollDirection: Axis.vertical, // Change to horizontal if needed
                    itemBuilder: (context, index) {
                      return Container(
                        height: height * 0.06,
                        width: width,
                        color: Colors.grey.shade100,
                        margin: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
                        child: Consumer<RegistrationProvider>(
                          builder: (context, person, child) {
                            return TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.deepPurpleAccent),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: index == 0 ? Colors.deepPurpleAccent : Colors.white,
                              ),
                              onPressed: index == 0
                                  ? () {
                                      person.goToPage(goToPage, pageController);
                                    }
                                  : () {
                                      Navigator.pop(context);
                                    },
                              child: Text(
                                index == 0 ? 'Continue' : 'No, I need to make a change ',
                                style: index == 0 ? smallTextStylewhiteBold : smallTextStyleBold,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                sizedbox(height * 0.02, 0.0)
              ],
            ),
          )
        ],
      ),
    );
  }

  sizedbox(double d, double e) {}
}
