import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/business_logic/utils/app_colors.dart';
import 'package:flutter_provider/business_logic/utils/navigation_service.dart';
import 'package:flutter_provider/business_logic/utils/route_constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {



  _timer() {
    Timer(Duration(seconds: 3), () async {

      NavigationService().pushNamedAndRemoveUntil(loginRoute,
          arguments: {'from': 'splash'});
      // }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer();
  }
  @override
  Widget build(BuildContext context) {
    return _mainUi();
  }


  Widget _mainUi() => Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.themeDarkGreen,
                  AppColors.themeLightGreen,
                  AppColors.themeDarkGreen
                ])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                'Auth Provider',
                style: TextStyle(
                    letterSpacing: 8.0,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: Colors.white),
              )
            ]),
      ));
}
