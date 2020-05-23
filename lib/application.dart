import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tata/route/navigate_service.dart';

class Application{
  static Router router;
  static GlobalKey<NavigatorState> key = GlobalKey();
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;
  static double bottomBarHeight;
  static GetIt getIt = new GetIt.asNewInstance();

  static setupLocator(){
    getIt.registerSingleton(NavigateService());
  }
}