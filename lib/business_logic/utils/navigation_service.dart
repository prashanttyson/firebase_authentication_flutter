import 'package:flutter/material.dart';

class NavigationService{
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService()=> _instance;

  NavigationService._internal();

  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String _rn, {Map arguments}){
    return navigationKey.currentState.pushNamed(_rn, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String _rn, {Map arguments}){
    return navigationKey.currentState.pushReplacementNamed(_rn, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String _rn1, {Map arguments, String rn2}){
    return navigationKey.currentState.pushNamedAndRemoveUntil(_rn1,rn2!=null?
    ModalRoute.withName(rn2): (route)=>false,
        arguments: arguments);
  }

  popUntil(){
    navigationKey.currentState.popUntil((route) => route.isFirst);

  }

  goBack()=>navigationKey.currentState.pop();
}