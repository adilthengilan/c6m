import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeStayPage2 extends StatelessWidget {
  const HomeStayPage2({super.key});

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
          ListView(
            shrinkWrap: true,
            children: [
              for (int i = 0; i < 5; i++)
                Consumer<RegistrationProvider>(
                  builder: (context, provider, child) => CheckboxListTile(
                    title: Text(
                      _getCheckboxLabel(i),
                      style: smallTextStyle,
                    ),
                    value: provider.selectedCheckboxes[i],
                    onChanged: (_) {
                      provider.toggleCheckbox(i);
                    },
                  ),
                ),
            ],
          ),
          sizedBox(height * 0.05, width),
          Row(
            children: [
              Container(
                height: height * 0.10,
                width: width * 0.07,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(06)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
              sizedBox(height * 0.01, width * 0.01),
              Container(
                height: height * 0.10,
                width: width * 0.700,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(06)),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: homestay.isOptionSelected
                        ? const Color.fromARGB(255, 133, 64, 251)
                        : Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (homestay.isOptionSelected) {
                      homestay.jumpPage(2);
                    }
                  },
                  child: Text('Continue',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
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
