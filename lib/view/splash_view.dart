import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/splash_services.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices splashServices=SplashServices();
  @override
  void initState(){
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text('Splash Screen',style: TextStyle(color: Colors.black,fontSize: 25)),
      )
    );
  }
}
