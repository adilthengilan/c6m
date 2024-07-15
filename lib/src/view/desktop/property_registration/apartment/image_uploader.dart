import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/property_registration/alternative_places/places2.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:provider/provider.dart';
class ImageUploader extends StatelessWidget {
  final int goToPage;
  final int backToPage;
  final PageController pageController;
  const ImageUploader({super.key, required this.goToPage, required this.backToPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<RegistrationProvider>(context);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.06, 0.0),
          CustomContainer(
            width: width * 0.35,
            boxShadow: true,
            padding: EdgeInsets.symmetric(vertical: height * 0.025, horizontal: width * 0.02),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.06, 0.0),
                SizedBox(
                  width: width * 0.35,
                  child: Text(
                    'Upload at least 5 photos of your property. The more you upload, the more likely you are to get bookings. You can add more later.',
                    style: TextStyle(fontSize: 16.0),
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
                          onPressed: () {
                            person.pickImage();
                          },
                          icon: Icon(Icons.upload),
                          label: Text('Upload photos'),
                        ),
                        sizedBox(height * 0.02, 0.0),
                        Text(
                          'jpg/jpeg or png, maximum 47MB each',
                          style: smallTextStyle
                        ),
                        person.proImage != null
                    ? Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                          gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 4.0,
                          ),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Image.file(person.proImage as File);
                          },
                        ),
                      )
                    : Container(),
                      ],
                    ),
                  ),
                ),
                sizedBox(height * 0.1, 0.0),
                
              ],
            ),
          ),
         sizedBox(height * 0.03, width),
      Row(
        children: [
          backButton(height, width, (){
            person.goToPage(backToPage, pageController);
          },
          ),
          sizedBox(0.0, width * 0.02),
          continueButton(height, width, true, (){
            person.goToPage(goToPage, pageController);
          })
        ],
      ),
        ],
      ),
    );
  }
}