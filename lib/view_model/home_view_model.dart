import 'package:flutter/material.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/getApi_model.dart';
import 'package:mvvm/respository/home_repository.dart';

 class HomeViewModel with ChangeNotifier{
  final _myRepo=HomeRepository();

  ApiResponse<Post> moviesList=ApiResponse.loading();
 
  setMoviesList(ApiResponse<Post> response){
    moviesList=response;
    notifyListeners();
  }
  Future<void> fetchMoviesListApi()async{
    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
       

    }).onError((error, stackTrace)  {

      setMoviesList(ApiResponse.error(error.toString()));
    });
  }


}