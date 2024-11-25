import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class ApartmentPage3 extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const ApartmentPage3({
    super.key,
    required this.goToPage,
    required this.backToPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    print('=================0000000000000000000000');

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
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.02),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.06, 0.0),
                Text("What's the name of your place?",
                    style: largeTextStyleBold),
                sizedBox(height * 0.03, 0.0),
                SizedBox(
                  width: width * 0.3,
                  child: Text('Property name', style: smallTextStyle),
                ),
                sizedBox(height * 0.01, 0.0),
                SizedBox(
                    height: height * 0.055,
                    width: width,
                    child: Consumer<RegistrationProvider>(
                      builder: (context, person, child) => CustomTextField(
                        labelText: person.propertyName,
                        onChanged: (value) {
                          person.setPropertyName(value);
                        },
                        borderRadius: 10,
                        borderSide:
                            const BorderSide(color: Colors.lightBlueAccent),
                        enabledBorder: BorderSide(color: Colors.grey.shade300),
                      ),
                    )),
              ],
            ),
          ),
          sizedBox(height * 0.03, width),
          Consumer<RegistrationProvider>(
            builder: (context, person, child) => Row(
              children: [
                // Back Button
                backButton(height, width, () {
                  person.goToPage(backToPage, pageController);
                  person.propertyName = '';
                }),
                sizedBox(0.0, width * 0.02),
                //Continue Button
                continueButton(
                  height,
                  width,
                  person.propertyName != '',
                  () {
                    person.goToPage(goToPage, pageController);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
