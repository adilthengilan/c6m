import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/guest_management_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class CheckInForm extends StatelessWidget {
  const CheckInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CustomContainer(
          boxShadow: true,
          width: width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.03),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Check-In', style: mediumTextStyleBold),
              sizedBox(height * 0.06, 0.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: height * 0.06),
                    child: Row(
                      children: [
                        CustomContainer(
                          width: width * 0.25,
                          color: Colors.white,
                          boxShadow: false,
                          height: height * 0.055,
                          borderRadius: BorderRadius.circular(15),
                          child: CustomTextField(
                            labelText: index == 0
                                ? 'First Name'
                                : index == 1
                                    ? 'Mobile Number'
                                    : 'Country',
                            controller: index == 0
                                ? occupentCheckInFirstNameController
                                : index == 1
                                    ? occupentCheckInMobileNumberController
                                    : occupentChecInCountryController,
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: 10,
                            enabledBorder:
                                BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                        sizedBox(0.0, width * 0.04),
                        CustomContainer(
                          width: width * 0.25,
                          color: Colors.white,
                          boxShadow: false,
                          height: height * 0.055,
                          borderRadius: BorderRadius.circular(15),
                          child: CustomTextField(
                            labelText: index == 0
                                ? 'Last Name'
                                : index == 1
                                    ? 'Email'
                                    : 'Country',
                            controller: index == 0
                                ? occupentCheckInFirstNameController
                                : index == 1
                                    ? occupentCheckInMobileNumberController
                                    : occupentChecInCountryController,
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: 10,
                            enabledBorder:
                                BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              dropDownMenuButton(width),
              sizedBox(height * 0.03, width),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomContainer(
                    boxShadow: true,
                    height: height * 0.055,
                    width: width * 0.15,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyanAccent.shade400,
                    child: Center(child: Text('Proceed',style: smallTextStyle)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dropDownMenuButton(double width) {
    return Container(
      width: width * 0.25,
      child: Consumer<GuestManagementProvider>(
        builder: (context, person, child) => DropdownButtonFormField<String>(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          icon: Icon(Icons.keyboard_arrow_down_sharp),
          dropdownColor: Colors.white,
          decoration: InputDecoration(
            labelText: person.roomNumberfloor,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
          value: person.roomNumberfloor ?? 'Select Floor',
          items: <String>[
            'Available Rooms',
            'The Royal National',
            'Hotel 2',
            'Hotel 3'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            person.setfloor(value);
          },
        ),
      ),
    );
  }
}
