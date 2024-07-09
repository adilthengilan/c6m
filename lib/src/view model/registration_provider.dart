import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController numberofPropertycontroller = TextEditingController();
  PageController apartmentPagecontroller = PageController();
  String propertyName = '';
  String propertyType = '';
  int numberofProperty = 1;
  bool isSameAddress = true;

//This Function will controlling page view, This function can easy to change the pages in the paview 
   void goToPage(int page) {
    apartmentPagecontroller.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

// Setting The Admins how to many Properties have Property count variable saving the property count
  void setNumberProperties(int propertyCount) {
    numberofProperty = propertyCount;
    notifyListeners();
  }

//setting The Admins multiple properties are in a same Location or Differnt Location it has saving in a bool variable
  void setpropertiesLocationSatus(bool issameAddress) {
    isSameAddress = issameAddress;
    notifyListeners();
  }

//This function is for Numbrer input of Admins Proerty count side, The Number of Property variable increase when the increase button click
  void increaseNumberProperty() {
    numberofProperty++;
    notifyListeners();
  }
//This function is for Numbrer input of Admins Proerty count side, The Number of Property variable Decrease when the Decrease button click
  void decreaseNumberProperty() {
    if (numberofProperty < 2) {
      numberofProperty--;
      notifyListeners();
    }
  }
  //This function is setting the Property Name when the user click write in Textfield That Spot time it will be Assignn to Controller.text
  void setPropertyName(String value) {
    propertyName = value;
    print(propertyName);
    notifyListeners();
  }
}