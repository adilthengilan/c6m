import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController mobilenumbercontrollor = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.16, right: width * 0.07),
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
                          SizedBox(height: 8),
                          Text(
                            'Please use your employee ID and password to login',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(07)),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: ' Employee ID',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onChanged: (value) {
                                context
                                    .read<LoginProvider>()
                                    .updateEmployeeId(value);
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(07)),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'Department',
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              value: context.watch<LoginProvider>().department,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Reception'),
                                  value: 'Reception',
                                ),
                                // Add more departments as needed
                              ],
                              onChanged: (value) {
                                context
                                    .read<LoginProvider>()
                                    .updateDepartment(value!);
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(07)),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onChanged: (value) {
                                context
                                    .read<LoginProvider>()
                                    .updatePassword(value);
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Color.fromARGB(255, 89, 26, 100),
                                value:
                                    context.watch<LoginProvider>().keepLoggedIn,
                                onChanged: (value) {
                                  context
                                      .read<LoginProvider>()
                                      .toggleKeepLoggedIn(value!);
                                },
                              ),
                              Text(
                                'Keep me logged in',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            height: height * 0.07,
                            width: width * 0.700,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 105, 227, 255),
                                  Color.fromARGB(255, 255, 167, 248),
                                ]),
                                borderRadius: BorderRadius.circular(07)),
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.97,
                  width: width * 0.400,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 172, 219, 246),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-2, -2),
                        color: Color.fromARGB(31, 156, 156, 156),
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.11),
                        height: height * 0.50,
                        width: width * 0.50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/erty-removebg-preview.png"),
                          ),
                        ),
                      ),
                      sizedbox(height * 0.05, width),
                      Text(
                        'Manage Your Hotel Efficiently',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      sizedbox(height * 0.01, width),
                      SizedBox(
                        width: width * 0.25,
                        child: Text(
                          'Access all the tools you need to manage reservations, oversee staff, and ensure smooth operations',
                          style: GoogleFonts.montserrat(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      sizedbox(height * 0.05, width),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // This is an indicator that displays a list of images with 3 dots.
  Widget showingIndicators(height) {
    return Consumer<LoginProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          value.getStartedImage.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 08),
            width: value.currentPage == index ? 10 : 10,
            height: height * 0.01,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
          ),
        ),
      ),
    );
  }
}
