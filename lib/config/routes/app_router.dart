import 'package:flutter/material.dart';
import '/modules/dashboard/screens/home_screen/home_screen.dart';


class AppRouter {
  Route? onGenerateRoute (RouteSettings routeSettings){
    switch(routeSettings.name){

      case "/HomeScreen":
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);

      default:
        return null;

    }
  }
}