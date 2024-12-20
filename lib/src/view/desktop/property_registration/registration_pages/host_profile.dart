import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_pages/property_cout.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

class HostProfilePage extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const HostProfilePage({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
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
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.04, width),
                  Text('Host profile', style: largeTextStyleBold),
                  sizedBox(height * 0.04, 0.0),
                  Text('Help your listing stand out by telling potential guests a bit more about yourself, your property and your neighbourhood. This information will be shown on your property page.',
                      style: smallTextStyle),
                  sizedBox(height * 0.02, width),
                  Consumer<RegistrationProvider>(
                    builder: (context, provider, child) {
                      return CheckboxListTile(
                        title: Text(
                          'The property',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        value: provider.isShowPropertyFieldOpen,
                        onChanged: (value) => provider.toggleProperty(value!),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Consumer<RegistrationProvider>(
                      builder: (context, provider, child) {
                        return Visibility(
                          visible: provider.isShowPropertyFieldOpen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('About the property'),
                              TextField(
                                controller: person.aboutThePropertyController,
                                maxLength: 1200,
                                decoration: const InputDecoration(
                                  hintText: 'What makes your place unique? What can guests expect?',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 5,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Consumer<RegistrationProvider>(
                    builder: (context, provider, child) {
                      return CheckboxListTile(
                        title: Text(
                          'The host',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        value: provider.isShowHostDetailsAboutPropertyOpen,
                        onChanged: (value) => provider.toggleHost(value!),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Consumer<RegistrationProvider>(
                      builder: (context, provider, child) {
                        return Visibility(
                          visible: provider.isShowHostDetailsAboutPropertyOpen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Host name'),
                              TextField(
                                controller: person.theHostNameController,
                                maxLength: 80,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text('About the host'),
                              TextField(
                                controller: person.aboutTheHostController,
                                maxLength: 1200,
                                decoration: const InputDecoration(
                                  hintText: 'What are your interests? What do you like about hosting?',
                                  semanticCounterText: '',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 5,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Consumer<RegistrationProvider>(
                    builder: (context, provider, child) {
                      return CheckboxListTile(
                        title: Text(
                          'The neighbourhood',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        value: provider.isShowAboutNeighborhoodOpen,
                        onChanged: (value) => provider.toggleNeighborhood(value!),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Consumer<RegistrationProvider>(
                      builder: (context, provider, child) {
                        return Visibility(
                          visible: provider.isShowAboutNeighborhoodOpen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('About the neighbourhood'),
                              TextField(
                                controller: person.aboutTheNeighbourhoodController,
                                maxLength: 1200,
                                decoration: const InputDecoration(
                                  hintText: 'What’s the area like? Are there any attractions nearby?',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 5,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Consumer<RegistrationProvider>(
                    builder: (context, provider, child) {
                      return CheckboxListTile(
                        title: Text(
                          "None of the above/I'll add these later",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        value: !provider.isShowPropertyFieldOpen && !provider.isShowHostDetailsAboutPropertyOpen && !provider.isShowAboutNeighborhoodOpen,
                        onChanged: (value) => provider.toggleAll(value!),
                      );
                    },
                  ),
                  sizedBox(height * 0.04, 0.0),
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
                    person.goToPage(backToPage, pageController);
                  },
                ),
                sizedBox(0.0, width * 0.005),
                continueButton(height, width, true, () {
                  person.goToPage(goToPage, pageController);
                  person.addHostProfileDetailsTohostProfileDetailsMap();
                })
              ],
            ),
            sizedBox(height * 0.2, width),
          ],
        ),
      ),
    );
  }
}
