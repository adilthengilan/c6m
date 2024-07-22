import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/db_connecting.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/login_and_signup.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/otp_verification.dart';

class AccountRegistrationScreen extends StatelessWidget {
  const AccountRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final login = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<DBConnecting>(
        builder: (context, dbconnection, child) { 
          return dbconnection.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.6,
                        width: width * 0.389,
                        child: Center(
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: login.accountRegistrationPage,
                            children: const [
                              SignUpScreen(),
                              OTPVerification(),
                              // LoginScreen(),
                            ],
                          ),
                        ),
                      ),
                      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      //////////////////////////////////////////////////////////////// Image ////////////////////////////////////////////////////////////////////////
                      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height * 0.97,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 172, 219, 246),
                            boxShadow: const [
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
                                width: width * 0.68,
                                decoration: const BoxDecoration(
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
              );
            },
      ),
    );
  }
}
