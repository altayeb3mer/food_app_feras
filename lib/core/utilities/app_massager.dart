

import 'package:flutter/material.dart';
import 'package:food_app/core/theme/text_style.dart';

class AppMassager{
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  // Function to show an info message
  static void showInfo(String message) {
    _showSnackBar(message,Colors.grey);
  }

  // Function to show an error message
  static void showError(String message) {
    _showSnackBar(message,Colors.red);
  }

  // Function to show a success message
  static void showSuccess(String message) {
    _showSnackBar(message,Colors.green);
  }


  static void _showSnackBar(String msg,Color color)async{
    final snackBar = SnackBar(
      content: Text(msg,
      style: AppTextStyle.textStyleTitleSmall(color: Colors.white),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      duration:const Duration(seconds: 3),
      margin:const EdgeInsets.only(top: 50, left: 20, right: 20),
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}