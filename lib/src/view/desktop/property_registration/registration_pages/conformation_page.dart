import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/Hotel/Hotels.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class ConformationPage extends StatelessWidget {
  final int goToPage;
  final PageController pageController;
  const ConformationPage({
    super.key,
    required this.goToPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.06, 0.0),
          CustomContainer(
            boxShadow: false,
            height: height * 0.7,
            width: width * 0.35,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            color: Colors.white,
            child: Column(
              children: [
                sizedBox(height * 0.08, 0.0),
                Icon(person.numberOfOwnedProperties > 1 ? Icons.maps_home_work_outlined : Icons.apartment, size: 100, color: Colors.blue),
                const Spacer(),
                SizedBox(
                  width: width * 0.23,
                  child: Text(
                    person.numberOfOwnedProperties > 1 && person.isAllOwnedPropertiesAreSameAddress
                        ? 'Multiple apartments in the same location where guests can book an entire apartment'
                        : person.numberOfOwnedProperties > 1 && !person.isAllOwnedPropertiesAreSameAddress
                            ? ' Multiple apartments in different locations where guests can book an entire place'
                            : 'One apartment where guests can book the entire place',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                sizedBox(height * 0.04, 0.0),
                for (int index = 0; index < 2; index++)
                  Container(
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Hotels(),
                                    ),
                                  );
                                },
                          child: Text(
                            ['Continue', 'No, I need to make a change '][index],
                            style: [smallTextStylewhiteBold, smallTextStyleBold][index],
                          ),
                        );
                      },
                    ),
                  ),
                sizedBox(height * 0.03, 0.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
