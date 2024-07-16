import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/registration_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/apartment/apartment_page_1.dart';
import 'package:tuch_trip_crms/src/view/widgets/custom_container.dart';

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
    return SingleChildScrollView(
      child: Padding(
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.purpleAccent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            onPressed: person.galleryImagePicker,
                            icon: Icon(Icons.upload),
                            label: Text('Upload photos'),
                          ),
                          sizedBox(height * 0.02, 0.0),
                          Text(
                            'jpg/jpeg or png, maximum 47MB each',
                            style: smallTextStyle
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBox(height * 0.04, 0.0),
                      Consumer<RegistrationProvider>(
                        builder: (context, person, child) => 
                        SizedBox(
                          width: width * 0.33,
                          child: person.propertyImages!.isNotEmpty && person.propertyImages != null ?  GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: width * 0.03,
                              mainAxisSpacing: height * 0.04,
                            ),
                            itemCount: person.propertyImages!.length,
                            itemBuilder: (context, index) {
                              return CustomContainer(
                                boxShadow: false,
                                height: height * 0.3,
                                width: width * 0.3,
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: MemoryImage(person.propertyImages![index])
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: height * 0.01,right: width * 0.01),
                                    child: IconButton.outlined(
                                      style: IconButton.styleFrom(
                                        side: BorderSide(color: Colors.deepPurpleAccent)
                                      ),
                                      onPressed: (){
                                        person.removeImage(index);
                                      }, icon: Icon(Icons.close,color: Colors.white)),
                                  ),
                                ),
                              );
                            },
                          ): 
                        Container(
                          height: height * 0.01,
                        ),
                        ),
                      )
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
      ),
    );
  }
}
