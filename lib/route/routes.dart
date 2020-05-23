import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:tata/pages/detail/editor.dart';
import 'package:tata/pages/home/login_page.dart';
import 'package:fluro/fluro.dart';
import './route_handler.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String calendar = "/clendar";
  static String editor = "/editor";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return LoginPage();
    });
    // router.define(root, handler: splashHandler);
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(calendar, handler: calendarHandler);
    router.define(editor, handler: editorHandler);

  }
}