import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
        ],
      ),
    );
  }
}
