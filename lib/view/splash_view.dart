import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashservices=SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Center(
            child: Text('Splash'),
          ),
        ],
      ),
    );
  }
}