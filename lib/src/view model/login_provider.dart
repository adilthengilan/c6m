import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:html';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginProvider extends ChangeNotifier {
  PageController accountRegistrationPage = PageController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isVisiblePassword = true;
  var status;
  String? token;
  List<dynamic> tokenList = [];

// Save data
  Future<void> saveToPreferences(String key, value) async {
    print(value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

// Retrieve data
  Future<String?> retriveFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    tokenList = prefs.getStringList(key) ?? [];
    print(tokenList);
    notifyListeners();
    return prefs.getString(key);
  }

// Remove data
  Future<void> removeFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

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
  void clearControllers() {
    userNameController.clear();
    mobileNumberController.clear();
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  // Navigating to Gmail Inbox
  void navigateToGmail() async {
    const url = 'https://mail.google.com/mail/u/1/#inbox';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // final _endpoint = '';
  Future<void> registerAccount(String username, String email, String password,
      String phoneNumber) async {
    print('${username},${email},${phoneNumber}');
    final _apikey = "http://15.206.167.186:3000";

    try {
      var headers = {'Content-Type': 'application/json'};

      var body = json.encode({
        "username": username,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber // Use a valid phone number
      });

      final response = await http.post(
        Uri.parse('$_apikey/api/admin/register'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print("Registration Successful: ${response.body}");
        loginAccount(username, email, password, phoneNumber);
      } else {
        status = response.reasonPhrase;
        notifyListeners();
        print(
            "Failed to Registerss: ${response.statusCode} - ${response.body}");
        if (response.reasonPhrase == 'Created') {
          loginAccount(username, email, password, phoneNumber);
        } else {}
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  Future<void> loginAccount(String username, String email, String password,
      String phoneNumber) async {
    print('${username},${email},${phoneNumber}');
    final _apikey = "http://15.206.167.186:3000";

    try {
      var headers = {'Content-Type': 'application/json'};

      var body = json.encode({
        "phoneNumber": phoneNumber,
        "password": password
        // Use a valid phone number
      });

      final response = await http.post(
        Uri.parse('$_apikey/api/admin/login'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> tokenListS = jsonDecode(response.body);
        // token = response.body;
        tokenList = tokenListS[0]['token'];
        print(tokenList);
        notifyListeners();

        saveToPreferences('authtoken', tokenList);
        notifyListeners();
        print('Your Token is = $token');
        print("Login Successful: ${response.body}");
      } else {
        print("Failed to LOGIN: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }
}
