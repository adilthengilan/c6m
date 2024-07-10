import 'package:flutter/material.dart';

void customShowDialog(BuildContext context,Widget widget) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}