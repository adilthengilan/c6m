import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class WeeklyPlan extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const WeeklyPlan({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: height * 0.01),
          SizedBox(
            width: width * 0.300,
            child: Text(
              "Set up a weekly rate",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
          ),
          sizedBox(height * 0.05, width),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainer(
              width: width * 0.430,
              boxShadow: true,
              color: backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    top: height * 0.05,
                    right: width * 0.01,
                    bottom: height * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              value:
                                  nonrefundableprovider.nonRefundableRatePlan,
                              onChanged: (value) {
                                nonrefundableprovider
                                    .setNonRefundableRatePlan(value);
                              },
                            );
                          },
                        ),
                        Text('Set up a weekly rate plan'),
                      ],
                    ),
                    sizedBox(height * 0.05, width),
                    Consumer<RegistrationProvider>(
                      builder: (context, nonrefundableprovider, child) {
                        return nonrefundableprovider.nonRefundableRatePlan
                            ? Padding(
                                padding: EdgeInsets.only(bottom: height * 0.08),
                                child: Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sizedBox(height * 0.03, width),
                                    Divider(),
                                    sizedBox(height * 0.03, width),
                                    Text(
                                      "How much cheaper than the standard rate do you want to make this rate plan?",
                                      style: mediumTextStyleBold,
                                    ),
                                    sizedBox(height * 0.03, width),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 24, 20, 20)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.02,
                                            right: width * 0.01),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.300,
                                              child: TextField(
                                                controller:
                                                    nonrefundableprovider
                                                        .discountController,
                                                readOnly: true,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            sizedBox(
                                                height * 0.01, width * 0.01),
                                            Column(
                                              children: [
                                                InkWell(
                                                  onTap: nonrefundableprovider
                                                      .increaseDiscountRate,
                                                  child: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      size: height * 0.022),
                                                ),
                                                InkWell(
                                                  onTap: nonrefundableprovider
                                                      .decreaseDiscountRate,
                                                  child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: height * 0.022),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '%',
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 173, 37, 37),
                                  ),
                                  color: Color.fromARGB(236, 255, 231, 229),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    width * 0.01,
                                    height * 0.02,
                                    width * 0.01,
                                    height * 0.02,
                                  ),
                                  child: Center(
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
          ),
          sizedBox(height * 0.03, width),
          Row(
            children: [
              InkWell(
                onTap: (){
                  person.goToPage(backToPage, pageController);
                },
                child: Container(
                  height: height * 0.08,
                  width: width * 0.06,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(06)),
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              sizedBox(height * 0.01, width * 0.01),
              Container(
                height: height * 0.08,
                width: width * 0.360,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(06)),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 34, 158, 207),
                    // : Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                      person.goToPage(goToPage, pageController);
                  },
                  child: Text('Save',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              sizedBox(height * 0.07, width * 0.01),
            ],
          ),
        ]),
      ),
    );
  }
}