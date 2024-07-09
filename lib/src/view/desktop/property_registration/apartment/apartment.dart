import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class Apartment extends StatelessWidget {
  const Apartment({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: backgroundColor,
      body: PageView(
        controller: person.apartmentPagecontroller,
        children: [
          const ApartmentPage1(),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.06, 0.0),
                CustomContainer(
                  boxShadow: true,
                  height: height * 0.65,
                  width: width * 0.35,
                  color: Colors.white,
                  child: Column(
                    children: [
                    sizedBox(height * 0.1, 0.0),
                    Icon(Icons.other_houses_outlined,
                    size: height * 0.1,
                    color: Colors.orangeAccent.shade100),
                    sizedbox(height * 0.02, 0.0),
                    SizedBox(
                      width: width * 0.22,
                      child: Text('Multiple apartments in the same location where guests can book an entire apartment',
                      style: largeTextStyleBold,
                      textAlign: TextAlign.center,
                      )
                    )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
