import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class NonRefundableRate extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const NonRefundableRate({super.key, required this.goToPage, required this.backToPage, required this.pageController});

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
              "Set up a non-refundable rate plan",
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
                      "In addition to the standard rate plan you created for your property, you can add a non-refundable rate plan.",
                      style: smallTextStyle,
                    ),
                    sizedBox(height * 0.03, width),
                    Text(
                      "With this, you set a discounted price but your revenue for these bookings is guaranteed because guests won't receive a refund if they cancel or no-show.",
                      style: smallTextStyle,
                    ),
                    sizedBox(height * 0.05, width),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<RegistrationProvider>(
                          builder: (context, nonrefundableprovider, child) {
                            return Switch(
                              splashRadius: 10,
                              activeColor: Color.fromARGB(255, 162, 219, 255),
                              value:
                                  nonrefundableprovider.nonRefundableRatePlan,
                              onChanged: (value) {
                                nonrefundableprovider.setNonRefundableRatePlan(value);
                              },
                            );
                          },
                        ),
                        Text('Set up a non-refundable rate plan'),
                      ],
                    ),
                    Consumer<RegistrationProvider>(
                      builder: (context, nonrefundableprovider, child) {
                        return nonrefundableprovider.nonRefundableRatePlan
                            ? DiscountUI()
                            : Container();
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
              GestureDetector(
                onTap: () {
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
                    backgroundColor: const Color.fromARGB(255, 133, 64, 251),
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

//=========================================================================================
//=============================== Discount ui ============================================
//=========================================================================================
class DiscountUI extends StatelessWidget {
  const DiscountUI({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Consumer<RegistrationProvider>(
        builder: (context, discount, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Discount for guests that book with this rate plan:",
                style: mediumTextStyleBold),
            sizedBox(height * 0.02, width),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 24, 20, 20)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.01),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.300,
                          child: TextField(
                            controller: discount.disCountRateController,
                            readOnly: true,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        sizedBox(height * 0.01, width * 0.01),
                        Column(
                          children: [
                            InkWell(
                              onTap: discount.increaseDiscountRate,
                              child: Icon(Icons.keyboard_arrow_up,
                                  size: height * 0.022),
                            ),
                            InkWell(
                              onTap: discount.decreaseDiscountRate,
                              child: Icon(Icons.keyboard_arrow_down,
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
            ),
            SizedBox(height: height * 0.05),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("INR ${discount.basePrice.toStringAsFixed(2)}",
                        style: smallTextStyleBold),
                    Text("${discount.discountRate}%",
                        style: smallTextStyleBold),
                    Text(
                        "INR ${discount.nonRefundablePrice.toStringAsFixed(2)}",
                        style: smallTextStyleBold),
                  ],
                ),
                sizedBox(height * 0.01, width * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Base price", style: smallTextStyle),
                    Text("Discount when guests book the non-refundable option",
                        style: smallTextStyle),
                    Text("Non-refundable price", style: smallTextStyle),
                  ],
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Icon(Icons.lightbulb_outline, color: Colors.yellow),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                      "Guests who select non-refundable rates are usually looking for competitive prices. A discount of at least 10% will attract more guests by improving your visibility.",
                      style: smallTextStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}