import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class PropertyAminities extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const PropertyAminities({
    super.key, required this.goToPage, required this.backToPage, required this.pageController,
  });

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
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.025, horizontal: width * 0.02),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('What can guests use at your place?',
                      style: largeTextStyleBold),
                  sizedBox(height * 0.04, width),
                  buildSectionTitle('General'),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => buildCheckboxRow([
                      buildCheckbox(
                          'Air conditioning', consumer.airConditioning,
                          (bool? value) {
                        consumer.setAirConditioning(value!);
                      }),
                      buildCheckbox('Heating', consumer.heating, (value) {
                        consumer.setHeating(value!);
                      }),
                      buildCheckbox('Free WiFi', consumer.freeWifi, (value) {
                        consumer.setFreeWifi(value!);
                      }),
                      buildCheckbox('Electric vehicle charging station',
                          consumer.evChargingStation, (value) {
                        consumer.setEvChargingStation(value!);
                      }),
                    ]),
                  ),
                  const Divider(),
                  buildSectionTitle('Cooking and cleaning'),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => buildCheckboxRow([
                      buildCheckbox('Kitchen', consumer.kitchen, (value) {
                        consumer.setKitchen(value!);
                      }),
                      buildCheckbox('Kitchenette', consumer.kitchenette,
                          (value) {
                        consumer.setKitchenette(value!);
                      }),
                      buildCheckbox('Washing machine', consumer.washingMachine,
                          (value) {
                        consumer.setWashingMachine(value!);
                      }),
                    ]),
                  ),
                  const Divider(),
                  buildSectionTitle('Entertainment'),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => buildCheckboxRow([
                      buildCheckbox('Flat-screen TV', consumer.flatScreenTV,
                          (value) {
                        consumer.setFlatScreenTV(value!);
                      }),
                      buildCheckbox('Swimming pool', consumer.swimmingPool,
                          (value) {
                        consumer.setSwimmingPool(value!);
                      }),
                      buildCheckbox('Hot tub', consumer.hotTub, (value) {
                        consumer.setHotTub(value!);
                      }),
                      buildCheckbox('Minibar', consumer.minibar, (value) {
                        consumer.setMinibar(value!);
                      }),
                      buildCheckbox('Sauna', consumer.sauna, (value) {
                        consumer.setSauna(value!);
                      }),
                    ]),
                  ),
                  const Divider(),
                  buildSectionTitle('Outside and view'),
                  Consumer<RegistrationProvider>(
                    builder: (context, consumer, child) => buildCheckboxRow([
                      buildCheckbox('Balcony', consumer.balcony, (value) {
                        consumer.setBalcony(value!);
                      }),
                      buildCheckbox('Garden view', consumer.gardenView,
                          (value) {
                        consumer.setGardenView(value!);
                      }),
                      buildCheckbox('Terrace', consumer.terrace, (value) {
                        consumer.setTerrace(value!);
                      }),
                      buildCheckbox('View', consumer.view, (value) {
                        consumer.setView(value!);
                      }),
                    ]),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.03, width),
            Row(
              children: [
                backButton(
                  height,
                  width,
                  () {
                    person.goToPage(backToPage,pageController);
                  },
                ),
                sizedBox(0.0, width * 0.02),
                continueButton(height, width, true, () {
                  person.goToPage(goToPage, pageController);
                })
              ],
            ),
            sizedBox(height * 0.2, width),
            
          ],
        ),
      ),
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
          fontWeight: FontWeight.w700,
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