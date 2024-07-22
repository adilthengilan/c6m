import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch_trip_crms/src/db_connecting.dart';
import 'package:tuch_trip_crms/src/view%20model/login_provider.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final login = Provider.of<LoginProvider>(context, listen: false);
    final dBase = Provider.of<DBConnecting>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'OTP Verification',
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          sizedbox(height * 0.01, 0.0),
          SizedBox(
            width: width * 0.21,
            child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        children: [
          const TextSpan(text: 'Please check your email '),
          TextSpan(
            text: login.emailController.text,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
          const TextSpan(text: 'for the verification code required to complete the process'),
        ],
      ),
    ),
          ),
          sizedbox(height * 0.06, 0.0),
          OTPTextField(
            length: 4,
            onCompleted: (value) async {
              dBase.verifyOtp(
                value,
                login.mobileNumberController.text,
                login.emailController.text,
              );
              //starting the loop when you clicked
              while (true) {
              await Future.delayed(const Duration(milliseconds: 300));
              if (dBase.isVerifyOTP) {
              // Call the function to navigate to the next Screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              // Clear the controllers
              login.clearControllers();
              // Exit the loop
              break;
            }
            // Debug print to check the condition
            // print('dbase.isVeriry OTP is Not True');
            }
            },
          ),
          sizedbox(height * 0.12, 0.0),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.01,
            ),
            child: InkWell(
              onTap: () async {
              login.navigateToGmail();
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
                    "Check Inbox",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          sizedbox(height * 0.04, 0.0),
          InkWell(
            onTap: () {},
            child: Text(
              'Resend OTP',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// OTP Verification Field /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class OTPTextField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const OTPTextField({required this.length, this.onCompleted});

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 242, 255),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          width: 40,
          height: 40,
          child: Center(
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1 && index < widget.length - 1) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
                // Combine all OTP digits and pass it to the parent widget
                String otp = _controllers.map((controller) => controller.text).join();
                if (otp.length == widget.length) {
                  widget.onCompleted?.call(otp);
                }
              },
              decoration: InputDecoration(
                  counterText: '',
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ),
      ),
    );
  }
}
