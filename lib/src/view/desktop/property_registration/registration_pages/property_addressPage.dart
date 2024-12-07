import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_textfield.dart';

class PropertyAddressPage extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const PropertyAddressPage({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              padding: EdgeInsets.symmetric(vertical: height * 0.03, horizontal: width * 0.02),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.03, 0.0),
                  Text("Where is the property you're listing?", style: largeTextStyleBold),
                  sizedBox(height * 0.02, 0.0),
                  SizedBox(
                    width: width * 0.3,
                    child: Text(
                      'We may send a letter to confirm the location of your property, '
                      'so make sure that the address is correct – it’s difficult to make changes to it later.',
                      style: smallTextStyle,
                    ),
                  ),
                  sizedBox(height * 0.08, 0.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      4,
                      (index) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                            index == 0
                                ? 'Country/region'
                                : index == 1
                                    ? 'Street name and house number'
                                    : index == 2
                                        ? 'Post Code'
                                        : 'City',
                            style: smallTextStyle),
                        sizedBox(height * 0.01, 0.0),
                        SizedBox(
                          height: height * 0.08,
                          width: index == 2 ? width * 0.1 : width,
                          child: Consumer<RegistrationProvider>(
                            builder: (context, person, child) {
                              if (index == 0) {
                                return DropdownButtonFormField<String>(
                                  dropdownColor: Colors.white,
                                  value: person.propertyCountry.isNotEmpty ? person.propertyCountry : null,
                                  borderRadius: BorderRadius.circular(10),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    labelText: 'Select a country',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  items: countries.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    person.setPropertyCountry(newValue!);
                                  },
                                );
                              } else {
                                return CustomTextField(
                                  labelText: index == 1
                                      ? 'Enter Street Name or House NO'
                                      : index == 2
                                          ? 'Enter Post code'
                                          : 'Enter City Name',
                                  onChanged: (value) {
                                    switch (index) {
                                      case 1:
                                        person.setPropertyStreet(value);
                                        break;
                                      case 2:
                                        person.setPropertyPostCode(value);
                                        break;
                                      default:
                                        person.setPropertyCity(value);
                                        break;
                                    }
                                  },
                                  borderRadius: 10,
                                  borderSide: const BorderSide(color: Colors.lightBlueAccent),
                                  enabledBorder: BorderSide(color: Colors.grey.shade300),
                                );
                              }
                            },
                          ),
                        ),
                        sizedBox(height * 0.035, 0.0),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Consumer<RegistrationProvider>(
              builder: (context, person, child) => Row(
                children: [
                  // Back Button
                  backButton(height, width, () {
                    person.goToPage(backToPage, pageController);
                    person.propertyCountry = '';
                    person.propertyStreetName = '';
                    person.propertyCity = '';
                    person.propertyPostCode = '';
                  }),
                  sizedBox(0.0, width * 0.005),
                  //Continue Button
                  continueButton(
                    height,
                    width,
                    person.propertyCountry != '' && person.propertyStreetName != '' && person.propertyPostCode != '' && person.propertyCity != '',
                    () {
                      person.goToPage(goToPage, pageController);
                    },
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.2, width),
          ],
        ),
      ),
    );
  }
}

List<String> countries = [
  "Afghanistan",
  "Albania",
  "Algeria",
  "Andorra",
  "Angola",
  "Antigua and Barbuda",
  "Argentina",
  "Armenia",
  "Australia",
  "Austria",
  "Azerbaijan",
  "Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barbados",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bhutan",
  "Bolivia",
  "Bosnia and Herzegovina",
  "Botswana",
  "Brazil",
  "Brunei",
  "Bulgaria",
  "Burkina Faso",
  "Burundi",
  "Côte d'Ivoire",
  "Cabo Verde",
  "Cambodia",
  "Cameroon",
  "Canada",
  "Central African Republic",
  "Chad",
  "Chile",
  "China",
  "Colombia",
  "Comoros",
  "Congo (Congo-Brazzaville)",
  "Costa Rica",
  "Croatia",
  "Cuba",
  "Cyprus",
  "Czechia (Czech Republic)",
  "Democratic Republic of the Congo",
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Equatorial Guinea",
  "Eritrea",
  "Estonia",
  "Eswatini (fmr. 'Swaziland')",
  "Ethiopia",
  "Fiji",
  "Finland",
  "France",
  "Gabon",
  "Gambia",
  "Georgia",
  "Germany",
  "Ghana",
  "Greece",
  "Grenada",
  "Guatemala",
  "Guinea",
  "Guinea-Bissau",
  "Guyana",
  "Haiti",
  "Holy See",
  "Honduras",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Ireland",
  "Israel",
  "Italy",
  "Jamaica",
  "Japan",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kiribati",
  "Kuwait",
  "Kyrgyzstan",
  "Laos",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libya",
  "Liechtenstein",
  "Lithuania",
  "Luxembourg",
  "Madagascar",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Marshall Islands",
  "Mauritania",
  "Mauritius",
  "Mexico",
  "Micronesia",
  "Moldova",
  "Monaco",
  "Mongolia",
  "Montenegro",
  "Morocco",
  "Mozambique",
  "Myanmar (formerly Burma)",
  "Namibia",
  "Nauru",
  "Nepal",
  "Netherlands",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "North Korea",
  "North Macedonia",
  "Norway",
  "Oman",
  "Pakistan",
  "Palau",
  "Palestine State",
  "Panama",
  "Papua New Guinea",
  "Paraguay",
  "Peru",
  "Philippines",
  "Poland",
  "Portugal",
  "Qatar",
  "Romania",
  "Russia",
  "Rwanda",
  "Saint Kitts and Nevis",
  "Saint Lucia",
  "Saint Vincent and the Grenadines",
  "Samoa",
  "San Marino",
  "Sao Tome and Principe",
  "Saudi Arabia",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Singapore",
  "Slovakia",
  "Slovenia",
  "Solomon Islands",
  "Somalia",
  "South Africa",
  "South Korea",
  "South Sudan",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Suriname",
  "Sweden",
  "Switzerland",
  "Syria",
  "Tajikistan",
  "Tanzania",
  "Thailand",
  "Timor-Leste",
  "Togo",
  "Tonga",
  "Trinidad and Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Tuvalu",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "United States of America",
  "Uruguay",
  "Uzbekistan",
  "Vanuatu",
  "Venezuela",
  "Vietnam",
  "Yemen",
  "Zambia",
  "Zimbabwe",
];
