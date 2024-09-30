import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/respository/auth_respository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/routes/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool  _loading  =false;
  bool get loading => _loading;

  bool _signUploading=false;
  bool get signUploading => _signUploading;

setLoading(bool value){
  _loading=value;
  notifyListeners();
}
setSignUpLoading(bool value){
  _signUploading=value;
  notifyListeners();
}
  Future<void> loginApi(dynamic data,BuildContext context) async{
     setLoading(true);
     _myRepo.loginApi(data).then((value){
      setLoading(false);
      final userPreferences=Provider.of<UserViewModel>(context,listen:false);
     // userPreferences.saveUser(token:value['token'].toString());
      Utils.flushBarErrorMessage('Successful',context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }

     }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(),context);
      print(error.toString());
      }
     });
  }
   Future<void> SignUpApi(dynamic data,BuildContext context) async{
     setSignUpLoading(true);
     _myRepo.loginApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(' SignUp Successful',context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }

     }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(),context);
      print(error.toString());
      }
     });
  }

}