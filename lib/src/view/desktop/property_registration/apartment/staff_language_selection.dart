import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:provider/provider.dart';


class StaffLanguageSelectionPart extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const StaffLanguageSelectionPart({
    super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.025, horizontal: width * 0.02),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('What languages do you or your staff speak?',style: largeTextStyleBold),
                  sizedBox(height * 0.04, width),
                  for(int i = 0; i < 3; i++) 
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) {
                      String language;
            if (i == 0) {
              language = 'English';
            } else if (i == 1) {
              language = 'Hindi';
            } else {
              language = 'Arabic';
            }
            final isSelected = consumer.staffLanguagesList.contains(language);
                      return CheckboxListTile(
                            activeColor: Colors.cyanAccent,
                            title: Text(language, style: smallTextStyle),
                            value: isSelected,
                            onChanged: (value) {
                              consumer.addingStaffLanguages(isSelected, language);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                
                      }
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            Row(
              children: [
                backButton(
                  height,
                  width,
                  () {
                    person.goToPage(backToPage, pageController);
                  },
                ),
                sizedBox(0.0, width * 0.02),
                continueButton(height, width, true, () {
                  person.goToPage(goToPage, pageController);
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}