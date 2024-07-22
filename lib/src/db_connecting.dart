import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/view/widgets/toast_message.dart';


class DBConnecting extends ChangeNotifier {
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// Account Registration ////////////////////////////////////////////////////
  //The Base Url of the Api
  final String _baseUrl = 'http://13.233.156.216/api/admin';
  //End points of the Api 
  final _accountRegisterEndPoint = '/register';
  final _loginEndPoint = '/login';
  final _verifyOTPEndPoint = '/verify-otp'; 
  //The Headers of the Api, it will be call in all function, so i assign to a headers variale
  final _headers = {'Content-Type': 'application/json'};
  // This when the user registered it will be true and we can check the user is registered or not
  bool isRegistered = false;

  bool isVerifyOTP = false;

  bool isLogedIn = false;
  //This Variable can indicates the tocken of the user. we can get it by Login
  dynamic token;
  // This Loading Variable, when it true the loading is starts 
  bool isLoading = false;
  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// Register Admin /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> registerAdmin(String userName,String email,String password,String phoneNumber) async {
  isLoading = true;
  final url = Uri.parse('$_baseUrl$_accountRegisterEndPoint');

  final body = json.encode({
    "username": userName,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber
  });

  try {
    final response = await http.post(url, headers: _headers, body: body);

    if (response.statusCode == 200) {

      final responseData = json.decode(response.body);
      toastmessege(responseData['msg'] != null ?'${responseData['msg']}' : '${responseData['error']}', responseData['msg'] != null ?Colors.green : Colors.red);
      if (responseData["msg"] == 'Admin registered successfully') {
          isLoading = false;
          isRegistered = true;
        }
    } else {

      if (response.headers['content-type']?.contains('application/json') ?? false) {

        final responseData = json.decode(response.body);
        toastmessege(responseData['msg'] != null ? '${responseData['msg']}':'${responseData['error']}', responseData['msg'] != null ? Colors.green : Colors.red);
        isLoading = false;
        if (responseData["msg"] == 'Admin registered successfully') {
          isLoading = false;
          isRegistered = true;
        }
      } else {
        isLoading = false;
        toastmessege('Failed to register admin. Status code: ${response.statusCode}. Response: ${response.body}', Colors.red);
      }
    }
    
  } catch (e) {
    isLoading = false;
    print('Error occurred: $e');
    toastmessege('An error occurred. Please try again.', Colors.red);
  }
  notifyListeners();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// Verify OTP /////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> verifyOtp(String otpNumber,String phoneNumber,String email) async {
    isLoading = true;
    final url = Uri.parse('$_baseUrl$_verifyOTPEndPoint');

    final body = json.encode({
      "email": email,
      "phoneNumber": phoneNumber,
      "otp": otpNumber,
    });

    try {
      final response = await http.post(
        url,
        headers: _headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        toastmessege(responseData['msg'] != null ?'${responseData['msg']}' : '${responseData['error']}', responseData['msg'] != null ?Colors.green : Colors.red);
        print('Success: $responseData');
        isLoading = false;

        if (responseData['msg'] != null) {

          token = responseData['token'];
          isLoading = false;
          isVerifyOTP = true;
        }
       
      } else {
        if (response.headers['content-type']?.contains('application/json') ?? false) {

        final responseData = json.decode(response.body);
        toastmessege(responseData['msg'] != null ?'${responseData['msg']}' : '${responseData['error']}', responseData['msg'] != null ?Colors.green : Colors.red);
        print('Response Data: $responseData');
        isLoading = false;
        if (responseData['msg'] != null) {

          token = responseData['token'];
          isVerifyOTP = true;
          isLoading = false;
          
        }
        } else {
        isLoading = false;
        toastmessege('Failed to login. Status code: ${response.statusCode}. Response: ${response.body}', Colors.red);
        }
      }
    } catch (e) {
      isLoading = false;
      print('Error occurred: $e');
      toastmessege('An error occurred. Please try again.', Colors.red);
    }
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// Login Admin ////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> loginAdmin(String phoneNumber,String password) async {
    isLoading = true;
    final url = Uri.parse('$_baseUrl$_loginEndPoint');

    final body = json.encode({
      "phoneNumber": phoneNumber,
      "password": password,
    });

    if (phoneNumber.split('').length >= 10 && password.split('').length > 3) {
      
      try {

      final response = await http.post(url, headers: _headers, body: body);

      if (response.statusCode == 200) {

        final responseData = json.decode(response.body);

        if (responseData['msg'] == null) {

        token = responseData['token'];
        isLoading = false;
        isLogedIn = true;

        } else {
          isLoading = false;
          toastmessege('${responseData['msg']}', Colors.red);
        } 
      } else {

        if (response.headers['content-type']?.contains('application/json') ?? false) {

        final responseData = json.decode(response.body);
        token = responseData['token'];
        toastmessege(responseData['msg'], Colors.red);
        isLoading = false;
        
        if (responseData['msg'] == null) {

        token = responseData['token'];
        isLoading = false;
        isLogedIn = true;

        } else {
          isLoading = false;
          toastmessege('${responseData['msg']}', Colors.red);
        } 

        } else {
        isLoading = false;
        toastmessege('Failed to login. Status code: ${response.statusCode}. Response: ${response.body}', Colors.red);
        }
      }
    }
     catch (e) {
      isLoading = false;
      print('Error occurred: $e');
      toastmessege('An error occurred. Please try again.', Colors.red);
    }
    
    } else {
      isLoading = false;
    toastmessege('Please enter your phone number and password correctly.', Colors.red);
    }
    notifyListeners();
  }
}