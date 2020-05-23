import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tata/application.dart';
import 'package:tata/pages/calender/calendar.dart';
import 'package:tata/pages/home/home.dart';
import 'package:tata/pages/home/login_page.dart';
import 'package:tata/provider/time_provider.dart';
import 'package:tata/route/routes.dart';
import 'package:tata/route/navigate_service.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TimeModel>(
        create: (_) => TimeModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TATA',
      navigatorKey: Application.getIt<NavigateService>().key,
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      // routes: {
      //   "home": (context) => Home(),
      //   "calendar": (context) => CalendarPage()
      // },
    );
  }
}
