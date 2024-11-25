import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuch_trip_crms/src/view/desktop/Account_Registration/account_registration.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          leading: SizedBox(),
          backgroundColor: Color.fromRGBO(36, 94, 65, 1),
          title: Row(
            children: [
              Text(
                'TuchTrip.com',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
              sizedBox(0.0, 5.0),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '  Affiliated Partner Program',
                  style: GoogleFonts.pacifico(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              )
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountRegistrationScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 45, 114, 65),
                    borderRadius: BorderRadius.circular(5)),
                height: 35,
                width: 100,
                child: Center(
                    child: Text(
                  'Register',
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
              ),
            ),
            sizedBox(0.0, 10.0),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountRegistrationScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 33, 114, 56),
                    borderRadius: BorderRadius.circular(5)),
                height: 35,
                width: 100,
                child: Center(
                    child: Text(
                  'Login',
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
              ),
            ),
            sizedBox(0.0, 50.0),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height / 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.1, left: width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Join ',
                                style: GoogleFonts.poppins(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(10, 10, 10, 1)),
                              ),
                              Text(
                                'TuchTrip.com',
                                style: GoogleFonts.poppins(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(36, 94, 65, 1)),
                              )
                            ],
                          ),
                          Text(
                            'Register Your Property with tuchtrip.com \nExplore More Smart Features with tuchtrip.com',
                            style: GoogleFonts.antic(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                          sizedBox(height * 0.1, 0.0),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AccountRegistrationScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 45, 114, 65),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 45,
                              width: 120,
                              child: Center(
                                  child: Text(
                                'Register',
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: height / 0.7,
                    height: height / 1.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/lnding_bg.png'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 231, 231, 231),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(height * 0.05, 0.0),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'Why join with',
                          style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        Text(
                          ' TuchTrip.com',
                          style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(36, 94, 65, 1)),
                        )
                      ],
                    ),
                  ),
                  sizedBox(height * 0.02, 0.0),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Take your bussiness to next level with best innovative travel program portal',
                      style: GoogleFonts.antic(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(101, 101, 101, 1)),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Row(
                        children: List.generate(4, (index) {
                      final List<String> tempmages = [
                        'assets/images/smartkey.png',
                        'assets/images/smart-chekcins.png',
                        'assets/images/channelmanagers.png',
                        'assets/images/automatedaccounts.png'
                      ];
                      final List<dynamic> temptext = [
                        {
                          'head': 'Smart Key',
                          'sub':
                              "TuchTrip’s Smart Key ensures secure, hassle-free room access with just your smartphone."
                        },
                        {
                          'head': 'Smart-Checkin',
                          'sub':
                              "TuchTrip’s Smart Check-In offers seamless, contactless hotel entry for ultimate convenience."
                        },
                        {
                          'head': 'Channel Manager',
                          'sub':
                              "Channel Manager streamlines hotel bookings by syncing availability across multiple platforms effortlessly."
                        },
                        {
                          'head': 'Automated Accounts',
                          'sub':
                              "TuchTrip’s Automated Accounts simplify financial management with real-time tracking and seamless reporting."
                        }
                      ];
                      return Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBox(height * 0.1, 0.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 30),
                              child: Container(
                                height: height / 3.7,
                                width: width / 5.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(tempmages[index]),
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: Text(
                                temptext[index]['head'],
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: SizedBox(
                                width: width * 0.15,
                                child: Text(
                                  temptext[index]['sub'],
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
                  ),
                  sizedBox(50.0, 0.0),
                ],
              ),
            ),
            Container(
              height: height * 0.5,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Column(
                  children: [
                    sizedBox(100.0, 0.0),
                    Text(
                      'Book a Free Demo',
                      style: GoogleFonts.poppins(
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(36, 94, 65, 1)),
                    ),
                    sizedBox(20.0, 0.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 45, 114, 65),
                            borderRadius: BorderRadius.circular(5)),
                        height: 45,
                        width: 120,
                        child: Center(
                            child: Text(
                          'Free Demo',
                          style: GoogleFonts.poppins(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(36, 94, 65, 1),
              height: height * 0.5,
              child: Center(
                child: Column(
                  children: [
                    sizedBox(100.0, 0.0),
                    Text(
                      'Register Now',
                      style: GoogleFonts.poppins(
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    sizedBox(20.0, 0.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AccountRegistrationScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(5)),
                        height: 45,
                        width: 120,
                        child: Center(
                            child: Text(
                          'Register Now',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 45, 114, 65)),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
