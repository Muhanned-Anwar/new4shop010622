import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
    int time = 1,
    double marginHorizontal = 20,
    double marginVertical= 20,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: time),
        margin: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: marginVertical),
      ),
    );
  }
}
