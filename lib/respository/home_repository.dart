import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/model/getApi_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository{
  
  BaseApiServices _apiServices = NetworkApiService();
  Future<Post> fetchMoviesList()async{
  try{


  dynamic response =await _apiServices.getGetApiResponse(AppUrl.Api2EndPointUrl);
   print('res: ${AppUrl.Api2EndPointUrl}');
  return response = Post.fromJson(response);
 


  }catch(e){
    throw e;
  }
  
}

}