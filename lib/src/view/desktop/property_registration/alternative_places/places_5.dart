import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view%20model/registration_provider.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_container.dart';
import 'package:flutter_application_1/src/view/desktop/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class Places5 extends StatelessWidget {
  const Places5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.06, 0.0),

          CustomContainer(
            boxShadow: true,
            height: height * 0.70,
            width: width * 0.35,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.02),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height * 0.06, 0.0),
                Text("Where is the property you're listing?",
                    style: largeTextStyleBold),
                sizedBox(height * 0.03, 0.0),
                for (int i = 0; i < 2; i++)
                  SizedBox(
                    width: width * 0.3,
                    child: Text(i == 0 ? 'Country/region' : 'Find Your Address',
                        style: smallTextStyle),
                  ),
                sizedBox(height * 0.01, 0.0),
                SizedBox(
                  height: height * 0.055,
                  width: width,
                  child: Consumer<RegistrationProvider>(
                    builder: (context, person, child) => CustomTextField(
                      labelText: person.propertyName,
                      onChanged: (value) {
                        person.setPropertyName(value);
                      },
                      borderRadius: 10,
                      borderSide:
                          const BorderSide(color: Colors.lightBlueAccent),
                      enabledBorder: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ],
            ),
          ),
          sizedBox(height * 0.03, width),
          // Consumer<RegistrationProvider>(
          //   builder: (context, person, child) =>
          //   Row(
          //     children: [
          //       // Back Button
          //       backButton(height, width, (){
          //         person.goToPage(1);
          //         person.propertyName = '';
          //       }),
          //       sizedBox(0.0, width * 0.02),
          //       //Continue Button
          //       continueButton(
          //         height, width,
          //         person.propertyName == '',
          //         (){
          //           person.goToPage(3);
          //         },
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
