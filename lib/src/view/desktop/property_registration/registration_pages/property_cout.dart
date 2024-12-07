import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class PorpertyCount extends StatelessWidget {
  final String stayPalceName;
  final int goToPage;

  final PageController pageController;
  const PorpertyCount({
    super.key,
    required this.goToPage,
    required this.pageController,
    required this.stayPalceName,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.06, 0.0),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: CustomContainer(
              width: width * 0.35,
              boxShadow: true,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.03, 0.0),
                  SizedBox(
                    width: width * 0.3,
                    child: Text(
                      'How many $stayPalceName are you listing?',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  sizedBox(height * 0.04, 0.0),
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
                            width: width * 0.35,
                            border: Border.all(color: i == 0 && person.numberOfOwnedProperties == 1 || i == 1 && person.numberOfOwnedProperties > 1 ? Colors.deepPurpleAccent : Colors.transparent),
                            color:  i == 0 && person.numberOfOwnedProperties == 1 || i == 1 && person.numberOfOwnedProperties > 1 ?Colors.white : Color.fromARGB(255, 250, 253, 255),
                            boxShadow: false,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: width * 0.02),
                                Icon([Icons.apartment, Icons.maps_home_work_outlined][i], color: [Colors.greenAccent.shade200, Colors.purpleAccent][i], size: 40),
                                SizedBox(width: width * 0.02),
                                Text(
                                  i == 0 ? 'One Property' : 'Multiple Properties',
                                  style: smallTextStyleBold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  Consumer<RegistrationProvider>(
                    builder: (context, value, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBox(height * 0.025, width),
                        person.numberOfOwnedProperties > 1
                            ? SizedBox(
                                child: Text(
                                  'Are these properties in the same address or building?',
                                  style: smallTextStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Consumer<RegistrationProvider>(
                    builder: (context, person, child) => Column(
                      children: List.generate(
                        person.numberOfOwnedProperties < 2 ? 0 : 2,
                        (i) => Padding(
                          padding: EdgeInsets.only(bottom: i == 0 ? height * 0.04 : 0),
                          child: GestureDetector(
                            onTap: i == 0
                                ? () {
                                    person.setAllPropertiesAreSameAddress(true);
                                  }
                                : () {
                                    //=This function will work for multiple properties, change bool variable isSameAddress value to false
                                    person.setAllPropertiesAreSameAddress(false);
                                  },
                            child: CustomContainer(
                              height: height * 0.13,
                              width: width * 0.35,
                              border: Border.all(
                                  color: i == 0 && person.isAllOwnedPropertiesAreSameAddress || i == 1 && !person.isAllOwnedPropertiesAreSameAddress ? Colors.deepPurpleAccent : Colors.transparent),
                              color: i == 0 && person.isAllOwnedPropertiesAreSameAddress || i == 1 && !person.isAllOwnedPropertiesAreSameAddress ? Colors.white : Color.fromARGB(255, 250, 253, 255),
                              boxShadow: false,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: width * 0.02),
                                  Icon([Icons.share_location, Icons.location_off_outlined][i], color: [Colors.redAccent.shade200, Colors.orangeAccent.shade200][i], size: 40),
                                  SizedBox(width: width * 0.02),
                                  SizedBox(
                                    width: width * 0.25,
                                    child: Text(
                                      i == 0 ? 'Yes, these $stayPalceName are at the same address or building' : 'No, these $stayPalceName are at different addresses or buildings',
                                      style: smallTextStyleBold,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Number Input [Number of Property] Taking Count of property
                  Consumer<RegistrationProvider>(
                    builder: (context, person, child) => person.numberOfOwnedProperties > 1
                        ? Padding(
                            padding: EdgeInsets.only(top: height * 0.03,bottom: height * 0.03),
                            child: CustomContainer(
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
                                      controller: person.numberofPropertycontroller,
                                      labelText: '${person.numberOfOwnedProperties}',
                                      labelTextStyle: GoogleFonts.montserrat(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                                      borderRadius: 10,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      onSubmiting: (newValue) {
                                        person.setNumberProperties(newValue);
                                      },
                                      onTapOutside: (PointerDownEvent point) {
                                        FocusScope.of(context).unfocus();
                                        person.setNumberProperties(person.numberofPropertycontroller.text);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.045,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Provider.of<RegistrationProvider>(context, listen: false).increaseNumberProperty();
                                          },
                                          child: Icon(Icons.keyboard_arrow_up, size: height * 0.022),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Provider.of<RegistrationProvider>(context, listen: false).decreaseNumberProperty();
                                          },
                                          child: Icon(Icons.keyboard_arrow_down, size: height * 0.022),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          sizedBox(height * 0.04, width),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Row(
              children: [
                backButton(
                  height,
                  width,
                  () {
                    Navigator.pop(context);
                  },
                ),
                sizedBox(0.0, width * 0.005),
                Consumer<RegistrationProvider>(
                  builder: (context, person, child) => continueButton(
                    height,
                    width,
                    true,
                    () {
                      person.goToPage(goToPage, pageController);
                    },
                  ),
                ),
              ],
            ),
          ),
          sizedBox(height * 0.1, width),
        ],
      ),
    );
  }
}

SizedBox continueButton(height, width, isDisabledButton, onPressed) {
  return SizedBox(
    height: height * 0.06,
    width: width * 0.305,
    child: TextButton(
      style: TextButton.styleFrom(backgroundColor: isDisabledButton ? Colors.deepPurpleAccent : Colors.grey.shade100, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: isDisabledButton ? onPressed : () {},
      child: Text('Continue', style: smallTextStylewhiteBold),
    ),
  );
}

GestureDetector backButton(double height, double width, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: CustomContainer(
      boxShadow: false,
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
      height: height * 0.06,
      width: width * 0.04,
      color: Colors.white,
      child: const Center(
        child: Icon(Icons.keyboard_arrow_left),
      ),
    ),
  );
}
