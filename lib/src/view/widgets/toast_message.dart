
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessege(messege) {
  Fluttertoast.showToast(
    msg: messege,
    timeInSecForIosWeb: 4,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
    // textColor: isDarkMode? backgroundColor : primarycolor
  );
}