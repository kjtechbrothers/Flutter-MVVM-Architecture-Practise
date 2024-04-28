import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

 static void fieldFocusChange(
     BuildContext context,
     FocusNode current,
     FocusNode nextFocus){
  current.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
 }


 static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }
  static void flushBarErrorMessage(String message,BuildContext context){
   showFlushbar(context: context,
       flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
           margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
           padding: const EdgeInsets.all(15),
           backgroundColor: Colors.red,
           reverseAnimationCurve: Curves.easeInOut,
           positionOffset: 20,
           icon: const Icon(Icons.error,size: 28,color: Colors.white,),
           message: message)..show(context));
  }
  static snackBar(String message,BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(
   SnackBar(content: Text(message))
  );
  }
}