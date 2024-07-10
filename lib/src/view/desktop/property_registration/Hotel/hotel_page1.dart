import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/login_provider.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/Hotel/hotel.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/place1.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/registration_menu.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:provider/provider.dart';

class HotelPage1 extends StatelessWidget {
  const HotelPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: RegistrationAppBar(height, width),
      backgroundColor: backgroundColor,
      body: Consumer<RegistrationProvider>(builder: (context, person, child) {
        return PageView(
          // controller: person.alternativeplacescontroller,
          children: [
            const Hotels(),
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
                        sizedBox(height * 0.02, 0.0),
                        SizedBox(
                            width: width * 0.22,
                            child: Text(
                              'Multiple apartments in the same location where guests can book an entire apartment',
                              style: largeTextStyleBold,
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
