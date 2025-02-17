import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm/data/app_excaptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
   try{
    final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    responseJson = returnResponse(response);
   }on SocketException{
    throw FetchDataException('No internet connection');
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
dynamic responseJson;
   try{
    Response response=await post(Uri.parse(url),
    body: data).timeout(const Duration(seconds:10));
    responseJson = returnResponse(response);
   }on SocketException{
    throw FetchDataException('No internet connection');
   }
    return responseJson;
  }
  dynamic returnResponse (http.Response response){
    switch(response.statusCode){
      case 200:
      dynamic responseJson=jsonDecode(response.body);
      return responseJson;
      case 301:
      // Handle the redirection by using the 'Location' header
      String newUrl = response.headers['location'].toString();
      if (newUrl != null) {
        // You may choose to recursively fetch the new URL
        return getGetApiResponse(newUrl);
      } else {
        throw FetchDataException('Redirected but no new location found');
      }

      case 400:
      throw BadRequestException(response.body.toString());
      case 404:
      throw BadRequestException(response.body.toString());
      default:
      throw FetchDataException('Error accured while communicating with server'+'with status code'+response.statusCode.toString());

    }
  }

}