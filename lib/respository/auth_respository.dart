import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository{
BaseApiServices _apiServices = NetworkApiService();

Future<dynamic> loginApi(dynamic data)async{
  try{


  dynamic response =await _apiServices.getPostApiResponse(AppUrl.loginEndPointUrl, data);
  return response;


  }catch(e){
    throw e;
  }
}

Future<dynamic> SignUpApi(dynamic data)async{
  try{
dynamic response =await _apiServices.getPostApiResponse(AppUrl.registerEndPointUrl, data);

  }catch(e){
    throw e;
  }
}
}