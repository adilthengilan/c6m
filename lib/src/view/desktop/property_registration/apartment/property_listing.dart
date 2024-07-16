import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/view%20model/login_provider.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PropertyListing extends StatelessWidget {
  const PropertyListing({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final propertylisting =
        Provider.of<RegistrationProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, bottom: height * 0.04),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<RegistrationProvider>(
                builder: (context, PropertyListing, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  boxShadow: true,
                  width: width * 0.500,
                  color: backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.04,
                        left: width * 0.02,
                        right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.360,
                          child: Text(
                              "Are you listing the property as a business or an individual?",
                              style: mediumTextStyleBold),
                        ),
                        sizedbox(height * 0.05, width),
                        SizedBox(
                          width: width * 0.389,
                          child: Text(
                              "Your answer to this question will help us make sure we include all the necessary information in your contract.",
                              style: smallTextStyle),
                        ),
                        sizedbox(height * 0.05, width),
                        RadioListTile<bool>(
                          title: Text(
                            "Individual",
                            style: smallTextStyleBold,
                          ),
                          subtitle: Text(
                            "An individual or sole proprietor is a person who owns and operates an unincorporated business on their own.",
                            style: smallTextStyle,
                          ),
                          value: true,
                          groupValue: propertylisting.isIndividual,
                          onChanged: (value) {
                            propertylisting.setIndividual(value!);
                          },
                        ),
                        RadioListTile<bool>(
                          title: Text(
                            "Business",
                            style: smallTextStyleBold,
                          ),
                          subtitle: Text(
                              "A business entity can be owned by several individuals (e.g., as a partnership, public or private corporation, non-profit organization, etc.)",
                              style: smallTextStyle),
                          value: false,
                          groupValue: propertylisting.isIndividual,
                          onChanged: (value) {
                            propertylisting.setIndividual(value!);
                          },
                        ),
                        Divider(),
                        sizedbox(height * 0.04, width),
                        Text(
                          "If you list more properties in the future, we'll use the information below – you only need to enter it once.",
                          style: smallTextStyle,
                        ),
                        sizedbox(height * 0.05, width),
                        //===================================================Forms of  individual & business ====================================
                        propertylisting.isIndividual
                            //=======================================================================================================================

                            //================================================== Individual form ===================================================
                            //=======================================================================================================================
                            ? Padding(
                                padding: EdgeInsets.only(
                                    bottom: height * 0.03,
                                    top: height * 0.02,
                                    right: width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Personal information of the contracting party",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    sizedbox(height * 0.06, width),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        5,
                                        (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  index == 0
                                                      ? 'First name as stated on ID *'
                                                      : index == 1
                                                          ? 'Middle name(s) as stated on ID'
                                                          : index == 2
                                                              ? 'Last name as stated on ID *'
                                                              : index == 3
                                                                  ? 'Email *'
                                                                  : 'Phone number',
                                                  style: smallTextStyle),
                                              sizedBox(height * 0.01, 0.0),
                                              SizedBox(
                                                height: height * 0.055,
                                                // width: index == 2
                                                //     ? width * 0.1
                                                //     : width,
                                                child: Consumer<
                                                    RegistrationProvider>(
                                                  builder: (context, person,
                                                          child) =>
                                                      CustomTextField(
                                                    labelText: '',
                                                    onChanged: (index) {},
                                                    borderRadius: 10,
                                                    borderSide: const BorderSide(
                                                        color: Colors
                                                            .lightBlueAccent),
                                                    enabledBorder: BorderSide(
                                                        color: Colors
                                                            .grey.shade300),
                                                  ),
                                                ),
                                              ),
                                              sizedBox(height * 0.035, 0.0),
                                            ]),
                                      ),
                                    ),
                                    sizedbox(height * 0.04, width),
                                    Text(
                                        "Primary residence of the contracting party",
                                        style: mediumTextStyleBold),
                                    sizedbox(height * 0.04, width),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        3,
                                        (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  index == 0
                                                      ? 'Country/Region*'
                                                      : index == 1
                                                          ? 'Address line 1*'
                                                          : 'Address line 2*',
                                                  style: smallTextStyle),
                                              sizedBox(height * 0.01, 0.0),
                                              SizedBox(
                                                height: height * 0.055,
                                                // width: index == 2
                                                //     ? width * 0.1
                                                //     : width,
                                                child: Consumer<
                                                    RegistrationProvider>(
                                                  builder: (context, person,
                                                          child) =>
                                                      CustomTextField(
                                                    labelText: '',
                                                    onChanged: (index) {},
                                                    borderRadius: 10,
                                                    borderSide: const BorderSide(
                                                        color: Colors
                                                            .lightBlueAccent),
                                                    enabledBorder: BorderSide(
                                                        color: Colors
                                                            .grey.shade300),
                                                  ),
                                                ),
                                              ),
                                              sizedBox(height * 0.035, 0.0),
                                            ]),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("City *"),
                                                  SizedBox(
                                                    height: height * 0.055,
                                                    // width: index == 2
                                                    //     ? width * 0.1
                                                    //     : width,
                                                    child: Consumer<
                                                        RegistrationProvider>(
                                                      builder: (context, person,
                                                              child) =>
                                                          CustomTextField(
                                                        labelText: '',
                                                        onChanged: (index) {},
                                                        borderRadius: 10,
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .lightBlueAccent),
                                                        enabledBorder:
                                                            BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            sizedbox(
                                                height * 0.01, width * 0.01),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Zip code *"),
                                                  SizedBox(
                                                    height: height * 0.055,
                                                    // width: index == 2
                                                    //     ? width * 0.1
                                                    //     : width,
                                                    child: Consumer<
                                                        RegistrationProvider>(
                                                      builder: (context, person,
                                                              child) =>
                                                          CustomTextField(
                                                        labelText: '',
                                                        onChanged: (index) {},
                                                        borderRadius: 10,
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .lightBlueAccent),
                                                        enabledBorder:
                                                            BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            //==========================================================================================================================
                            //=================================================== Business textfield =====================================================
                            //==========================================================================================================================
                            : Padding(
                                padding: EdgeInsets.only(
                                    bottom: height * 0.03,
                                    top: height * 0.02,
                                    right: width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Legal business name",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    sizedbox(height * 0.04, width),
                                    Text(
                                      "Legal business name*",
                                      style: smallTextStyle,
                                    ),
                                    sizedbox(height * 0.01, width),
                                    SizedBox(
                                      height: height * 0.055,
                                      child: CustomTextField(
                                        labelText: '',
                                        onChanged: (index) {},
                                        borderRadius: 10,
                                        borderSide: const BorderSide(
                                            color: Colors.lightBlueAccent),
                                        enabledBorder: BorderSide(
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                    sizedbox(height * 0.04, width),
                                    Text(
                                      "Registered business address",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    sizedbox(height * 0.04, width),
                                    Text(
                                      "Country/Region*",
                                      style: smallTextStyle,
                                    ),
                                    sizedbox(height * 0.01, width),
                                    SizedBox(
                                      height: height * 0.055,
                                      // width: index == 2
                                      //     ? width * 0.1
                                      //     : width,
                                      child: Consumer<RegistrationProvider>(
                                        builder: (context, person, child) =>
                                            CustomTextField(
                                          labelText: '',
                                          onChanged: (index) {},
                                          borderRadius: 10,
                                          borderSide: const BorderSide(
                                              color: Colors.lightBlueAccent),
                                          enabledBorder: BorderSide(
                                              color: Colors.grey.shade300),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        2,
                                        (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  index == 0
                                                      ? 'Registered business address line 1*'
                                                      : 'Registered business address line 2',
                                                  style: smallTextStyle),
                                              sizedBox(height * 0.01, 0.0),
                                              SizedBox(
                                                height: height * 0.055,
                                                // width: index == 2
                                                //     ? width * 0.1
                                                //     : width,
                                                child: Consumer<
                                                    RegistrationProvider>(
                                                  builder: (context, person,
                                                          child) =>
                                                      CustomTextField(
                                                    labelText: '',
                                                    onChanged: (index) {},
                                                    borderRadius: 10,
                                                    borderSide: const BorderSide(
                                                        color: Colors
                                                            .lightBlueAccent),
                                                    enabledBorder: BorderSide(
                                                        color: Colors
                                                            .grey.shade300),
                                                  ),
                                                ),
                                              ),
                                              sizedBox(height * 0.035, 0.0),
                                            ]),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("City *"),
                                                  SizedBox(
                                                    height: height * 0.055,
                                                    // width: index == 2
                                                    //     ? width * 0.1
                                                    //     : width,
                                                    child: Consumer<
                                                        RegistrationProvider>(
                                                      builder: (context, person,
                                                              child) =>
                                                          CustomTextField(
                                                        labelText: '',
                                                        onChanged: (index) {},
                                                        borderRadius: 10,
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .lightBlueAccent),
                                                        enabledBorder:
                                                            BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            sizedbox(
                                                height * 0.01, width * 0.01),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Zip code *"),
                                                  SizedBox(
                                                    height: height * 0.055,
                                                    // width: index == 2
                                                    //     ? width * 0.1
                                                    //     : width,
                                                    child: Consumer<
                                                        RegistrationProvider>(
                                                      builder: (context, person,
                                                              child) =>
                                                          CustomTextField(
                                                        labelText: '',
                                                        onChanged: (index) {},
                                                        borderRadius: 10,
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .lightBlueAccent),
                                                        enabledBorder:
                                                            BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    sizedbox(height * 0.04, width),
                                    Text(
                                      "Legal representative’s personal information",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    sizedbox(height * 0.04, width),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        5,
                                        (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  index == 0
                                                      ? 'First name as stated on ID *'
                                                      : index == 1
                                                          ? 'Middle name(s) as stated on ID'
                                                          : index == 2
                                                              ? 'Last name as stated on ID *'
                                                              : index == 3
                                                                  ? 'Email *'
                                                                  : "Phone number *",
                                                  style: smallTextStyle),
                                              sizedBox(height * 0.01, 0.0),
                                              SizedBox(
                                                height: height * 0.055,
                                                // width: index == 2
                                                //     ? width * 0.1
                                                //     : width,
                                                child: Consumer<
                                                    RegistrationProvider>(
                                                  builder: (context, person,
                                                          child) =>
                                                      CustomTextField(
                                                    labelText: '',
                                                    onChanged: (index) {},
                                                    borderRadius: 10,
                                                    borderSide: const BorderSide(
                                                        color: Colors
                                                            .lightBlueAccent),
                                                    enabledBorder: BorderSide(
                                                        color: Colors
                                                            .grey.shade300),
                                                  ),
                                                ),
                                              ),
                                              sizedBox(height * 0.035, 0.0),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            //================================================= You are almoist done ===========================================================
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                boxShadow: true,
                width: width * 0.500,
                color: backgroundColor,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.04,
                      left: width * 0.02,
                      bottom: height * 0.02,
                      right: width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You’re almost done",
                        style: mediumTextStyleBold,
                      ),
                      Text(
                        "After you finish your registration you’ll be able to:",
                        style: smallTextStyle,
                      ),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.015),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        index == 0
                                            ? Icons.manage_accounts_rounded
                                            : index == 1
                                                ? Icons.monetization_on
                                                : Icons.mobile_friendly,
                                        size: 36,
                                      ),
                                      SizedBox(width: width * 0.015),
                                      Expanded(
                                        child: Text(
                                            index == 0
                                                ? 'Manage your property from your dashboard'
                                                : index == 1
                                                    ? 'Get bookings and make money from guests browsing our site'
                                                    : 'Stay on top of bookings from all the sites you use by syncing your calendar',
                                            style: smallTextStyle),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                      sizedbox(height * 0.04, width),
                      Divider(),
                      sizedbox(height * 0.02, width),
                      Consumer<RegistrationProvider>(
                        builder: (context, homestay, child) => Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (_) {},
                            ),
                            sizedBox(height * 0.01, width * 0.02),
                            SizedBox(
                              width: width * 0.360,
                              child: Text(
                                "I certify that this is a legitimate accommodation business with all necessary licenses and permits, which can be shown upon first request. Tuchtrip.com B.V. reserves the right to verify and investigate any details provided in this registration.",
                                style: smallTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedbox(height * 0.02, width),
                      Consumer<RegistrationProvider>(
                        builder: (context, homestay, child) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (_) {},
                            ),
                            sizedBox(height * 0.01, width * 0.02),
                            SizedBox(
                              width: width * 0.360,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            "I have read, accepted, and agreed to the ",
                                        style: smallTextStyle),
                                    TextSpan(
                                        text: "General Delivery Terms.",
                                        style: bluetextStyle
                                        // Add tap functionality to navigate to terms
                                        ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //=================================================================================================================================================
            //==================================================================== open booking ==============================================================
            //=================================================================================================================================================
            sizedBox(height * 0.03, width),
            Row(
              children: [
                Container(
                  height: height * 0.08,
                  width: width * 0.06,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(06)),
                  child: Icon(Icons.arrow_back_ios_new),
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
                      // if (hotel.isOptionSelected) {
                      //   hotel.goTonextPage(2);
                      // }
                    },
                    child: Text('Open for bookings',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                sizedBox(height * 0.07, width * 0.01),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
