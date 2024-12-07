import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class PricePerNight extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const PricePerNight({super.key, required this.goToPage, required this.backToPage, required this.pageController});

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
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Price per Night', style: largeTextStyleBold),
                  sizedBox(height * 0.04, width),
                  Text(
                    'How much do you want to charge per night?',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedBox(height * 0.02, 0.0),
                  Text('Price guests pay', style: smallTextStyle),
                  sizedBox(height * 0.01, 0.0),
                  SizedBox(
                    height: height * 0.05,
                    child: Consumer<RegistrationProvider>(builder: (context, consumer, child) {
                      return CustomTextField(
                        controller: person.priceController,
                        labelText: '',
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) => consumer.setPropertyPricePerNight(value),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [sizedBox(0.0, width * 0.01), const Text('\$'), sizedBox(0.0, width * 0.005), const VerticalDivider()],
                        ),
                        borderRadius: 10,
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        enabledBorder: BorderSide(color: Colors.grey.shade300),
                      );
                    }),
                  ),
                  sizedBox(height * 0.01, 0.0),
                  Text('Including taxes, commission and charges', style: smallTextStyle),
                  sizedBox(height * 0.04, width),
                  SizedBox(
                    width: width * 0.3,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('15.00% Tuchtrip.com commission', style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400)),
                          sizedBox(height * 0.01, width),
                          for (int i = 0; i < 2; i++)
                            Row(
                              children: [
                                sizedBox(0.0, width * 0.02),
                                Icon(Icons.check, color: Colors.green),
                                sizedBox(0.0, width * 0.01),
                                Text(i == 0 ? '24/7 help in your language' : 'We promote your place on Google', style: smallTextStyle),
                              ],
                            ),
                          sizedBox(height * 0.03, 0.0),
                          Divider(color: Colors.grey.shade300),
                          sizedBox(height * 0.02, 0.0),
                          Consumer<RegistrationProvider>(
                              builder: (context, consumer, child) => Text('\$ ${(consumer.propertyPricePerNight - (consumer.propertyPricePerNight * 15) / 100)}.00 Your earnings (including taxes)',
                                  style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400)))
                        ],
                      ),
                    ),
                  ),
                  sizedBox(height * 0.04, width),
                ],
              ),
            ),
            sizedBox(height * 0.02, 0.0),
            CustomContainer(
              boxShadow: true,
              width: width * 0.35,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Get guest’s attention with a 20% discount', style: mediumTextStyleBold),
                  sizedBox(height * 0.01, 0.0),
                  Text(
                    'Give 20% off on your first 3 bookings or 90 days, whichever comes first.',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  sizedBox(height * 0.005, 0.0),
                  InkWell(
                    onTap: () {
                      show20persentageDetaileDialog(context);
                    },
                    child: Text(
                      'Learn more',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  sizedBox(height * 0.02, 0.0),
                  Divider(),
                  sizedBox(height * 0.02, 0.0),
                  Row(
                    children: [
                      Consumer<RegistrationProvider>(
                        builder: (context, consumer, child) => Text(
                          '\$${consumer.propertyPricePerNight}.00',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      sizedBox(0.0, width * 0.005),
                      Consumer<RegistrationProvider>(
                        builder: (context, consumer, child) => Text(
                          '\$${(consumer.propertyPricePerNight - (consumer.propertyPricePerNight * 20) / 100)} per night',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBox(height * 0.03, 0.0),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            Row(
              children: [
                backButton(height, width, () {
                  person.goToPage(backToPage, pageController);
                }),
                sizedBox(0.0, width * 0.005),
                Consumer<RegistrationProvider>(
                  builder: (context, value, child) => continueButton(height, width, person.priceController.text != '', () {
                    person.goToPage(goToPage, pageController);
                  }),
                )
              ],
            ),
            sizedBox(height * 0.2, width),
          ],
        ),
      ),
    );
  }

  ///=====================================================================================================================
  void show20persentageDetaileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bookings and reviews faster', style: mediumTextStyleBold),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 550,
                child: Text(
                  'Properties with a review score are more likely to be booked than those without. Increase your chances of getting bookings and reviews faster with a temporary 20% discount.',
                  style: smallTextStyle,
                ),
              ),
              const SizedBox(height: 20.0),
              Text('How it works', style: smallTextStyleBold),
              const SizedBox(height: 10.0),
              for (int i = 0; i < 3; i++)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.circle, size: 8),
                    sizedBox(0.0, 10),
                    Expanded(
                      child: Text(
                          [
                            'It applies to your first 3 bookings or up to 90 days, whichever comes first.',
                            'After that, your price will automatically go back to INR100.00.',
                            'You can also turn this New Property Deal off sooner.'
                          ][i],
                          style: smallTextStyle),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
