import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class WeeklyPlan extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const WeeklyPlan({
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
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: height * 0.06),
          CustomContainer(
            width: width * 0.350,
            boxShadow: true,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.02, top: height * 0.05, right: width * 0.01, bottom: height * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Set up a weekly rate",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                    ),
                  ),
                  sizedBox(height * 0.03, width),
                  Text(
                    "In addition to the standard rate plan you created for your property, you can add a weekly rate plan.",
                    style: smallTextStyle,
                  ),
                  sizedBox(height * 0.03, width),
                  Text(
                    "For this, you set a discounted price and use the same cancellation policy as the standard rate plan. Guests who stay for at least a week are interested in discounts since they’ll be spending more on their overall booking.",
                    style: smallTextStyle,
                  ),
                  sizedBox(height * 0.05, width),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<RegistrationProvider>(
                        builder: (context, nonrefundableprovider, child) {
                          return Switch(
                            value: nonrefundableprovider.nonRefundableRatePlan,
                            onChanged: (value) {
                              nonrefundableprovider.setNonRefundableRatePlan(value);
                            },
                          );
                        },
                      ),
                      sizedBox(0.0, width * 0.01),
                      const Text('Set up a weekly rate plan'),
                    ],
                  ),
                  sizedBox(height * 0.03, width),
                  Consumer<RegistrationProvider>(
                    builder: (context, nonrefundableprovider, child) {
                      return nonrefundableprovider.nonRefundableRatePlan
                          ? Padding(
                              padding: EdgeInsets.only(bottom: height * 0.015),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBox(height * 0.03, width),
                                  const Divider(),
                                  sizedBox(height * 0.03, width),
                                  Text(
                                    "How much cheaper than the standard rate do you want to make this rate plan?",
                                    style: mediumTextStyleBold,
                                  ),
                                  sizedBox(height * 0.06, width),
                                  CustomContainer(
                                    boxShadow: false,
                                    height: height * 0.055,
                                    width: width * 0.3,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: height * 0.055,
                                          width: width * 0.28,
                                          child: Consumer<RegistrationProvider>(
                                            builder: (context, person, child) => CustomTextField(
                                              controller: person.discountRateController,
                                              labelText: "${person.discountRate}",
                                              labelTextStyle: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              suffixIcon: const Icon(Icons.percent),
                                              borderRadius: 10,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                              onSubmiting: (newValue) {
                                                person.setWeeklydiscoutRate(newValue);
                                              },
                                              onTapOutside: (PointerDownEvent point) {
                                                FocusScope.of(context).unfocus();
                                                person.setWeeklydiscoutRate(person.discountRateController.text);
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.045,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: nonrefundableprovider.increaseDiscountRate,
                                                child: Icon(Icons.keyboard_arrow_up, size: height * 0.022),
                                              ),
                                              InkWell(
                                                onTap: nonrefundableprovider.decreaseDiscountRate,
                                                child: Icon(Icons.keyboard_arrow_down, size: height * 0.022),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color.fromARGB(255, 173, 37, 37)),
                                color: const Color.fromARGB(236, 255, 231, 229),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  width * 0.01,
                                  height * 0.02,
                                  width * 0.01,
                                  height * 0.02,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Consider offering a 15% discount for stays of 7 or more nights to increase your chances of getting bookings",
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
          sizedBox(height * 0.03, width),
          Row(
            children: [
              backButton(height, width, () {
                person.goToPage(backToPage, pageController);
              }),
              sizedBox(0.0, width * 0.005),
              continueButton(
                height,
                width,
                true,
                () {
                  person.goToPage(goToPage, pageController);
                },
              ),
            ],
          ),
          sizedBox(height * 0.06, width)
        ]),
      ),
    );
  }
}
