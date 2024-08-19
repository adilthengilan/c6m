import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginProvider extends ChangeNotifier {
  PageController accountRegistrationPage = PageController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isVisiblePassword = true;

  //This Function for Login and Sign up pas password Obscure or Not Boolean setti =ng
  void showPassword() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }

  //This function Go to Next Page 
  void goToPage(int page, PageController pageController, isTrue) {
    if (isTrue) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Clearing All Controllers
  void clearControllers(){
    userNameController.clear();
    mobileNumberController.clear();
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  // Navigating to Gmail Inbox
   void navigateToGmail() async {
    const url ='https://mail.google.com/mail/u/1/#inbox';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

