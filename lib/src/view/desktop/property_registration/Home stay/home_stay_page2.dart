import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeStayPage2 extends StatelessWidget {
  final int jumPage;
  final PageController pageController;

  const HomeStayPage2(
      {super.key, required this.jumPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final homestay = Provider.of<RegistrationProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.06),
          Text(
            'Where else is your property listed?',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
          SizedBox(height: height * 0.03),
          Text(
            'If your property is listed on Airbnb, you can speed up registration by importing it directly to Booking.com.',
            style: GoogleFonts.montserrat(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          SizedBox(height: height * 0.03),
          Container(
            width: width * 0.300,
            child: ListView(
              shrinkWrap: true,
              children: [
                for (int i = 0; i < 5; i++)
                  Consumer<RegistrationProvider>(
                    builder: (context, homestay, child) => Row(
                      children: [
                        Checkbox(
                          value: homestay.selectedCheckboxes[i],
                          onChanged: (_) {
                            homestay.toggleCheckbox(i);
                          },
                        ),
                        sizedBox(height * 0.01, width * 0.02),
                        Text(
                          _getCheckboxLabel(i),
                          style: smallTextStyle,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          sizedBox(height * 0.05, width),
          Row(children: []),
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }

  String _getCheckboxLabel(int index) {
    switch (index) {
      case 0:
        return 'Airbnb';
      case 1:
        return 'TripAdvisor';
      case 2:
        return 'Vrbo';
      case 3:
        return 'Another website';
      case 4:
        return "My property isn't listed on any other websites";
      default:
        return '';
    }
  }
}
