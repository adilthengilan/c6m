import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/db_connecting.dart';
import 'package:tuch_trip_crms/src/view%20model/accounts_management_provider.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/account_registration.dart';
import 'package:tuch_trip_crms/src/view/desktop/accounts_management/accounts_management_screen.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/Hotel/Hotels.dart';
import 'package:tuch_trip_crms/src/view/desktop/property_registration/registration_menu.dart';

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
      child: SingleChildScrollView(
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
                          hintStyle: GoogleFonts.poppins(),
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
                        hintStyle: GoogleFonts.poppins(),
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
                        hintStyle: GoogleFonts.poppins(),
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
                          hintStyle: GoogleFonts.poppins(),
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
                      if (login.userNameController.text.isEmpty ||
                          login.emailController.text.isEmpty ||
                          login.passwordController.text.isEmpty ||
                          login.mobileNumberController.text.isEmpty) {
                      } else {
                        login.registerAccount(
                            login.userNameController.text,
                            login.emailController.text,
                            login.passwordController.text,
                            login.mobileNumberController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Hotels(),
                          ),
                        );
                      }

                      // login.goToPage(
                      //     1, login.accountRegistrationPage, dbase.isRegistered);
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
                  sizedBox(height * 0.04, width),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: smallTextStyle),
                      sizedBox(0.0, width * 0.005),
                      InkWell(
                        onTap: () {
                          login.goToPage(
                              0, login.accountRegistrationPage, true);
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                              color: Colors.blue, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
    pagetaking(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dbase = Provider.of<DBConnecting>(context, listen: false);
    final login = Provider.of<LoginProvider>(context, listen: false);
    login.retriveFromPreferences('authtoken');
    print('===========${login.token}');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: SingleChildScrollView(
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
                  hintStyle: GoogleFonts.poppins(),
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
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
                    hintStyle: GoogleFonts.poppins(),
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
            Container(
              height: 50,
              width: width / 1.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: DropdownExample(),
              ),
            ),
            const SizedBox(height: 30),
            Consumer<AccountsManagementProvider>(
              builder: (context, value, child) => InkWell(
                onTap: () async {
                  // dbase.loginAdmin(
                  //   login.mobileNumberController.text,
                  //   login.passwordController.text,
                  // );

                  // while (true) {
                  //   await Future.delayed(const Duration(milliseconds: 300));
                  //   if (dbase.isLogedIn) {
                  //     // Call the function to navigate to the next Screen
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const HomePage(),
                  //       ),
                  //     );
                  //     // Clear the controllers
                  //     login.clearControllers();
                  //     // Exit the loop
                  //     break;
                  //   }
                  //   // Debug print to check the condition
                  //   // print('dbase.is Logined is false');
                  // }
                  // login.loginAccount(
                  //     login.userNameController.text,
                  //     login.emailController.text,
                  //     login.passwordController.text,
                  //     login.mobileNumberController.text);
                  if (value.dropdownValue == 'Reception') {
                    navigateToLogin(context, 'reception');
                  } else if (value.dropdownValue == 'Accounts') {
                    navigateToLogin(context, 'accounts');
                  } else if (value.dropdownValue == 'Admin') {
                    navigateToLogin(context, 'admin');
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
            ),
            sizedBox(height * 0.04, width),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: smallTextStyle),
                sizedBox(0.0, width * 0.005),
                InkWell(
                  onTap: () {
                    login.goToPage(1, login.accountRegistrationPage, true);
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountsManagementProvider>(
      builder: (context, value, child) => DropdownButton<String>(
        value: value.dropdownValue,
        hint: Text(
          'Select Department  ',
          style: GoogleFonts.poppins(),
        ),
        icon: Icon(Icons.arrow_downward),
        elevation: 16,
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        underline: Container(),
        onChanged: (String? newValue) {
          // setState(() {
          //   dropdownValue = newValue!;
          // });
          value.setDropDownValue(newValue);
        },
        items: <String>[
          'Admin',
          'Reception',
          'Accounts',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

void navigateToLogin(BuildContext context, navigation) {
  // Replace the current route with '/login'
  context.replace('/${navigation}');
}
