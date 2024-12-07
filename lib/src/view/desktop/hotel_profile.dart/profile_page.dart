import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/dashboard_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_detailes.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class HotelProfilePage extends StatelessWidget {
  const HotelProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppAppBar(pageName: false),
      body: Row(
        children: [
          Container(
            width: width * 0.17,
            color: Colors.grey.shade50,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) {
                    final buttons = [
                      {
                        'text': 'Property ',
                        'onTap': () {},
                      },
                      {
                        'text': 'Property ',
                        'onTap': () {},
                      },
                      {
                        'text': 'Property',
                        'onTap': () {},
                      },
                    ];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: Consumer<DashboardProvider>(
                        builder: (context, person, child) => GestureDetector(
                          onTap: () {
                            person.setSelectedButtonIndex(index);
                          },
                          child: CustomContainer(
                            height: height * 0.065,
                            width: width * 0.15,
                            padding: EdgeInsets.only(left: width * 0.01),
                            borderRadius: BorderRadius.circular(15),
                            gradiantColors: index == person.navigationButtonsSelectedIndex
                                ? [
                                    Colors.purple.shade500,
                                    Colors.purple.shade300,
                                  ]
                                : [
                                    Colors.grey.shade50,
                                    Colors.grey.shade50,
                                  ],
                            boxShadow: index == person.navigationButtonsSelectedIndex ? true : false,
                            child: Row(
                              mainAxisAlignment: index == person.navigationButtonsSelectedIndex ? MainAxisAlignment.center : MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.apartment,
                                  color: index == person.navigationButtonsSelectedIndex ? Colors.white : Colors.black,
                                ),
                                sizedBox(
                                  0.0,
                                  index == person.navigationButtonsSelectedIndex ? width * 0.012 : width * 0.015,
                                ),
                                Text(
                                  "${buttons[index]['text']} ${index + 1}",
                                  style: index == person.navigationButtonsSelectedIndex ? smallTextStylewhite : smallTextStyle,
                                ),
                                sizedBox(0.0, width * 0.01)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          sizedBox(0.0, width * 0.01),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.03, 0.0),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.8,
                  child: Row(
                    children: [
                      sizedBox(0.0, width * 0.01),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent.shade100, // Set button color
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.025),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          print("Edit Button Pressed");
                        },
                        child: Text(
                          "Edit",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent.shade100, // Set button color
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.025),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          print("Update Button Pressed");
                        },
                        child: Text(
                          "Update",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.82,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      firstColumn(height, width),
                      sizedBox(0.0, width * 0.01),
                      secondColumn(width, height, context),
                      sizedBox(0.0, width * 0.02),
                      thhirdColumn(height, width, context),
                    ],
                  ),
                ),
                sizedBox(height * 0.03, 0.0)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column firstColumn(double height, double width) {
    return Column(
      children: [
        sizedBox(height * 0.025, 0.0),
        CustomContainer(
          width: width * 0.25,
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: width * 0.01),
          padding: EdgeInsets.symmetric(vertical: height * 0.04, horizontal: width * 0.015),
          boxShadow: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Detailes",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ["Property Name", "Property Type", "Address", "Smart Check In"][index],
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: width * 0.14,
                        child: Text(
                          ["Baithans Hotel", "Three Star Hotel", "No 11/3319 B, junction, near Thoppumpady, Thoppumpady, Kochi, Kerala 682005•0484 292 9080", "Avilable"][index],
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              Text(
                "Available Rooms",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              sizedBox(height * 0.01, 0.0),
              ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Text(
                    "•   ${["Single Room", "Double Room", "Twin Room", "Triple Room", "Quad Room", "Deluxe Room", "Premium Room", "Royal Suite", "Superior Room"][index]}",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              sizedBox(height * 0.01, 0.0),
            ],
          ),
        ),
        sizedBox(height * 0.015, 0.0),
        CustomContainer(
          boxShadow: true,
          width: width * 0.25,
          padding: EdgeInsets.symmetric(vertical: height * 0.035, horizontal: width * 0.02),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Services at your property',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              sizedBox(height * 0.04, 0.0),
              Text(
                'Breakfast',
                style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Divider(),
              sizedBox(height * 0.01, 0.0),
              Text('Do you serve guests breakfast?', style: smallTextStyle),
              sizedBox(height * 0.02, 0.0),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => RadioButtons(
                  groupValue: consumer.isServeBreakfast,
                  onChanged1: (bool? value) {
                    consumer.setServeBreakfast(value!);
                  },
                  onChanged2: (bool? value) {
                    consumer.setServeBreakfast(value!);
                  },
                ),
              ),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => SizedBox(
                  child: consumer.isServeBreakfast
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBox(height * 0.03, 0.0),
                            Text('Is breakfast included in the price guests pay?', style: smallTextStyle),
                            sizedBox(height * 0.02, 0.0),
                            for (int i = 0; i < 2; i++)
                              Consumer<RegistrationProvider>(
                                builder: (context, consumer, child) => Row(
                                  children: [
                                    Radio<bool>(
                                      activeColor: Colors.lightBlueAccent,
                                      value: i == 0 ? true : false,
                                      groupValue: consumer.isBrakFastIncludedCost,
                                      onChanged: (bool? value) {
                                        consumer.setbraekFastCostIncluded(value);
                                      },
                                    ),
                                    Text(i == 0 ? "Yes, it's included" : "No, it costs extra", style: smallTextStyle),
                                  ],
                                ),
                              ),
                          ],
                        )
                      : SizedBox(),
                ),
              ),
              sizedBox(height * 0.03, 0.0),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => SizedBox(
                  child: !consumer.isBrakFastIncludedCost
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Breakfast price per person, per day', style: smallTextStyle),
                            sizedBox(height * 0.01, 0.0),
                            CustomContainer(
                              height: height * 0.05,
                              width: width,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                              boxShadow: false,
                              child: CustomTextField(
                                  labelText: '',
                                  prefixIcon: CustomContainer(
                                    boxShadow: false,
                                    border: Border(right: BorderSide(color: Colors.grey.shade300)),
                                    width: width * 0.02,
                                    height: height * 0.05,
                                    child: Center(
                                      child: Text('\$', style: smallTextStyleBold),
                                    ),
                                  )),
                            ),
                            Text('Including all fees and taxes', style: smallTextStyle),
                            sizedBox(height * 0.03, 0.0),
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => SizedBox(
                    child: consumer.isServeBreakfast
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              sizedBox(height * 0.02, 0.0),
                              Text('What type of breakfast do you offer?', style: mediumTextStyleBold),
                              Text('Select all that apply', style: smallTextStyle),
                              sizedBox(height * 0.03, 0.0),
                              Wrap(
                                spacing: height * 0.013,
                                runSpacing: width * 0.01,
                                children: [
                                  'À la carte',
                                  'American',
                                  'Asian',
                                  'Breakfast to go',
                                  'Buffet',
                                  'Continental',
                                  'Full English/Irish',
                                  'Gluten-free',
                                  'Halal',
                                  'Italian',
                                  'Kosher',
                                  'Vegan',
                                  'Vegetarian',
                                ].map((option) {
                                  return Consumer<RegistrationProvider>(builder: (context, consumer, child) {
                                    final isSelected = consumer.offeredbreakTypeFastList.contains(option);
                                    return InkWell(
                                      onTap: () {
                                        consumer.settingOfferdBreakFast(option, isSelected);
                                      },
                                      child: CustomContainer(
                                        boxShadow: false,
                                        padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
                                        color: isSelected ? Colors.purpleAccent.shade100 : Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(option, style: isSelected ? smallTextStylewhite : smallTextStyle),
                                            isSelected
                                                ? Padding(
                                                    padding: EdgeInsets.only(left: width * 0.01),
                                                    child: Icon(
                                                      Icons.close,
                                                      size: height * 0.02,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                }).toList(),
                              ),
                              sizedBox(height * 0.03, 0.0),
                            ],
                          )
                        : const SizedBox()),
              ),
              Text(
                'Parking',
                style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Divider(),
              sizedBox(height * 0.01, 0.0),
              Text(
                'Is parking available to guests?',
                style: smallTextStyle,
              ),
              sizedBox(height * 0.02, 0.0),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => Column(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: Colors.lightBlueAccent,
                            value: i == 0
                                ? 'Yes, free'
                                : i == 1
                                    ? 'Yes, paid'
                                    : 'No',
                            groupValue: consumer.parkingOption,
                            onChanged: (String? value) {
                              consumer.setParkingOption(value!);
                            },
                          ),
                          Text(
                              i == 0
                                  ? 'Yes, free'
                                  : i == 1
                                      ? 'Yes, Paid'
                                      : 'No',
                              style: smallTextStyle),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        sizedBox(height * 0.015, 0.0),
        CustomContainer(
          boxShadow: true,
          width: width * 0.25,
          padding: EdgeInsets.symmetric(vertical: height * 0.03, horizontal: width * 0.02),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'House rules',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              sizedBox(height * 0.03, width),
              Text('Check in', style: smallTextStyleBold),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            2,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(index == 0 ? 'From' : 'Until'),
                                sizedBox(height * 0.006, 0.0),
                                SizedBox(
                                  width: width * 0.08,
                                  child: Consumer<RegistrationProvider>(
                                    builder: (context, consumer, child) => DropdownButtonFormField<String>(
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                      value: index == 0 ? consumer.checkInFrom : consumer.checkInUntil,
                                      onChanged: (String? newValue) {
                                        index == 0 ? consumer.setCheckInFrom(newValue!) : consumer.setCheckInUntil(newValue!);
                                      },
                                      items: [
                                        '00:00',
                                        '01:00',
                                        '02:00',
                                        '03:00',
                                        '04:00',
                                        '05:00',
                                        '06:00',
                                        '07:00',
                                        '08:00',
                                        '09:00',
                                        '10:00',
                                        '11:00',
                                        '12:00',
                                        '13:00',
                                        '14:00',
                                        '15:00',
                                        '16:00',
                                        '17:00',
                                        '18:00',
                                        '19:00',
                                        '20:00',
                                        '21:00',
                                        '22:00',
                                        '23:00'
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        sizedBox(height * 0.03, 0.0),
                        Text('Check out', style: smallTextStyleBold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            2,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(index == 0 ? 'From' : 'Until'),
                                sizedBox(height * 0.006, 0.0),
                                SizedBox(
                                  width: width * 0.08,
                                  child: Consumer<RegistrationProvider>(
                                    builder: (context, consumer, child) => DropdownButtonFormField<String>(
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                      value: index == 0 ? consumer.checkOutFrom : consumer.checkOutUntil,
                                      onChanged: (String? newValue) {
                                        index == 0 ? consumer.setCheckOutFrom(newValue!) : consumer.setCheckOutUntil(newValue!);
                                      },
                                      items: [
                                        '00:00',
                                        '01:00',
                                        '02:00',
                                        '03:00',
                                        '04:00',
                                        '05:00',
                                        '06:00',
                                        '07:00',
                                        '08:00',
                                        '09:00',
                                        '10:00',
                                        '11:00',
                                        '12:00',
                                        '13:00',
                                        '14:00',
                                        '15:00',
                                        '16:00',
                                        '17:00',
                                        '18:00',
                                        '19:00',
                                        '20:00',
                                        '21:00',
                                        '22:00',
                                        '23:00'
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        sizedBox(height * 0.04, 0.0),
                        const Divider(),
                        sizedBox(height * 0.03, 0.0),
                        Text('Smoking allowed', style: smallTextStyleBold),
                        sizedBox(height * 0.02, 0.0),
                        Consumer<RegistrationProvider>(
                          builder: (context, consumer, child) => RadioButtons(
                            groupValue: consumer.issmokingAllowedHouseRules,
                            onChanged1: (value) {
                              consumer.setSmokingAllowed(value);
                            },
                            onChanged2: (value) {
                              consumer.setSmokingAllowed(value);
                            },
                          ),
                        ),
                        sizedBox(height * 0.04, 0.0),
                        Text('Do you allow Pets?', style: smallTextStyleBold),
                        sizedBox(height * 0.02, 0.0),
                        Consumer<RegistrationProvider>(
                          builder: (context, consumer, child) => RadioButtons(
                            groupValue: consumer.isallowPetshouseRules,
                            onChanged1: (value) {
                              consumer.setPetsAllowed(value);
                            },
                            onChanged2: (value) {
                              consumer.setPetsAllowed(value);
                            },
                          ),
                        ),
                        sizedBox(height * 0.04, 0.0),
                        Text('Parties/events allowed', style: smallTextStyleBold),
                        sizedBox(height * 0.02, 0.0),
                        Consumer<RegistrationProvider>(
                          builder: (context, consumer, child) => RadioButtons(
                            groupValue: consumer.iseventsAllowedHouseRules,
                            onChanged1: (value) {
                              consumer.setEventAllowed(value);
                            },
                            onChanged2: (value) {
                              consumer.setEventAllowed(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column secondColumn(double width, double height, BuildContext context) {
    return Column(
      children: [
        sizedBox(height * 0.025, 0.0),
        CustomContainer(
          boxShadow: true,
          width: width * 0.25,
          padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.02),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox(height * 0.01, 0.0),
              Text(
                "Location",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              sizedBox(height * 0.01, 0.0),
              Text(
                "Pin Your Location on the Map",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              InkWell(
                onTap: () {
                  Provider.of<RegistrationProvider>(context, listen: false).launchMaps('37.7749', '-122.4194');
                },
                child: CustomContainer(
                  boxShadow: false,
                  // width: width,
                  height: height * 0.3,
                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/google map image.png')),
                ),
              ),
              sizedBox(height * 0.02, 0.0),
            ],
          ),
        ),
        sizedBox(height * 0.015, 0.0),
        CustomContainer(
          width: width * 0.25,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: height * 0.03, horizontal: width * 0.0),
          boxShadow: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Text(
                  "Aminities",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              buildSectionTitle('General'),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => buildCheckboxRow([
                  buildCheckbox('Air conditioning', consumer.airConditioning, (bool? value) {
                    consumer.setPropertyAminities("airConditioning", value!);
                  }),
                  buildCheckbox('Heating', consumer.heating, (value) {
                    consumer.setPropertyAminities("heating", value!);
                  }),
                  buildCheckbox('Free WiFi', consumer.freeWifi, (value) {
                    consumer.setPropertyAminities("freeWifi", value!);
                  }),
                  buildCheckbox('Electric vehicle charging station', consumer.evChargingStation, (value) {
                    consumer.setPropertyAminities("evChargingStation", value!);
                  }),
                ]),
              ),
              const Divider(),
              buildSectionTitle('Cooking and cleaning'),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => buildCheckboxRow([
                  buildCheckbox('Kitchen', consumer.kitchen, (value) {
                    consumer.setPropertyAminities('kitchen', value!);
                  }),
                  buildCheckbox('Kitchenette', consumer.kitchenette, (value) {
                    consumer.setPropertyAminities('kitchenette', value!);
                  }),
                  buildCheckbox('Washing machine', consumer.washingMachine, (value) {
                    consumer.setPropertyAminities('washingMachine', value!);
                  }),
                ]),
              ),
              const Divider(),
              buildSectionTitle('Entertainment'),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => buildCheckboxRow([
                  buildCheckbox('Flat-screen TV', consumer.flatScreenTV, (value) {
                    consumer.setPropertyAminities('flatScreenTV', value!);
                  }),
                  buildCheckbox('Swimming pool', consumer.swimmingPool, (value) {
                    consumer.setPropertyAminities('swimmingPool', value!);
                  }),
                  buildCheckbox('Hot tub', consumer.hotTub, (value) {
                    consumer.setPropertyAminities('hotTub', value!);
                  }),
                  buildCheckbox('Minibar', consumer.minibar, (value) {
                    consumer.setPropertyAminities('minibar', value!);
                  }),
                  buildCheckbox('Sauna', consumer.sauna, (value) {
                    consumer.setPropertyAminities('sauna', value!);
                  }),
                ]),
              ),
              const Divider(),
              buildSectionTitle('Outside and view'),
              Consumer<RegistrationProvider>(
                builder: (context, consumer, child) => buildCheckboxRow([
                  buildCheckbox('Balcony', consumer.balcony, (value) {
                    consumer.setPropertyAminities('balcony', value!);
                  }),
                  buildCheckbox('Garden view', consumer.gardenView, (value) {
                    consumer.setPropertyAminities('gardenView', value!);
                  }),
                  buildCheckbox('Terrace', consumer.terrace, (value) {
                    consumer.setPropertyAminities('terrace', value!);
                  }),
                  buildCheckbox('View', consumer.view, (value) {
                    consumer.setPropertyAminities('view', value!);
                  }),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column thhirdColumn(double height, double width, context) {
    return Column(
      children: [
        sizedBox(height * 0.025, 0.0),
        CustomContainer(
          width: width * 0.25,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: height * 0.035, horizontal: width * 0.02),
          boxShadow: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chanel Manager",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.015),
                    child: Row(
                      children: [
                        Text(
                          ["Agoda", "Booking.com", "Airbnd"][index],
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                          ),
                        ),
                        Spacer(),
                        Switch(
                          value: [true, false, true][index],
                          onChanged: (bool value) {},
                          activeColor: Colors.white, // Thumb color when active
                          activeTrackColor: Colors.lightBlueAccent.shade400, // Track color when active
                          inactiveThumbColor: Colors.grey, // Thumb color when inactive
                          inactiveTrackColor: Colors.grey.shade300, // Track color when inactive
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        sizedBox(height * 0.015, 0.0),
        CustomContainer(
          width: width * 0.25,
          boxShadow: true,
          padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.02),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox(height * 0.02, 0.0),
              SizedBox(
                height: height * 0.25,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainer(
                      height: height * 0.25,
                      width: width * 0.155,
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: false,
                    ),
                    sizedBox(0.0, width * 0.005),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: height * 0.002),
                            child: CustomContainer(
                              width: width * 0.05,
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              SizedBox(
                width: width * 0.35,
                child: Text(
                  'Upload More Property Snapshots',
                  style: smallTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: height * 0.025),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.image, size: 50, color: Colors.grey),
                      sizedBox(height * 0.02, 0.0),
                      const Text(
                        'Drag and drop or',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      sizedBox(height * 0.02, 0.0),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.purpleAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          Provider.of<RegistrationProvider>(context, listen: false).galleryImagePicker();
                        },
                        icon: Icon(Icons.upload),
                        label: Text('Upload photos'),
                      ),
                      sizedBox(height * 0.02, 0.0),
                      Text('jpg/jpeg or png, maximum 47MB each', style: smallTextStyle),
                    ],
                  ),
                ),
              ),
              sizedBox(height * 0.03, 0.0),
              Consumer<RegistrationProvider>(
                builder: (context, person, child) => SizedBox(
                  width: width * 0.33,
                  child: person.propertyImagesList!.isNotEmpty && person.propertyImagesList != null
                      ? GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: width * 0.03,
                            mainAxisSpacing: height * 0.04,
                          ),
                          itemCount: person.propertyImagesList!.length,
                          itemBuilder: (context, index) {
                            return CustomContainer(
                              boxShadow: false,
                              height: height * 0.3,
                              width: width * 0.3,
                              color: Colors.grey.shade200,
                              image: DecorationImage(fit: BoxFit.fill, image: MemoryImage(person.propertyImagesList![index])),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(top: height * 0.01, right: width * 0.01),
                                  child: IconButton.outlined(
                                      style: IconButton.styleFrom(side: BorderSide(color: Colors.deepPurpleAccent)),
                                      onPressed: () {
                                        person.removeImage(index);
                                      },
                                      icon: Icon(Icons.close, color: Colors.white)),
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox(height: height * 0.01),
                ),
              ),
              sizedBox(height * 0.02, 0.0),
            ],
          ),
        ),
        sizedBox(height * 0.015, 0.0),
        CustomContainer(
          width: width * 0.25,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: height * 0.035, horizontal: width * 0.02),
          boxShadow: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Information",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              sizedBox(height * 0.02, 0.0),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.015),
                    child: Row(
                      children: [
                        Text(
                          ["Phone Number", "Email", "WebSite"][index],
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          ["+91 9446085810", "Baithans@gmail.com", "https://www.baithans.com/"][index],
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildCheckboxRow(List<Widget> checkboxes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: checkboxes.map((checkbox) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: checkbox),
          ],
        );
      }).toList(),
    );
  }

  Widget buildCheckbox(String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      activeColor: Colors.cyanAccent,
      title: Text(title, style: smallTextStyle),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
