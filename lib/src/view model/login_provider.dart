import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view/desktop/Login/login_screen.dart';


class LoginProvider extends ChangeNotifier {
  String _employeeId = '';
  String _department = 'Reception';
  String _password = '';
  bool _keepLoggedIn = false;

  String get employeeId => _employeeId;
  String get department => _department;
  String get password => _password;
  bool get keepLoggedIn => _keepLoggedIn;

  void updateEmployeeId(String id) {
    _employeeId = id;
    notifyListeners();
  }

  void updateDepartment(String dept) {
    _department = dept;
    notifyListeners();
  }

  void updatePassword(String pass) {
    _password = pass;
    notifyListeners();
  }

  void toggleKeepLoggedIn(bool value) {
    _keepLoggedIn = value;
    notifyListeners();
  }

  PageController pageController = PageController();
  int currentPage = 0;
  // get started Screen Images
  final List<String> getStartedImage = [
    "assets/images/get_started_image_1.png",
    "assets/images/get_started_image_2.png",
    "assets/images/get_started_image_3.png",
  ];
// This function for Moving to Next Image, if
  void moveToNextImage(context) {
    if (currentPage < getStartedImage.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    } else {
      // Go to the Login Screen screen after all images
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false,
      );
    }
    notifyListeners();
  }
}

Widget sizedbox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}
