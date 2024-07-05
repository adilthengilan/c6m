import 'package:flutter/material.dart';
import 'package:tuch_trip_crms/src/view/desktop/dashboard/dashboard.dart';

void customShowDialog(BuildContext context, String title, String content, String buttonText,TextStyle buttonTextStyle) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(title, style: mediumTextStyleBold),
        content: Text(content, style: smallTextStyle),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel', style: smallTextStyle),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              buttonText,
              style: buttonTextStyle,
            ),
            onPressed: () {
              // Perform some action
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
