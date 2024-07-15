import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/login_provider.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/apartment/property_details.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoodsandServicesTsx extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const GoodsandServicesTsx(
      {super.key,
      required this.goToPage,
      required this.backToPage,
      required this.pageController});

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
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: width * 0.012),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Goods & Services Tax', style: largeTextStyleBold),
                  sizedBox(height * 0.03, width),
                  SizedBox(
                      width: width * 0.3,
                      child: const Text(
                          'Due to regulations established by the Indian government, we need the following details. By submitting this information, you are confirming that your PAN and state registration are accurate.')),
                  sizedbox(height * 0.03, 0.0),
                  Text(
                    'Are you registered for GST purposes??',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedbox(height * 0.01, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => RadioButtons(
                      groupValue: consumer.isGstPurpuse,
                      onChanged1: (value) {
                        consumer.setGstPurpuse(value);
                      },
                      onChanged2: (value) {
                        consumer.setGstPurpuse(value);
                      },
                    ),
                  ),
                  sizedbox(height * 0.03, 0.0),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => Visibility(
                      visible: consumer.isGstPurpuse,
                      child: Column(
                        children: List.generate(
                          2,
                          (index) => Padding(
                            padding: EdgeInsets.only(bottom: height * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index == 0 ? 'Trade name' : 'GSTIN',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                sizedbox(height * 0.01, 0.0),
                                SizedBox(
                                  height: height * 0.05,
                                  child: CustomTextField(
                                    controller: index == 0
                                        ? person.tradeNameController
                                        : person.GsGSTINController,
                                    labelText: '',
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
                                    enabledBorder:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                                sizedbox(height * 0.02, 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'PAN',
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.05,
                    child: CustomTextField(
                      labelText: '',
                      controller: person.panController,
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      enabledBorder: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  sizedbox(height * 0.06, 0.0),
                  Text(
                    "Is the fourth character of your PAN a 'P' or an 'H'?",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => RadioButtons(
                      groupValue: consumer.isFourthCharecterOfPanHorP,
                      onChanged1: (value) =>
                          consumer.setFourthCharecterOfPanHorP(value),
                      onChanged2: (value) =>
                          consumer.setFourthCharecterOfPanHorP(value),
                    ),
                  ),
                  Consumer<RegistrationProvider>(
                    builder: (context, value, child) => Visibility(
                      visible: person.isFourthCharecterOfPanHorP,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedbox(height * 0.03, 0.0),
                          Text(
                            'Enter your 12–digit Aadhaar number',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height * 0.05,
                            child: CustomTextField(
                              labelText: '',
                              controller: person.panNoController,
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                              enabledBorder:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedbox(height * 0.03, 0.0),
                ],
              ),
            ),
            sizedbox(height * 0.03, 0.0),
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
                continueButton(
                  height,
                  width,
                  true,
                  () {
                    person.goToPage(goToPage, pageController);
                  },
                )
              ],
            ),
            sizedBox(height * 0.2, 0.0)
          ],
        ),
      ),
    );
  }
}
