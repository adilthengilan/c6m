import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/view/desktop/desktop_view.dart';

class JobRequestScreen extends StatelessWidget {
  const JobRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppAppBar(pageName: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.45,
            color: Colors.white,
            child: Column(
              children: [
                
              ],
            ),
          )
        ],
      ),
    );
  }
}