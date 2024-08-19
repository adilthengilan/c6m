import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/db_connecting.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final login = Provider.of<LoginProvider>(context, listen: false);
    final dbase = Provider.of<DBConnecting>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please use your Detailes to Sign up',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(07)),
                  child: TextField(
                    controller: login.userNameController,
                    decoration: InputDecoration(
                        hintText: 'User Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(07)),
                  child: TextField(
                    controller: login.mobileNumberController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12),
                    ],
                    ignorePointers: false,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(07)),
                  child: TextField(
                    controller: login.emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(07)),
                  child: Consumer<LoginProvider>(
                    builder: (context, person, child) => TextField(
                      controller: login.passwordController,
                      obscureText: person.isVisiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            person.showPassword();
                          },
                          icon: Icon(
                            person.isVisiblePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () async {
                    // dbase.registerAdmin(
                    //   login.userNameController.text,
                    //   login.emailController.text,
                    //   login.passwordController.text,
                    //   login.mobileNumberController.text,
                    // );
                    // while (true) {
                    //   await Future.delayed(const Duration(milliseconds: 300));
                    //   if (dbase.isRegistered) {
                    //     // Call the function to navigate to the next page
                    //     login.goToPage(1, login.accountRegistrationPage,
                    //         dbase.isRegistered);
                    //     login.clearControllers();
                    //     // Exit the loop
                    //     break;
                    //   }
                    //   // Debug print to check the condition
                    //   // print('dbase.isRegistered is false');
                    // }
                    login.goToPage(
                        1, login.accountRegistrationPage, dbase.isRegistered);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.700,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 105, 227, 255),
                          Color.fromARGB(255, 255, 167, 248),
                        ]),
                        borderRadius: BorderRadius.circular(07)),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// Login ////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dbase = Provider.of<DBConnecting>(context, listen: false);
    final login = Provider.of<LoginProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please use your Phone Number and password to login',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(07)),
            child: TextField(
              controller: login.mobileNumberController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12),
              ],
              ignorePointers: false,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                labelStyle: const TextStyle(color: Colors.black),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(07)),
            child: Consumer<LoginProvider>(
              builder: (context, person, child) => TextField(
                controller: login.passwordController,
                obscureText: person.isVisiblePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      person.showPassword();
                    },
                    icon: Icon(
                      person.isVisiblePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () async {
              dbase.loginAdmin(
                login.mobileNumberController.text,
                login.passwordController.text,
              );
              while (true) {
                await Future.delayed(const Duration(milliseconds: 300));
                if (dbase.isLogedIn) {
                  // Call the function to navigate to the next Screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                  // Clear the controllers
                  login.clearControllers();
                  // Exit the loop
                  break;
                }
                // Debug print to check the condition
                // print('dbase.is Logined is false');
              }
            },
            child: Container(
              height: height * 0.07,
              width: width * 0.700,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 105, 227, 255),
                    Color.fromARGB(255, 255, 167, 248),
                  ]),
                  borderRadius: BorderRadius.circular(07)),
              child: Center(
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
