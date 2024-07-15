import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/view/desktop/dashboard/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(07),
        border: Border.all(
          color: const Color.fromARGB(255, 206, 206, 206),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: greyTextStyle,
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
        ),
      ),
    );
  }
}
