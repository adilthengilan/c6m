import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class PricePerGroup extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const PricePerGroup({super.key, 
   required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.06, 0.0),
          CustomContainer(
            boxShadow: true,
            width: width * 0.35,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.03, horizontal: width * 0.02),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.03, 0.0),
                Text("Price per group size", style: largeTextStyleBold),
                sizedBox(height * 0.03, 0.0),
                SizedBox(
                    width: width * 0.3,
                    child: Text(
                        'Offering lower rates for groups of less than 2 makes your property more attractive to potential guests.',
                        style: smallTextStyle)),
                sizedBox(height * 0.02, 0.0),
                SizedBox(
                    width: width * 0.3,
                    child: Text(
                      'The recommended discounts are based on data from properties like yours. These can be updated at any time.,',
                      style: smallTextStyle,
                    )),
                    sizedBox(height * 0.02, 0.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Consumer<RegistrationProvider>(
                      builder: (context, value, child) => 
                      Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            trackOutlineColor: WidgetStatePropertyAll(Colors.grey.shade600),
                            thumbColor: WidgetStatePropertyAll(Colors.white),
                            activeTrackColor: Colors.blueAccent,
                            inactiveThumbColor: Colors.white,
                            value: person.isPricePerGroupSizeEnabled,
                            onChanged: (value) {
                               person.setPricePerGroupSizeEnabled(value);
                            },
                          ),
                        ),
                    ),
                    Text(
                      'Enabled',
                      style: smallTextStyle
                    ),
                  ],
                ),
                sizedBox(height * 0.01, 0.0),
                Divider(),
                for (int i = 0; i < 3; i++)
      Container(
        color: i == 1 ? Colors.grey.shade50 : Colors.white,
        padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.01),
        child: Row(
          children: i == 0
    ? [
        Text('Occupancy', style: smallTextStyleBold),
        SizedBox(width: width * 0.06),
        Text('Discount', style: smallTextStyleBold),
        const Spacer(),
        Text('Guests pay', style: smallTextStyleBold),
      ]
    : i == 1
        ? [
            Text('2 guests', style: smallTextStyle),
            SizedBox(width: width * 0.09),
            Text('0%', style: smallTextStyle),
            const Spacer(),
            Text('INR 56,778.00', style: smallTextStyle),
          ]
        : [
            Text('1 guest', style: smallTextStyle),
            SizedBox(width: width * 0.08),
            Row(
              children: [
                SizedBox(
                  height: height * 0.045,
                  width: width * 0.05,
                  child: Center(
                    child: Consumer<RegistrationProvider>(
                      builder: (context, value, child) =>
                      TextField(
                        controller: value.disCountRateController,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        maxLength: 2,
                        onChanged: (newValue) {
                          value.setDiscountRate(newValue);
                        },
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('${value.discountPersentage}',style: smallTextStyle,textAlign: TextAlign.center),
                          suffixText: '%',
                          counterText: '',
                          suffixStyle: smallTextStyle,
                          contentPadding: EdgeInsets.symmetric(vertical: height * 0.005, horizontal: width * 0.01),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
                      const Spacer(),
                      Consumer<RegistrationProvider>(
                        builder:  (context, value, child) =>
                        Text(person.discountPersentage == 0 ? '56,778.00 ':'${(56,778.00 * person.discountPersentage / 100) }',style: smallTextStyle)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          sizedBox(height * 0.04, 0.0),
       Row(
        children: [
          // Back Button
          backButton(
             height, width, 
              (){
              person.goToPage(backToPage, pageController);
              }),
              sizedBox(0.0, width * 0.02),
              //Continue Button
              continueButton(
              height, width, 
              true,
              (){
              person.goToPage(goToPage, pageController);
            },
          ),
        ],
      ),
        ],
      ),
    );
  }
}
