import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/model/getApi_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }
  @override
  Widget build(BuildContext context) {
    final userPreferences =Provider.of<UserViewModel>(context);
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [ InkWell(
            onTap: (){
            userPreferences.remove().then((value) {
             Navigator.pushNamed(context, RoutesName.login);
            });
            },
            child: Text('logout')),]
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context)=>homeViewModel,
        
        child: Consumer<HomeViewModel>(
          builder: (context,value, _){
          switch(value.moviesList.status){
            case Status.LOADING:
            return const CircularProgressIndicator();
            case Status.ERROR:
            return Text(value.moviesList.message.toString());
            case Status.COMPLETED:
            return ListView.builder(
              itemCount: value.moviesList.data!.movies!.length,
              itemBuilder: (context, index ){
                return  Card(
                  child: ListTile(
                    title: Text('${value.moviesList.data!.movies![index].tittle.toString()}'),
                  )
                );
                
              });
            
           
          }
         
        } ),
      )
    );
  }
}