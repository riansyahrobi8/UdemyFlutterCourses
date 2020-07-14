import 'package:flutter/material.dart';
import 'package:ud_flutter_complexapp/HomeView.dart';
import 'package:ud_flutter_complexapp/route/routing_constants.dart';
import 'package:ud_flutter_complexapp/screens/FirstScreen.dart';
import 'package:ud_flutter_complexapp/screens/SecondScreen.dart';
import 'package:ud_flutter_complexapp/screens/ThirdScreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case firstScreen:
      return MaterialPageRoute(builder: (context) => FirstScreen());
    case secondScreen:
      return MaterialPageRoute(builder: (context) => SecondScreen());
    case thirdScreen:
      return MaterialPageRoute(builder: (context) => ThirdScreen());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
