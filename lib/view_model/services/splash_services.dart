

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashServices{
 
  Future<UserModel> getUserData() => UserViewModel().getUser();
   void checkAuthentication(BuildContext context)async{

  
  getUserData().then((value)async{
    if(value.token=='null' || value==''){
      await Future.delayed(Duration(seconds:  3));
      Navigator.pushNamed(context, RoutesName.login );

    }
    else{
     await Future.delayed(Duration(seconds:  3));
      Navigator.pushNamed(context,RoutesName.signUp);
    }

  }).onError((error,StackTrace){
  if(kDebugMode){
    print(error.toString());
  }
  });
}
}