import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class PropertyListing extends StatelessWidget {
  final int backToPage;
  final PageController pageController;
  const PropertyListing({super.key, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, bottom: height * 0.04),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, width),
            Consumer<RegistrationProvider>(builder: (context, PropertyListing, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  boxShadow: true,
                  width: width * 0.45,
                  color: backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.04, left: width * 0.02, right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBox(height * 0.03, width),
                        Text("Are you listing the property as a business or an individual?", style: mediumTextStyleBold),
                        sizedBox(height * 0.03, width),
                        Text("Your answer to this question will help us make sure we include all the necessary information in your contract.", style: smallTextStyle),
                        sizedBox(height * 0.05, width),
                        RadioListTile<bool>(
                          title: Text("Individual", style: smallTextStyleBold),
                          subtitle: Text("An individual or sole proprietor is a person who owns and operates an unincorporated business on their own.", style: smallTextStyle),
                          value: false,
                          groupValue: person.isBussnessCorporation,
                          onChanged: (value) {
                            person.setIndividual(value!);
                          },
                        ),
                        RadioListTile<bool>(
                          title: Text(
                            "Business",
                            style: smallTextStyleBold,
                          ),
                          subtitle: Text("A business entity can be owned by several individuals (e.g., as a partnership, public or private corporation, non-profit organization, etc.)",
                              style: smallTextStyle),
                          value: true,
                          groupValue: person.isBussnessCorporation,
                          onChanged: (value) {
                            person.setIndividual(value!);
                          },
                        ),
                        sizedBox(height * 0.02, width),
                        const Divider(),
                        sizedBox(height * 0.04, width),
                        Text(
                          "If you list more properties in the future, we'll use the information below – you only need to enter it once.",
                          style: smallTextStyle,
                        ),
                        sizedBox(height * 0.04, width),
                        // personalInformation(height, width)
                        legalInformations(height, width),
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
                padding: EdgeInsets.only(top: height * 0.04, left: width * 0.02, bottom: height * 0.02, right: width * 0.02),
                width: width * 0.45,
                color: backgroundColor,
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
                    sizedBox(height * 0.02, 0.0),
                    const Divider(),
                    sizedBox(height * 0.02, 0.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 0.015),
                          child: Row(
                            children: <Widget>[
                              Icon([Icons.manage_accounts_rounded, Icons.monetization_on, Icons.mobile_friendly][index], size: 28),
                              SizedBox(width: width * 0.017),
                              SizedBox(
                                width: width * 0.3,
                                child: Text(
                                    [
                                      'Manage your property from your dashboard',
                                      'Get bookings and make money from guests browsing our site',
                                      'Stay on top of bookings from all the sites you use by syncing your calendar',
                                    ][index],
                                    style: smallTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    sizedBox(height * 0.04, width),
                    const Divider(),
                    sizedBox(height * 0.02, width),
                    Consumer<RegistrationProvider>(
                      builder: (context, person, child) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: person.isAllowNecesseryLicense,
                            onChanged: (value) {
                              person.setIsAllowNecesseryLicense(value);
                            },
                          ),
                          sizedBox(height * 0.01, width * 0.02),
                          SizedBox(
                            width: width * 0.35,
                            child: Text(
                              "I certify that this is a legitimate accommodation business with all necessary licenses and permits, which can be shown upon first request. Tuchtrip.com B.V. reserves the right to verify and investigate any details provided in this registration.",
                              style: smallTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBox(height * 0.02, width),
                    Consumer<RegistrationProvider>(
                      builder: (context, person, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: person.isIHaveReadAndAccepted,
                            onChanged: (value) {
                              person.setIsIHaveReadAndAccepted(value);
                            },
                          ),
                          sizedBox(height * 0.01, width * 0.02),
                          SizedBox(
                            width: width * 0.360,
                            child: Row(
                              children: [
                                Text("I have read, accepted, and agreed to the", style: smallTextStyle),
                                sizedBox(0.0, width * 0.005),
                                Text(
                                  "General Delivery Terms.",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBox(height * 0.02, 0.0),
                  ],
                ),
              ),
            ),
            sizedBox(height * 0.03, width),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    person.goToPage(backToPage, pageController);
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.04,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(06)),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                sizedBox(height * 0.01, width * 0.01),
                Container(
                  height: height * 0.06,
                  width: width * 0.40,
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(06)),
                  child: Consumer<RegistrationProvider>(
                    builder: (context, person, child) => TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: person.isIHaveReadAndAccepted && person.isAllowNecesseryLicense ? const Color.fromARGB(255, 34, 158, 207) : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: person.isIHaveReadAndAccepted && person.isAllowNecesseryLicense ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DesktopView()));
                        person.addApartmnetList();
                      }: (){},
                      child: const Text('Open for bookings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    ),
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

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Padding legalInformations(double height, double width) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.03, right: width * 0.02),
      child: Consumer<RegistrationProvider>(
        builder: (context, person, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: Text(
                person.isBussnessCorporation ? "Legal business name" : "Personal information of the contracting party",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            person.isBussnessCorporation ? legalBussnessInformation(person, height, width) : individualPropertyInformation(height),
            person.isBussnessCorporation
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.05),
                    child: Text(
                      "Legal representative’s personal information",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const SizedBox(),
            person.isBussnessCorporation ? individualPropertyInformation(height) : legalBussnessInformation(person, height, width),
          ],
        ),
      ),
    );
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Padding legalBussnessInformation(RegistrationProvider person, double height, double width) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          person.isBussnessCorporation
              ? Text(
                  "Legal business name*",
                  style: smallTextStyle,
                )
              : const SizedBox(),
          person.isBussnessCorporation
              ? SizedBox(
                  height: height * 0.055,
                  child: CustomTextField(
                    controller: person.propertyLegalName,
                    labelText: '',
                    borderRadius: 10,
                    borderSide: const BorderSide(color: Colors.lightBlueAccent),
                    enabledBorder: BorderSide(color: Colors.grey.shade300),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.06),
            child: Text(
              person.isBussnessCorporation ? "Registered business address" : "Primary residence of the contracting party",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              3,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  person.isBussnessCorporation
                      ? Text(["Country/Region*", 'Registered business address line 1*', 'Registered business address line 2'][index], style: smallTextStyle)
                      : Text(['Country/Region', 'Address line 1', 'Address line 2'][index], style: smallTextStyle),
                  sizedBox(height * 0.01, 0.0),
                  SizedBox(
                    height: height * 0.055,
                    child: Consumer<RegistrationProvider>(
                      builder: (context, person, child) => CustomTextField(
                        controller: [person.registerdCountryOrRegion, person.registerdAddressLine1, person.registerdAddressLine2][index],
                        labelText: '',
                        borderRadius: 10,
                        borderSide: const BorderSide(color: Colors.lightBlueAccent),
                        enabledBorder: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  sizedBox(height * 0.035, 0.0),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("City *"),
                    SizedBox(
                      height: height * 0.055,
                      child: Consumer<RegistrationProvider>(
                        builder: (context, person, child) => CustomTextField(
                          controller: person.registeredCity,
                          labelText: '',
                          borderRadius: 10,
                          borderSide: const BorderSide(color: Colors.lightBlueAccent),
                          enabledBorder: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBox(height * 0.01, width * 0.01),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Zip code *"),
                    SizedBox(
                      height: height * 0.055,
                      child: Consumer<RegistrationProvider>(
                        builder: (context, person, child) => CustomTextField(
                          controller: person.registeredZipCode,
                          labelText: '',
                          borderRadius: 10,
                          borderSide: const BorderSide(color: Colors.lightBlueAccent),
                          enabledBorder: BorderSide(color: Colors.grey.shade300),
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
    );
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Column individualPropertyInformation(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        5,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                [
                  'First name as stated on ID *',
                  'Middle name(s) as stated on ID',
                  'Last name as stated on ID *',
                  'Email *',
                  "Phone number *",
                ][index],
                style: smallTextStyle),
            sizedBox(height * 0.01, 0.0),
            SizedBox(
              child: Consumer<RegistrationProvider>(
                builder: (context, person, child) => CustomTextField(
                  controller: [
                    person.propertyFirstNameStatedOnID,
                    person.propertyMiddleNameStatedOnID,
                    person.propertyLastNameStatedOnID,
                    person.propertyOfficialEmail,
                    person.propertyPhoneNumber,
                  ][index],
                  labelText: '',
                  borderRadius: 10,
                  borderSide: const BorderSide(color: Colors.lightBlueAccent),
                  enabledBorder: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            sizedBox(height * 0.035, 0.0),
          ],
        ),
      ),
    );
  }
}
