
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessege(messege,textcolor) {
  Fluttertoast.showToast(
    msg: messege,
    timeInSecForIosWeb: 2,
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.white,
    textColor: textcolor,
    webBgColor: "linear-gradient(to right, #FFFFFF, #FFFFFF)",
  );
}