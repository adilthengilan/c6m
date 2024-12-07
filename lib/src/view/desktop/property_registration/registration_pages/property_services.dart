import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_detailes.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class PropertyServices extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const PropertyServices({
    super.key,
    required this.goToPage,
    required this.backToPage,
    required this.pageController,
  });

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
              padding: EdgeInsets.symmetric(vertical: height * 0.025, horizontal: width * 0.02),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Services at your property', style: largeTextStyleBold),
                  sizedBox(height * 0.04, 0.0),
                  Text(
                    'Breakfast',
                    style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Divider(),
                  sizedBox(height * 0.01, 0.0),
                  Text('Do you serve guests breakfast?', style: smallTextStyle),
                  sizedBox(height * 0.02, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => RadioButtons(
                      groupValue: consumer.isServeBreakfast,
                      onChanged1: (bool? value) {
                        consumer.setServeBreakfast(value!);
                      },
                      onChanged2: (bool? value) {
                        consumer.setServeBreakfast(value!);
                      },
                    ),
                  ),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => SizedBox(
                      child: consumer.isServeBreakfast
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizedBox(height * 0.03, 0.0),
                                Text('Is breakfast included in the price guests pay?', style: smallTextStyle),
                                sizedBox(height * 0.02, 0.0),
                                for (int i = 0; i < 2; i++)
                                  Consumer<RegistrationProvider>(
                                    builder: (context, consumer, child) => Row(
                                      children: [
                                        Radio<bool>(
                                          activeColor: Colors.lightBlueAccent,
                                          value: i == 0 ? true : false,
                                          groupValue: consumer.isBrakFastIncludedCost,
                                          onChanged: (bool? value) {
                                            consumer.setbraekFastCostIncluded(value);
                                          },
                                        ),
                                        Text(i == 0 ? "Yes, it's included" : "No, it costs extra", style: smallTextStyle),
                                      ],
                                    ),
                                  ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                  ),
                  sizedBox(height * 0.03, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => SizedBox(
                      child: !consumer.isBrakFastIncludedCost
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Breakfast price per person, per day', style: smallTextStyle),
                                sizedBox(height * 0.01, 0.0),
                                CustomContainer(
                                  height: height * 0.05,
                                  width: width,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300),
                                  boxShadow: false,
                                  child: CustomTextField(
                                      labelText: '',
                                      prefixIcon: CustomContainer(
                                        boxShadow: false,
                                        border: Border(right: BorderSide(color: Colors.grey.shade300)),
                                        width: width * 0.02,
                                        height: height * 0.05,
                                        child: Center(
                                          child: Text('\$', style: smallTextStyleBold),
                                        ),
                                      )),
                                ),
                                Text('Including all fees and taxes', style: smallTextStyle),
                                sizedBox(height * 0.03, 0.0),
                              ],
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => SizedBox(
                        child: consumer.isServeBreakfast
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  sizedBox(height * 0.02, 0.0),
                                  Text('What type of breakfast do you offer?', style: mediumTextStyleBold),
                                  Text('Select all that apply', style: smallTextStyle),
                                  sizedBox(height * 0.03, 0.0),
                                  Wrap(
                                    spacing: height * 0.013,
                                    runSpacing: width * 0.01,
                                    children: [
                                      'À la carte',
                                      'American',
                                      'Asian',
                                      'Breakfast to go',
                                      'Buffet',
                                      'Continental',
                                      'Full English/Irish',
                                      'Gluten-free',
                                      'Halal',
                                      'Italian',
                                      'Kosher',
                                      'Vegan',
                                      'Vegetarian',
                                    ].map((option) {
                                      return Consumer<RegistrationProvider>(builder: (context, consumer, child) {
                                        final isSelected = consumer.offeredbreakTypeFastList.contains(option);
                                        return InkWell(
                                          onTap: () {
                                            consumer.settingOfferdBreakFast(option, isSelected);
                                          },
                                          child: CustomContainer(
                                            boxShadow: false,
                                            padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
                                            color: isSelected ? Colors.purpleAccent.shade100 : Colors.white,
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(option, style: isSelected ? smallTextStylewhite : smallTextStyle),
                                                isSelected
                                                    ? Padding(
                                                        padding: EdgeInsets.only(left: width * 0.01),
                                                        child: Icon(
                                                          Icons.close,
                                                          size: height * 0.02,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    }).toList(),
                                  ),
                                  sizedBox(height * 0.03, 0.0),
                                ],
                              )
                            : const SizedBox()),
                  ),
                  Text(
                    'Parking',
                    style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Divider(),
                  sizedBox(height * 0.01, 0.0),
                  Text(
                    'Is parking available to guests?',
                    style: smallTextStyle,
                  ),
                  sizedBox(height * 0.02, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => Column(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Row(
                            children: [
                              Radio<String>(
                                activeColor: Colors.lightBlueAccent,
                                value: i == 0
                                    ? 'Yes, free'
                                    : i == 1
                                        ? 'Yes, paid'
                                        : 'No',
                                groupValue: consumer.parkingOption,
                                onChanged: (String? value) {
                                  consumer.setParkingOption(value!);
                                },
                              ),
                              Text(
                                  i == 0
                                      ? 'Yes, free'
                                      : i == 1
                                          ? 'Yes, Paid'
                                          : 'No',
                                  style: smallTextStyle),
                            ],
                          ),
                      ],
                    ),
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
                sizedBox(0.0, width * 0.005),
                continueButton(height, width, true, () {
                  person.goToPage(goToPage, pageController);
                  person.addOfferedBreakfastDetailsToBreakFastDetailsList();
                })
              ],
            ),
            sizedBox(height * 0.2, width),
          ],
        ),
      ),
    );
  }
}
