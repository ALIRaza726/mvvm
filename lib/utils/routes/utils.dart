import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static void fieldFocusNode(
   BuildContext context,
   FocusNode current,
   FocusNode nextFocus)
   {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
   }
  static toastMessage(String message){
    Fluttertoast.showToast(
      msg:message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      backgroundColor: Color.fromARGB(255, 164, 161, 161),
      title: 'Error',
      reverseAnimationCurve: Curves.bounceInOut,
      messageColor: Colors.black,
      duration: Duration(seconds: 5),
    )..show(context));
  }
}