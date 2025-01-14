

import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signUp_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch (settings.name){
      case RoutesName.home:
      return MaterialPageRoute(builder: (BuildContext)=>const HomeScreen());
      case RoutesName.login:
      return MaterialPageRoute(builder: (BuildContext)=>const LoginView());
      case RoutesName.signUp:
      return MaterialPageRoute(builder: (BuildContext)=>const SignUpView());
      case RoutesName.splash:
      return MaterialPageRoute(builder: (BuildContext)=>const SplashView());
      default:
      return MaterialPageRoute(builder: (_){
        return const Scaffold(
          body: Center(
            child: Text('No route defined'),
          ),
        );
      });

    }
  }
}