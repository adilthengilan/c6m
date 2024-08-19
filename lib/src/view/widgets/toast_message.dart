
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessege({required String messege, required Color textcolor, ToastGravity? toastGravity = ToastGravity.TOP}) {
  Fluttertoast.showToast(
    msg: messege,
    timeInSecForIosWeb: 2,
    gravity: toastGravity,
    backgroundColor: Colors.white,
    textColor: textcolor,
    webBgColor: "linear-gradient(to right, #FFFFFF, #FFFFFF)",
  );
}